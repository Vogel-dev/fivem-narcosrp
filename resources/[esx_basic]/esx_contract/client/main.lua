ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_contract:getVehicle')
AddEventHandler('esx_contract:getVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local closestPlayer, playerDistance = ESX.Game.GetClosestPlayer()

	if closestPlayer ~= -1 and playerDistance <= 3.0 then
		local vehicle = ESX.Game.GetClosestVehicle(coords)
		local vehiclecoords = GetEntityCoords(vehicle)
		local vehDistance = GetDistanceBetweenCoords(coords, vehiclecoords, true)
		if DoesEntityExist(vehicle) and (vehDistance <= 3) then
			local vehProps = ESX.Game.GetVehicleProperties(vehicle)
			sendNotification('Umowa sprzedaży na pojazd o rejestracji '..vehProps.plate..'.', 'info', 5000)
			TriggerServerEvent('esx_clothes:sellVehicle', GetPlayerServerId(closestPlayer), vehProps.plate)
		else
			sendNotification('Brak pojazdu w pobliżu.', 'warning', 5000)
		end
	else
		sendNotification('Brak kupca w pobliżu.', 'warning', 5000)
	end
	
end)

RegisterNetEvent('esx_contract:showAnim')
AddEventHandler('esx_contract:showAnim', function(player)
	loadAnimDict('anim@amb@nightclub@peds@')
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, false)
	Citizen.Wait(20000)
	ClearPedTasks(PlayerPedId())
end)


function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end