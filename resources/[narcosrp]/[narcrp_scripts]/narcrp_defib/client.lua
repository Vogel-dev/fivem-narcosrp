-- Name of defibrillator item in database
local defibItemName = 'medikit'

Citizen.CreateThread(function()
	while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
	end
  
	while true do
		Citizen.Wait(10)
		if(IsControlJustReleased(1, 311))then
      TriggerServerEvent('defib:getAmbulancesCount')
		end
	end
end)

RegisterNetEvent("defib:useDefib")
AddEventHandler("defib:useDefib", function(ambulancesConnected)
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  if ambulancesConnected > 0 then
    sendNotification('Lekarz dostępny, jak najszybciej skontaktuj się z karetką pogotowia.', 'error', 5000)
  elseif closestPlayer == -1 or closestDistance > 3.0 then
    --sendNotification('W pobliżu nie ma żadnej osoby.', 'warning', 5000)
  else
    ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
      if qtty > 0 then
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)
        
        if health == 0 then
          local playerPed = GetPlayerPed(-1)
          
          sendNotification('Trwa udzielanie pierwszej pomocy...', 'info', 10000)
          TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
          Citizen.Wait(10000)
          ClearPedTasks(playerPed)
          
          TriggerServerEvent('esx_ambulancejob:removeItem',defibItemName)
          TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
        else
          sendNotification('Ta osoba nie potrzebuje pierwszej pomocy.', 'warning', 5000)
        end
      else
        sendNotification('Nie posiadasz ze sobą apteczki pierwsze pomocy.', 'error', 5000)
      end
    end, defibItemName)
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
