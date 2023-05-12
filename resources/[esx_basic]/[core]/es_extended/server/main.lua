AddEventHandler('es:playerLoaded', function(source, _player)
	local _source = source
	local tasks   = {}

	local userData = {
		accounts     = {},
		inventory    = {},
		job          = {},
		loadout      = {},
		playerName   = GetPlayerName(_source),
		lastPosition = nil
	}

	TriggerEvent('es:getPlayerFromId', _source, function(player)

		-- Update user name in DB
		table.insert(tasks, function(cb)
			MySQL.Async.execute('UPDATE `users` SET `name` = @name WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier(),
				['@name']       = userData.playerName
			}, function(rowsChanged)
				cb()
			end)
		end)

		-- Get accounts
		table.insert(tasks, function(cb)
			MySQL.Async.fetchAll('SELECT * FROM `user_accounts` WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier()
			}, function(accounts)

				for i=1, #Config.Accounts, 1 do
					for j=1, #accounts, 1 do
						if accounts[j].name == Config.Accounts[i] then
							table.insert(userData.accounts, {
								name  = accounts[j].name,
								money = accounts[j].money,
								label = Config.AccountLabels[accounts[j].name]
							})
						end
					end
				end

				cb()
			end)
		end)

		-- Get inventory
		table.insert(tasks, function(cb)

			MySQL.Async.fetchAll('SELECT * FROM `user_inventory` WHERE `identifier` = @identifier', {
				['@identifier'] = player.getIdentifier()
			}, function(inventory)

				local tasks2 = {}

				for i=1, #inventory, 1 do
					table.insert(userData.inventory, {
						name = inventory[i].item,
						count = inventory[i].count,
						label = ESX.Items[inventory[i].item].label,
						limit = ESX.Items[inventory[i].item].limit,
						usable = ESX.UsableItemsCallbacks[inventory[i].item] ~= nil,
						rare = ESX.Items[inventory[i].item].rare,
						canRemove = ESX.Items[inventory[i].item].canRemove
					})
				end

				for k,v in pairs(ESX.Items) do
					local found = false

					for j=1, #userData.inventory, 1 do
						if userData.inventory[j].name == k then
							found = true
							break
						end
					end

					if not found then

						table.insert(userData.inventory, {
							name = k,
							count = 0,
							label = ESX.Items[k].label,
							limit = ESX.Items[k].limit,
							usable = ESX.UsableItemsCallbacks[k] ~= nil,
							rare = ESX.Items[k].rare,
							canRemove = ESX.Items[k].canRemove
						})

						local scope = function(item, identifier)

							table.insert(tasks2, function(cb2)
								MySQL.Async.execute('INSERT INTO user_inventory (identifier, item, count) VALUES (@identifier, @item, @count)', {
									['@identifier'] = identifier,
									['@item'] = item,
									['@count'] = 0
								}, function(rowsChanged)
									cb2()
								end)
							end)

						end

						scope(k, player.getIdentifier())

					end

				end

				Async.parallelLimit(tasks2, 5, function(results) end)

				table.sort(userData.inventory, function(a,b)
					return a.label < b.label
				end)

				cb()
			end)

		end)

		-- Get job and loadout
		table.insert(tasks, function(cb)

			local tasks2 = {}

			-- Get job name, grade and last position
			table.insert(tasks2, function(cb2)

				MySQL.Async.fetchAll('SELECT job, job_grade, loadout, position FROM `users` WHERE `identifier` = @identifier', {
					['@identifier'] = player.getIdentifier()
				}, function(result)
					local job, grade = result[1].job, tostring(result[1].job_grade)

					if ESX.DoesJobExist(job, grade) then
						local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

						userData.job = {}

						userData.job.id    = jobObject.id
						userData.job.name  = jobObject.name
						userData.job.label = jobObject.label

						userData.job.grade        = tonumber(grade)
						userData.job.grade_name   = gradeObject.name
						userData.job.grade_label  = gradeObject.label
						userData.job.grade_salary = gradeObject.salary

						userData.job.skin_male    = {}
						userData.job.skin_female  = {}

						if gradeObject.skin_male ~= nil then
							userData.job.skin_male = json.decode(gradeObject.skin_male)
						end
			
						if gradeObject.skin_female ~= nil then
							userData.job.skin_female = json.decode(gradeObject.skin_female)
						end
					else
						print(('es_extended: %s had an unknown job [job: %s, grade: %s], setting as unemployed!'):format(player.getIdentifier(), job, grade))

						local job, grade = 'unemployed', '0'
						local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

						userData.job = {}

						userData.job.id    = jobObject.id
						userData.job.name  = jobObject.name
						userData.job.label = jobObject.label
			
						userData.job.grade        = tonumber(grade)
						userData.job.grade_name   = gradeObject.name
						userData.job.grade_label  = gradeObject.label
						userData.job.grade_salary = gradeObject.salary
			
						userData.job.skin_male    = {}
						userData.job.skin_female  = {}
					end

					if result[1].loadout ~= nil then
						userData.loadout = json.decode(result[1].loadout)

						-- Compatibility with old loadouts prior to components update
						for k,v in ipairs(userData.loadout) do
							if v.components == nil then
								v.components = {}
							end
						end
					end

					if result[1].position ~= nil then
						userData.lastPosition = json.decode(result[1].position)
					end

					cb2()
				end)

			end)

			Async.series(tasks2, cb)

		end)

		-- Run Tasks
		Async.parallel(tasks, function(results)

			local xPlayer = CreateExtendedPlayer(player, userData.accounts, userData.inventory, userData.job, userData.loadout, userData.playerName, userData.lastPosition)

			xPlayer.getMissingAccounts(function(missingAccounts)

				if #missingAccounts > 0 then

					for i=1, #missingAccounts, 1 do
						table.insert(xPlayer.accounts, {
							name  = missingAccounts[i],
							money = 0,
							label = Config.AccountLabels[missingAccounts[i]]
						})
					end

					xPlayer.createAccounts(missingAccounts)
				end

				ESX.Players[_source] = xPlayer

				TriggerEvent('esx:playerLoaded', _source, xPlayer)

				TriggerClientEvent('esx:playerLoaded', _source, {
					identifier   = xPlayer.identifier,
					accounts     = xPlayer.getAccounts(),
					inventory    = xPlayer.getInventory(),
					job          = xPlayer.getJob(),
					loadout      = xPlayer.getLoadout(),
					lastPosition = xPlayer.getLastPosition(),
					money        = xPlayer.getMoney()
				})

				xPlayer.displayMoney(xPlayer.getMoney())

			end)

		end)

	end)

end)

AddEventHandler('playerDropped', function(reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil then
		TriggerEvent('esx:playerDropped', _source, reason)

		ESX.SavePlayer(xPlayer, function()
			ESX.Players[_source]        = nil
			ESX.LastPlayerData[_source] = nil
		end)
	end
end)

RegisterServerEvent('esx:updateLoadout')
AddEventHandler('esx:updateLoadout', function(loadout)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.loadout = loadout
end)

RegisterServerEvent('esx:updateLastPosition')
AddEventHandler('esx:updateLastPosition', function(position)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setLastPosition(position)
end)

RegisterServerEvent('esx:giveInventoryItem')
AddEventHandler('esx:giveInventoryItem', function(target, type, itemName, itemCount)
	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == 'item_standard' then

		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then

			if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				sendNotification(_source, 'Akcja jest niemożliwa, nie możesz mieć więcej.', 'error', 5000)
			else
				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem   (itemName, itemCount)
				
				sendNotification(_source, 'Przekazałeś x'..itemCount..' '..ESX.Items[itemName].label..' dla '..targetXPlayer.name..'.', 'success', 5000)
				sendNotification(target, 'Otrzymałeś x'..itemCount..' '..ESX.Items[itemName].label..' od '..sourceXPlayer.name..'.', 'success', 5000)

				TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount)
			end

		else
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		end

	elseif type == 'item_money' then

		if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then

			sourceXPlayer.removeMoney(itemCount)
			targetXPlayer.addMoney   (itemCount)

			sendNotification(_source, 'Przekazałeś '..ESX.Math.GroupDigits(itemCount)..' $ dla '..targetXPlayer.name..'.', 'success', 5000)
			sendNotification(target, 'Otrzymałeś '..ESX.Math.GroupDigits(itemCount)..' $ od '..sourceXPlayer.name..'.', 'success', 5000)

			TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount)

		else
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		end

	elseif type == 'item_account' then

		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then

			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney   (itemName, itemCount)
			sendNotification(_source, 'Przekazałeś '..ESX.Math.GroupDigits(itemCount)..' ('..Config.AccountLabels[itemName]..') $ dla '..targetXPlayer.name..'.', 'success', 5000)
			sendNotification(target, 'Otrzymałeś '..ESX.Math.GroupDigits(itemCount)..' ('..Config.AccountLabels[itemName]..') $ od '..sourceXPlayer.name..'.', 'success', 5000)

			TriggerEvent("esx:givemoneybankalert",sourceXPlayer.name,targetXPlayer.name,itemCount)

		else
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		end

	elseif type == 'item_weapon' then

		if not targetXPlayer.hasWeapon(itemName) then

			sourceXPlayer.removeWeapon(itemName)
			targetXPlayer.addWeapon(itemName, itemCount)

			local weaponLabel = ESX.GetWeaponLabel(itemName)

			if itemCount > 0 then
				sendNotification(_source, 'Przekazałeś '..weaponLabel..' z '..itemCount..' kulami dla '..targetXPlayer.name..'.', 'success', 5000)
				sendNotification(target, 'Otrzymałeś '..weaponLabel..' z '..itemCount..' kulami od '..sourceXPlayer.name..'.', 'success', 5000)
				TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel)
			else
				sendNotification(_source, 'Przekazałeś '..weaponLabel..' dla '..targetXPlayer.name..'.', 'success', 5000)
				sendNotification(target, 'Otrzymałeś '..weaponLabel..' od '..sourceXPlayer.name..'.', 'success', 5000)
			end

		else
			sendNotification(_source, ''..targetXPlayer.name..' już posiada '..weaponLabel..'.', 'warning', 5000)
			sendNotification(target, ''..sourceXPlayer.name..' próbował Ci przekazać '..weaponLabel..', ale już posiadasz tą broń.', 'warning', 5000)
		end

	end

end)

RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(type, itemName, itemCount)
	local _source = source

	if type == 'item_standard' then

		if itemCount == nil or itemCount < 1 then
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		else

			local xPlayer = ESX.GetPlayerFromId(source)
			local xItem = xPlayer.getInventoryItem(itemName)

			if (itemCount > xItem.count or xItem.count < 1) then
				sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
			else
				xPlayer.removeInventoryItem(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(xItem.label, itemCount)
				ESX.CreatePickup('item_standard', itemName, itemCount, pickupLabel, _source)
				sendNotification(_source, 'Wyrzuciłeś na ziemie x'..itemCount..' '..xItem.label..'.', 'info', 5000)
			end

		end

	elseif type == 'item_money' then

		if itemCount == nil or itemCount < 1 then
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		else

			local xPlayer = ESX.GetPlayerFromId(source)
			local playerCash = xPlayer.getMoney()

			if (itemCount > playerCash or playerCash < 1) then
				sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
			else
				xPlayer.removeMoney(itemCount)

				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(_U('cash'), _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_money', 'money', itemCount, pickupLabel, _source)
				sendNotification(_source, 'Wyrzuciłeś na ziemie '..ESX.Math.GroupDigits(itemCount)..' $.', 'info', 5000)
			end

		end

	elseif type == 'item_account' then

		if itemCount == nil or itemCount < 1 then
			sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
		else

			local xPlayer = ESX.GetPlayerFromId(source)
			local account = xPlayer.getAccount(itemName)

			if (itemCount > account.money or account.money < 1) then
				sendNotification(_source, 'Wartość nieprawidłowa.', 'error', 5000)
			else
				xPlayer.removeAccountMoney(itemName, itemCount)

				local pickupLabel = ('~y~%s~s~ [~g~%s~s~]'):format(account.label, _U('locale_currency', ESX.Math.GroupDigits(itemCount)))
				ESX.CreatePickup('item_account', itemName, itemCount, pickupLabel, _source)
				sendNotification(_source, 'Wyrzuciłeś na ziemie '..ESX.Math.GroupDigits(itemCount)..' ('..string.lower(account.label)..') $.', 'info', 5000)
			end

		end

	elseif type == 'item_weapon' then

		local xPlayer = ESX.GetPlayerFromId(source)
		local loadout = xPlayer.getLoadout()

		for i=1, #loadout, 1 do
			if loadout[i].name == itemName then
				itemCount = loadout[i].ammo
				break
			end
		end

		if xPlayer.hasWeapon(itemName) then
			local weaponLabel, weaponPickup = ESX.GetWeaponLabel(itemName), 'PICKUP_' .. string.upper(itemName)

			xPlayer.removeWeapon(itemName)

			if itemCount > 0 then
				TriggerClientEvent('esx:pickupWeapon', _source, weaponPickup, itemName, itemCount)
				sendNotification(_source, 'Wyrzuciłeś na ziemie '..weaponLabel..' z x'..itemCount..' kulami.', 'info', 5000)
			else
				-- workaround for CreateAmbientPickup() giving 30 rounds of ammo when you drop the weapon with 0 ammo
				TriggerClientEvent('esx:pickupWeapon', _source, weaponPickup, itemName, 1)
				sendNotification(_source, 'Wyrzuciłeś na ziemie '..weaponLabel..'.', 'info', 5000)
			end
		end

	end

end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count   = xPlayer.getInventoryItem(itemName).count

	if count > 0 then
		ESX.UseItem(source, itemName)
	else
		sendNotification(_source, 'Działanie niemożliwe.', 'error', 5000)
	end
end)

RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function(id)
	local _source = source
	local pickup  = ESX.Pickups[id]
	local xPlayer = ESX.GetPlayerFromId(_source)

	if pickup.type == 'item_standard' then

		local item      = xPlayer.getInventoryItem(pickup.name)
		local canTake   = ((item.limit == -1) and (pickup.count)) or ((item.limit - item.count > 0) and (item.limit - item.count)) or 0
		local total     = pickup.count < canTake and pickup.count or canTake
		local remaining = pickup.count - total

		TriggerClientEvent('esx:removePickup', -1, id)

		if total > 0 then
			xPlayer.addInventoryItem(pickup.name, total)
		end

		if remaining > 0 then
			sendNotification(_source, 'Nie posiadasz wystarczająco miejsca w ekwipunku, aby podnieść '..item.label..'.', 'warning', 5000)

			local pickupLabel = ('~y~%s~s~ [~b~%s~s~]'):format(item.label, remaining)
			ESX.CreatePickup('item_standard', pickup.name, remaining, pickupLabel, _source)
		end

	elseif pickup.type == 'item_money' then
		TriggerClientEvent('esx:removePickup', -1, id)
		xPlayer.addMoney(pickup.count)
	elseif pickup.type == 'item_account' then
		TriggerClientEvent('esx:removePickup', -1, id)
		xPlayer.addAccountMoney(pickup.name, pickup.count)
	end
end)

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		loadout      = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition(),
		money        = xPlayer.getMoney()
	})
end)

ESX.RegisterServerCallback('esx:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	cb({
		identifier   = xPlayer.identifier,
		accounts     = xPlayer.getAccounts(),
		inventory    = xPlayer.getInventory(),
		job          = xPlayer.getJob(),
		loadout      = xPlayer.getLoadout(),
		lastPosition = xPlayer.getLastPosition(),
		money        = xPlayer.getMoney()
	})
end)

TriggerEvent("es:addGroup", "jobmaster", "user", function(group) end)

ESX.StartDBSync()
ESX.StartPayCheck()

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end
