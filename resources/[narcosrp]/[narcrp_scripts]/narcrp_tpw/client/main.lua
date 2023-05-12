local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

RegisterCommand("tpw", function(source)
    TeleportToWaypoint()
end)

TeleportToWaypoint = function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        if playerRank == "superadmin" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                sendNotification('Teleportacja do punktu pomyślna.', 'success', 5000)
                TriggerServerEvent("serverlog", "text_to_log")
            else
                sendNotification('Oznacz punkt na mapie.', 'warning', 5000)
            end
        else
            sendNotification('Nie posiadasz odpowiednich uprawnień.', 'error', 5000)
        end
    end)
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