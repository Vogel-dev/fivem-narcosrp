ESX = nil
--Tościk#9715
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
---
RegisterServerEvent('tostKajdany:PlayWithinDistance')
AddEventHandler('tostKajdany:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('tostKajdany2:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)
---

RegisterServerEvent('tostKajdany:narcrp_logs')
AddEventHandler('tostKajdany:narcrp_logs', function(targeter)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targeterXPlayer = ESX.GetPlayerFromId(targeter)
end)

RegisterServerEvent('tostKajdany:confiscatePlayerItem')
AddEventHandler('tostKajdany:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		if targetItem.count > 0 and targetItem.count <= amount then
		
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
				sendNotification(_source, 'Nieprawidłowa ilość...', 'error', 5000)
			else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				sendNotification(_source, 'Skonfiskowałeś '..sourceItem.label.. ' w ilości '..amount.. ' osobie '..target..'', 'success', 5000)
				sendNotification(target, 'Zabrano ci '..sourceItem.label..' w ilości '..amount.. ' przez ' .._source..'', 'warning', 5000)
				
				local PlayerName = GetPlayerName(_source)
				local TargetName = GetPlayerName(target)
				local message = "Gracz **" .. PlayerName .. "** skonfiskował graczowi ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** " .. sourceItem.label .. " " .. amount .. "[szt]"
				narcrp_logs("Kajdanki - konfiskata",PlayerName,message,sourceXPlayer.identifier,16711968)
			end
		else
			sendNotification(_source, 'Nieprawidłowa ilość...', 'error', 5000)
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)
		sendNotification(_source, 'Skonfiskowałeś '..itemName.. ' w ilości '..amount.. ' osobie '..target..'', 'success', 5000)
		sendNotification(target, 'Zabrano ci '..itemName.. ' w ilości '..amount..' przez '.._source..'', 'warning', 5000)
		
		local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** skonfiskował graczowi ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** " .. itemName .. " " .. amount .. "[szt]"
		narcrp_logs("Kajdanki - konfiskata",PlayerName,message,sourceXPlayer.identifier,16711968)

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)
		sendNotification(target, 'Skonfiskowano ci broń '..ESX.GetWeaponLabel(itemName).. ' z amunicją '..amount.. ' przez '.._source..'', 'info', 5000)
		sendNotification(_source, 'Skonfiskowałeś '..ESX.GetWeaponLabel(itemName).. ' z amunicją ' ..amount.. ' osobie '..target..'', 'info', 5000)
		
		local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** skonfiskował graczowi ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** " .. ESX.GetWeaponLabel(itemName) .. " z amunicją " .. amount .. "[szt]"
		narcrp_logs("Kajdanki - konfiskata",PlayerName,message,sourceXPlayer.identifier,16711968)
	end
end)

RegisterServerEvent('tostKajdany:handcuff')
AddEventHandler('tostKajdany:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
		TriggerClientEvent('tostKajdany:handcuff', target)
		sendNotification(target, 'Zostałeś zakuty/rozkuty przez: '..source..'', 'info', 5000)
		sendNotification(source, 'Zakuwasz / Rozkuwasz: '..target..'', 'success', 5000)
		
		
		local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** użył kajdanek na graczu ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** "
		narcrp_logs("Kajdanki - Skucie / Rozkucie",PlayerName,message,xPlayer.identifier,16098851)
end)

RegisterServerEvent('tostKajdany:drag')
AddEventHandler('tostKajdany:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('tostKajdany:drag', target, source)

	local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** eskortuje gracza ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** "
		narcrp_logs("Kajdanki - Eskorta",PlayerName,message,xPlayer.identifier,4886754)
	
end)

RegisterServerEvent('tostKajdany:putInVehicle')
AddEventHandler('tostKajdany:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('tostKajdany:putInVehicle', target)
	
	local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** wsadził do samochodu gracza ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** "
		narcrp_logs("Kajdanki - Wsadzenie do samochodu",PlayerName,message,xPlayer.identifier,4289797)
end)

RegisterServerEvent('tostKajdany:OutVehicle')
AddEventHandler('tostKajdany:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('tostKajdany:OutVehicle', target)
	
	local PlayerName = GetPlayerName(source)
		local TargetName = GetPlayerName(target)
		local message = "Gracz **" .. PlayerName .. "** wyjął z samochodu gracza ***" .. TargetName .. "[" .. targetXPlayer.identifier .. "]*** "
		narcrp_logs("Kajdanki - Wyjęcie z samochodu",PlayerName,message,xPlayer.identifier,8311585)
	
end)

ESX.RegisterServerCallback('tostKajdany:getOtherPlayerData', function(source, cb, target)

	if Config.EnableESXIdentity then

		local xPlayer = ESX.GetPlayerFromId(target)

		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end

	else

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

	end

end)

function narcrp_logs (title,name,message,steamID,color)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697552373135966299/SEQgMFvTSdRXAYpJnNak8aT83zruTNBMs_8flMJvK05lpNz849nTHoqJ9YsNvZx59MHg", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

ESX.RegisterServerCallback('tostKajdany:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

ESX.RegisterUsableItem('kaje', function(source)
	TriggerClientEvent('tostKajdany:MenuKajdanek', source)
	Wait(2000)
end)

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end