----------------------------------------------
-- External Vehicle Commands, Made by FAXES --
----------------------------------------------

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterCommand("bagaznik", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 5

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            sendNotification('Bagażnik został zamknięty.', 'info', 5000)
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            sendNotification('Bagażnik został otwarty.', 'info', 5000)
        end
    else
        if distanceToVeh < 6 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                sendNotification('Bagażnik został zamknięty.', 'info', 5000)
            else
                SetVehicleDoorOpen(vehLast, door, false, false)
                sendNotification('Bagażnik został otwarty.', 'info', 5000)
            end
        else
            sendNotification('Jesteś zbyt daleko od pojazdu.', 'info', 5000)
        end
    end
end)

RegisterCommand("maska", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    local door = 4

    if IsPedInAnyVehicle(ped, false) then
        if GetVehicleDoorAngleRatio(veh, door) > 0 then
            SetVehicleDoorShut(veh, door, false)
            sendNotification('Maska została zamknięta.', 'info', 5000)
        else	
            SetVehicleDoorOpen(veh, door, false, false)
            sendNotification('Maska została otwarta.', 'info', 5000)
        end
    else
        if distanceToVeh < 4 then
            if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                SetVehicleDoorShut(vehLast, door, false)
                sendNotification('Maska została zamknięta.', 'info', 5000)
            else	
                SetVehicleDoorOpen(vehLast, door, false, false)
                sendNotification('Maska została otwarta.', 'info', 5000)
            end
        else
            sendNotification('Jesteś zbyt daleko od pojazdu.', 'info', 5000)
        end
    end
end)

RegisterCommand("drzwi", function(source, args, raw)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsUsing(ped)
    local vehLast = GetPlayersLastVehicle()
    local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(vehLast), 1)
    
    if args[1] == "1" then -- Przednie Lewe Door
        door = 0
    elseif args[1] == "2" then -- Przednie Prawe Door
        door = 1
    elseif args[1] == "3" then -- Tylne Lewe Door
        door = 2
    elseif args[1] == "4" then -- Tylne Prawe Door
        door = 3
    else
        door = nil
        sendNotification('Użycie: /drzwi [drzwi].', 'info', 5000)
        sendNotification('1 (Przednie Lewe drzwi), 2 (Przednie Prawe drzwi).', 'info', 5000)
        sendNotification('3 (Tylne Lewe drzwi), 4 (Tylne Prawe drzwi)', 'info', 5000)
    end

    if door ~= nil then
        if IsPedInAnyVehicle(ped, false) then
            if GetVehicleDoorAngleRatio(veh, door) > 0 then
                SetVehicleDoorShut(veh, door, false)
                sendNotification('Drzwi zostały zamknięte.', 'info', 5000)
            else	
                SetVehicleDoorOpen(veh, door, false, false)
                sendNotification('Drzwi zostały otwarte.', 'info', 5000)
            end
        else
            if distanceToVeh < 4 then
                if GetVehicleDoorAngleRatio(vehLast, door) > 0 then
                    SetVehicleDoorShut(vehLast, door, false)
                    sendNotification('Drzwi zostały zamknięte.', 'info', 5000)
                else	
                    SetVehicleDoorOpen(vehLast, door, false, false)
                    sendNotification('Drzwi zostały otwarte.', 'info', 5000)
                end
            else
                sendNotification('Jesteś zbyt daleko od pojazdu.', 'info', 5000)
            end
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