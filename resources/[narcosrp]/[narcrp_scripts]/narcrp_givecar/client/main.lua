ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_giveownedcar:spawnVehicle')
AddEventHandler('esx_giveownedcar:spawnVehicle', function(model, playerID, playerName, type)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local carExist  = false

	ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info
		if DoesEntityExist(vehicle) then
			carExist = true
			SetEntityVisible(vehicle, false, false)
			SetEntityCollision(vehicle, false)
			
			local newPlate     = exports.esx_vehicleshop:GeneratePlate()
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			vehicleProps.plate = newPlate
			TriggerServerEvent('esx_giveownedcar:setVehicle', vehicleProps, playerID)
			ESX.Game.DeleteVehicle(vehicle)	
			if type ~= 'console' then
				sendNotification('Pojazd '..model..' o tablicach '..newPlate..' został dodany do garażu '..playerName..'.', 'success', 5000)
			else
				local msg = ('addCar: ' ..model.. ', plate: ' ..newPlate.. ', toPlayer: ' ..playerName)
				TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
			end				
		end		
	end)
	
	Wait(1000)
	if not carExist then
		if type ~= 'console' then
			sendNotification('Model pojazdu niepoprawny.', 'error', 5000)
		else
			TriggerServerEvent('esx_giveownedcar:printToConsole', "ERROR: unknown car")
		end		
	end
end)

RegisterNetEvent('esx_giveownedcar:spawnVehiclePlate')
AddEventHandler('esx_giveownedcar:spawnVehiclePlate', function(model, plate, playerID, playerName, type)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local generatedPlate = string.upper(plate)
	local carExist  = false

	ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function (isPlateTaken)
		if not isPlateTaken then
			ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info	
				if DoesEntityExist(vehicle) then
					carExist = true
					SetEntityVisible(vehicle, false, false)
					SetEntityCollision(vehicle, false)	
					
					local newPlate     = string.upper(plate)
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					vehicleProps.plate = newPlate
					TriggerServerEvent('esx_giveownedcar:setVehicle', vehicleProps, playerID)
					ESX.Game.DeleteVehicle(vehicle)
					if type ~= 'console' then
						sendNotification('Pojazd '..model..' o tablicach '..newPlate..' został dodany do garażu '..playerName..'.', 'success', 5000)
					else
						local msg = ('addCar: ' ..model.. ', plate: ' ..newPlate.. ', toPlayer: ' ..playerName)
						TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
					end				
				end
			end)
		else
			carExist = true
			if type ~= 'console' then
				sendNotification('Pojazd o podanej tablicy rejestracyjnej już istnieje.', 'warning', 5000)
			else
				local msg = ('ERROR: this plate is already been used on another vehicle')
				TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
			end					
		end
	end, generatedPlate)
	
	Wait(1000)
	if not carExist then
		if type ~= 'console' then
			sendNotification('Model pojazdu niepoprawny.', 'error', 5000)
		else
			TriggerServerEvent('esx_giveownedcar:printToConsole', "ERROR: unknown car")
		end		
	end	
end)

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end