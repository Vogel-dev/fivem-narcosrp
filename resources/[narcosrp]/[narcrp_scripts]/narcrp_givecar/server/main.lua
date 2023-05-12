ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--give car with a random plate- 1: carModel (2: playerID)
TriggerEvent('es:addGroupCommand', 'give.car', 'superadmin', function(source, args, user)
	if args[2] ~= nil then
		local playerName = GetPlayerName(args[2])
		TriggerClientEvent('esx_giveownedcar:spawnVehicle',source,args[1],args[2],playerName,'player')
	else
		local sourceID = source
		local playerName = GetPlayerName(sourceID)
		TriggerClientEvent('esx_giveownedcar:spawnVehicle',source,args[1],sourceID,playerName,'player')
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Give car with a random plate', params = {{name = "car", help = 'Name of the car model'}, {name = "id", help = 'The ID of player (default is yourself)'}}})

RegisterCommand('_givecar', function(source, args)
    if source == 0 then		
		if args[2] ~= nil then
			local sourceID = args[2]
			local playerName = GetPlayerName(sourceID)
			TriggerClientEvent('esx_giveownedcar:spawnVehicle',sourceID,args[1],args[2],playerName,'console')			
		else
			print('ERROR: you need type playerID')			
		end				
	end
end)

RegisterServerEvent('esx_giveownedcar:printToConsole')
AddEventHandler('esx_giveownedcar:printToConsole', function(msg)
	print(msg)
end)

--give car with custom plate- 1: carModel 2: plate (3: playerID)
TriggerEvent('es:addGroupCommand', 'give.carplate', 'superadmin', function(source, args, user)
	if args[1] == nil then
		sendNotification(source, '/give.carplate [carModel] [plate] [playerID]', 'warning', 5000)
	else
		if args[2] == nil then
			sendNotification(source, 'Nie wpisałeś rejestracji pojazdu.', 'warning', 5000)
		else
			if args[3] ~= nil then
				local playerName = GetPlayerName(args[3])
				TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',source,args[1],args[2],args[3],playerName,'player')
			else
				local sourceID = source
				local playerName = GetPlayerName(sourceID)
				TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',source,args[1],args[2],sourceID,playerName,'player')
			end
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Give car with custom plate', params = {{name = "car", help = 'Name of the car model'}, {name = "plate", help = 'The car plate'}, {name = "id", help = 'The ID of player (default is yourself)'}}})

RegisterCommand('_givecarplate', function(source, args)
    if source == 0 then	
		if args[1] == nil then
			print('ERROR: _givecar [carModel] [plate] [playerID]')
		else
			if args[2] == nil then
				print('ERROR: you need type car plate')
			else
				if args[3] ~= nil then
					local sourceID = args[3]
					local playerName = GetPlayerName(sourceID)
					TriggerClientEvent('esx_giveownedcar:spawnVehiclePlate',sourceID,args[1],args[2],args[3],playerName,'console')
				else
					print('ERROR: you need type playerID')
				end
			end		
		end
	end
end)

RegisterServerEvent('esx_giveownedcar:setVehicle')
AddEventHandler('esx_giveownedcar:setVehicle', function (vehicleProps, playerID)
	local _source = playerID
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state) VALUES (@owner, @plate, @vehicle, @state)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@state']  = 1
	}, function ()
		if Config.ReceiveMsg then
			sendNotification(_source, 'Otrzymałeś dokumenty i zestaw kluczy do pojazdu '..string.upper(vehicleProps.plate)..'', 'info', 5000)
		end
	end)
end)


--delete car by plate
TriggerEvent('es:addGroupCommand', 'delcarplate', 'superadmin', function(source, args, user)	
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = args[1]
	})
	sendNotification(source, 'Usunąłeś pojazd o rejestracji '..args[1]..'', 'info', 5000)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Delete a owned car by plate', params = {{name = "plate", help = 'The car plate'}}})

RegisterCommand('_delcarplate', function(source, args)
    if source == 0 then
		MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
			['@plate'] = args[1]
		})
		print('Deleted Car Plate: ' ..args[1])
	end
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