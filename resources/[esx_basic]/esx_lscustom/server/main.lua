ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local Vehicles = nil

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	price = tonumber(price)

	if Config.IsmecanoJobOnly then

		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
			societyAccount = account
		end)
		if price < societyAccount.money then
			TriggerClientEvent('esx_lscustom:installMod', _source)
			sendNotification(_source, 'Pomyślnie zakupiłeś część.', 'success', 5000)
			societyAccount.removeMoney(price)
			local message = "Gracz **"..PlayerName.."** zapłacił za tuning **" ..price .. "**$"
        	narcrp_logs("Tuning - Montaż tuningu",PlayerName,message,xPlayer.identifier,0x20df42)
		else
			TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
			sendNotification(_source, 'Nie posiadasz wystarczającej ilości pieniędzy.', 'success', 5000)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end

	else

		if price < xPlayer.getMoney() then
			TriggerClientEvent('esx_lscustom:installMod', _source)
			sendNotification(_source, 'Pomyślnie zakupiłeś część.', 'success', 5000)
			xPlayer.removeMoney(price)
			local message = "Gracz **"..PlayerName.."** zapłacił za tuning **" ..price .. "**$"
        	narcrp_logs("Tuning - Montaż tuningu",PlayerName,message,xPlayer.identifier,0x20df42)
		else
			TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
			sendNotification(_source, 'Nie posiadasz wystarczającej ilości pieniędzy.', 'success', 5000)
		end

	end
end)

RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
	{
		['@plate']   = myCar.plate,
		['@vehicle'] = json.encode(myCar)
	})
end)

ESX.RegisterServerCallback('esx_lscustom:getVehiclesPrices', function(source, cb)
	if Vehicles == nil then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				table.insert(vehicles, {
					model = result[i].model,
					price = result[i].price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697553257802760263/4b9uOLa8AsNUXV-8BgSLgVS4Jr-Br_53QpcuCzwilJPbiYJ-RjR6VGNL2JGbE1jTM4mT", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
	end

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end