
Key = 201 -- ENTER

vehicleWashStation = {
	{2084.74, 853.97, 21.55},
	{-261.44, 988.76, 5.58},
	{-1146.43, 537.15, 6.18},
	{-1065.18, 2224.99, 26.82},
	{1751.27, 618.34, 22.42}
}


Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100) -- 100 = carwash
		SetBlipColour(stationBlip, 1)
		SetBlipScale(stationBlip, 0.9)
		SetBlipAsShortRange(stationBlip, true)
	end
    return
end)

function es_carwash_DrawSubtitleTimed(m_text, showtime)
	SetTextEntry_2('STRING')
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function es_carwash_DrawNotification(m_text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(m_text)
	DrawNotification(true, false)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]
				DrawMarker(1, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 200, 100, 100, 55, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
					if IsControlJustPressed(1, Key) then
						TriggerServerEvent('es_carwash:checkmoney')
					end
				end
			end
		end
	end
end)

RegisterNetEvent('es_carwash:success')
AddEventHandler('es_carwash:success', function (price)
	WashDecalsFromVehicle(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1.0)
	SetVehicleDirtLevel(GetVehiclePedIsUsing(GetPlayerPed(-1)))
	sendNotification('Twój pojazd został wyczyszczony za '..price..' $', 'success', 5000)
end)

RegisterNetEvent('es_carwash:notenoughmoney')
AddEventHandler('es_carwash:notenoughmoney', function (moneyleft)
	sendNotification('Nie posiadasz wystarczającej sumy pieniędzy '..moneyleft..' $', 'warning', 5000)
end)

RegisterNetEvent('es_carwash:free')
AddEventHandler('es_carwash:free', function ()
	WashDecalsFromVehicle(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1.0)
	SetVehicleDirtLevel(GetVehiclePedIsUsing(GetPlayerPed(-1)))
	sendNotification('Twój pojazd został umyty za darmo.', 'success', 5000)
end)

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end
