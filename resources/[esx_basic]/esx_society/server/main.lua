ESX = nil
local Jobs = {}
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetSociety(name)
	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			return RegisteredSocieties[i]
		end
	end
end

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM jobs', {})

	for i=1, #result, 1 do
		Jobs[result[i].name]        = result[i]
		Jobs[result[i].name].grades = {}
	end

	local result2 = MySQL.Sync.fetchAll('SELECT * FROM job_grades', {})

	for i=1, #result2, 1 do
		Jobs[result2[i].job_name].grades[tostring(result2[i].grade)] = result2[i]
	end
end)

AddEventHandler('esx_society:registerSociety', function(name, label, account, datastore, inventory, data)
	local found = false

	local society = {
		name      = name,
		label     = label,
		account   = account,
		datastore = datastore,
		inventory = inventory,
		data      = data,
	}

	for i=1, #RegisteredSocieties, 1 do
		if RegisteredSocieties[i].name == name then
			found = true
			RegisteredSocieties[i] = society
			break
		end
	end

	if not found then
		table.insert(RegisteredSocieties, society)
	end
end)

AddEventHandler('esx_society:getSocieties', function(cb)
	cb(RegisteredSocieties)
end)

AddEventHandler('esx_society:getSociety', function(name, cb)
	cb(GetSociety(name))
end)

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call withdrawMoney!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
		if amount > 0 and account.money >= amount then
			account.removeMoney(amount)
			xPlayer.addMoney(amount)

			sendNotification(xPlayer.source, 'Wypłaciłeś '..ESX.Math.GroupDigits(amount)..'', 'success', 5000)
			
			local PlayerName = GetPlayerName(source)
		local message = "Gracz **" .. PlayerName .. "** wypłacił z frakcji ***" .. xPlayer.job.name .. "*** " .. amount .. "$"
		BetonoweLogi("Frakcja - Wypłata pieniędzy",PlayerName,message,xPlayer.identifier,14224142)
			
		else
			sendNotification(xPlayer.source, 'Nieprawidłowa wartość', 'error', 5000)
		end
	end)
end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local society = GetSociety(society)
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society.name then
		print(('esx_society: %s attempted to call depositMoney!'):format(xPlayer.identifier))
		return
	end

	if amount > 0 and xPlayer.getMoney() >= amount then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			xPlayer.removeMoney(amount)
			account.addMoney(amount)
		end)

		sendNotification(xPlayer.source, 'Zdeponowałeś '..ESX.Math.GroupDigits(amount)..'', 'success', 5000)
		
		local PlayerName = GetPlayerName(source)
		local message = "Gracz **" .. PlayerName .. "** wpłacił do frakcji ***" .. xPlayer.job.name .. "*** " .. amount .. "$"
		BetonoweLogi("Frakcja - Wpłata pieniędzy",PlayerName,message,xPlayer.identifier,14224142)
		
	else
		sendNotification(xPlayer.source, 'Nieprawidłowa wartość', 'error', 5000)
	end
end)

RegisterServerEvent('esx_society:washMoney')
AddEventHandler('esx_society:washMoney', function(society, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local account = xPlayer.getAccount('black_money')
	amount = ESX.Math.Round(tonumber(amount))

	if xPlayer.job.name ~= society then
		print(('esx_society: %s attempted to call washMoney!'):format(xPlayer.identifier))
		return
	end

	if amount and amount > 0 and account.money >= amount then
		xPlayer.removeAccountMoney('black_money', amount)

		MySQL.Async.execute('INSERT INTO society_moneywash (identifier, society, amount) VALUES (@identifier, @society, @amount)', {
			['@identifier'] = xPlayer.identifier,
			['@society']    = society,
			['@amount']     = amount
		}, function(rowsChanged)
			sendNotification(xPlayer.source, 'Oczekujesz na wypranie '..ESX.Math.GroupDigits(amount)..' przez 24 godziny.', 'info', 5000)
		end)
	else
		sendNotification(xPlayer.source, 'Nieprawidłowa wartość', 'error', 5000)
	end

end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function(societyName, vehicle)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		table.insert(garage, vehicle)
		store.set('garage', garage)
	end)
end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function(societyName, vehicle)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}

		for i=1, #garage, 1 do
			if garage[i].plate == vehicle.plate then
				table.remove(garage, i)
				break
			end
		end

		store.set('garage', garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:getSocietyMoney', function(source, cb, societyName)
	local society = GetSociety(societyName)

	if society then
		TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
			cb(account.money)
		end)
	else
		cb(0)
	end
end)

ESX.RegisterServerCallback('esx_society:getEmployees', function(source, cb, society)
	if Config.EnableESXIdentity then

		MySQL.Async.fetchAll('SELECT firstname, lastname, identifier, job, job_grade FROM users WHERE job = @job ORDER BY job_grade DESC', {
			['@job'] = society
		}, function (results)
			local employees = {}

			for i=1, #results, 1 do
				table.insert(employees, {
					name       = results[i].firstname .. ' ' .. results[i].lastname,
					identifier = results[i].identifier,
					job = {
						name        = results[i].job,
						label       = Jobs[results[i].job].label,
						grade       = results[i].job_grade,
						grade_name  = Jobs[results[i].job].grades[tostring(results[i].job_grade)].name,
						grade_label = Jobs[results[i].job].grades[tostring(results[i].job_grade)].label
					}
				})
			end

			cb(employees)
		end)
	else
		MySQL.Async.fetchAll('SELECT name, identifier, job, job_grade FROM users WHERE job = @job ORDER BY job_grade DESC', {
			['@job'] = society
		}, function (result)
			local employees = {}

			for i=1, #result, 1 do
				table.insert(employees, {
					name       = result[i].name,
					identifier = result[i].identifier,
					job = {
						name        = result[i].job,
						label       = Jobs[result[i].job].label,
						grade       = result[i].job_grade,
						grade_name  = Jobs[result[i].job].grades[tostring(result[i].job_grade)].name,
						grade_label = Jobs[result[i].job].grades[tostring(result[i].job_grade)].label
					}
				})
			end

			cb(employees)
		end)
	end
end)

ESX.RegisterServerCallback('esx_society:getJob', function(source, cb, society)
	local job    = json.decode(json.encode(Jobs[society]))
	local grades = {}

	for k,v in pairs(job.grades) do
		table.insert(grades, v)
	end

	table.sort(grades, function(a, b)
		return a.grade < b.grade
	end)

	job.grades = grades

	cb(job)
end)


ESX.RegisterServerCallback('esx_society:setJob', function(source, cb, identifier, job, grade, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local isBoss = xPlayer.job.grade_name == 'boss'

	if isBoss then
		local xTarget = ESX.GetPlayerFromIdentifier(identifier)

		if xTarget then
			xTarget.setJob(job, grade)

			if type == 'hire' then
				sendNotification(xTarget.source, 'Zostałeś zatrudniony do '..job..'.', 'info', 5000)
			elseif type == 'promote' then
				sendNotification(xTarget.source, 'Zostałeś awansowany.', 'info', 5000)
			elseif type == 'fire' then
				sendNotification(xTarget.source, 'Zostałeś zwolniony - '..xTarget.getJob().label..'', 'info', 5000)
			end

			cb()
		else
			MySQL.Async.execute('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier', {
				['@job']        = job,
				['@job_grade']  = grade,
				['@identifier'] = identifier
			}, function(rowsChanged)
				cb()
			end)
		end
	else
		print(('esx_society: %s attempted to setJob'):format(xPlayer.identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:setJobSalary', function(source, cb, job, grade, salary)
	local isBoss = isPlayerBoss(source, job)
	local identifier = GetPlayerIdentifier(source, 0)
	local xPlayer = ESX.GetPlayerFromId(source)

	if isBoss then
		if salary <= Config.MaxSalary then
			MySQL.Async.execute('UPDATE job_grades SET salary = @salary WHERE job_name = @job_name AND grade = @grade', {
				['@salary']   = salary,
				['@job_name'] = job,
				['@grade']    = grade
			}, function(rowsChanged)
				Jobs[job].grades[tostring(grade)].salary = salary
				local xPlayers = ESX.GetPlayers()

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

					if xPlayer.job.name == job and xPlayer.job.grade == grade then
						xPlayer.setJob(job, grade)
					end
				end

				cb()
			end)
			local PlayerName = GetPlayerName(source)
		local message = "Gracz **" .. PlayerName .. "** zmienił wypłatę dla rangi ***" .. job .."[" .. grade .."]" .. "*** na " .. salary .. "$"
		BetonoweLogi("Frakcja - Wypłata pieniędzy",PlayerName,message,xPlayer.identifier,16515327)
		else
			print(('esx_society: %s attempted to setJobSalary over config limit!'):format(identifier))
			cb()
		end
	else
		print(('esx_society: %s attempted to setJobSalary'):format(identifier))
		cb()
	end
end)

ESX.RegisterServerCallback('esx_society:getOnlinePlayers', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local players  = {}

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		table.insert(players, {
			source     = xPlayer.source,
			identifier = xPlayer.identifier,
			name       = xPlayer.name,
			job        = xPlayer.job
		})
	end

	cb(players)
end)

ESX.RegisterServerCallback('esx_society:getVehiclesInGarage', function(source, cb, societyName)
	local society = GetSociety(societyName)

	TriggerEvent('esx_datastore:getSharedDataStore', society.datastore, function(store)
		local garage = store.get('garage') or {}
		cb(garage)
	end)
end)

ESX.RegisterServerCallback('esx_society:isBoss', function(source, cb, job)
	cb(isPlayerBoss(source, job))
end)

function isPlayerBoss(playerId, job)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == job and xPlayer.job.grade_name == 'boss' then
		return true
	else
		print(('esx_society: %s attempted open a society boss menu!'):format(xPlayer.identifier))
		return false
	end
end

function BetonoweLogi (title,name,message,steamID,color)
    local embeds = {
        {
			["title"] = title,
			["type"] = "rich",
			["description"] = message,
			["color"] = color,
			--		["timestamp"] = os.time(),
			["footer"] =  {
				["icon_url"] = "https://i.imgur.com/6aPjIDn.png",
				["text"] = steamID,
			},
			["author"] = {
				["name"] = name,
				["url"] = "http://narcosrp.pl",
				["icon_url"] = "https://i.imgur.com/3vnUDSl.png",
            }
        }
    }
    
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest("https://discordapp.com/api/webhooks/693640404263895133/cR8xQvqKp84Yfbcq2I6LbmO-ycXOOjrz3RoeqdlZ5W4sA5UcGhjNlRoaMQnlNcekS5ny", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

function WashMoneyCRON(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM society_moneywash', {}, function(result)
		for i=1, #result, 1 do
			local society = GetSociety(result[i].society)
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)

			-- add society money
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				account.addMoney(result[i].amount)
			end)

			-- send notification if player is online
			if xPlayer then
				sendNotification(xPlayer.source, 'Pomyślnie wyprałeś '..ESX.Math.GroupDigits(result[i].amount)..'', 'success', 5000)
			end

			MySQL.Async.execute('DELETE FROM society_moneywash WHERE id = @id', {
				['@id'] = result[i].id
			})
		end
	end)
end

TriggerEvent('cron:runAt', 3, 0, WashMoneyCRON)

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end
