ESX = nil
local HaveBagOnHead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function NajblizszyGracz() --This function send to server closestplayer

local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
local player = GetPlayerPed(-1)

if closestPlayer == -1 or closestDistance > 2.0 then 
    sendNotification('Brak gracza w pobliżu.', 'error', 5000)
else
  if not HaveBagOnHead then
    TriggerServerEvent('esx_worek:sendclosest', GetPlayerServerId(closestPlayer))
    sendNotification('Założyłeś worek na głowę ' .. GetPlayerName(closestPlayer)..'.', 'success', 5000)
    TriggerServerEvent('esx_worek:closest')
  else
    sendNotification('Ten gracz ma już na głowie worek.', 'warning', 5000)
  end
end

end

RegisterNetEvent('esx_worek:naloz') --This event open menu
AddEventHandler('esx_worek:naloz', function()
    OpenBagMenu()
end)

RegisterNetEvent('esx_worek:nalozNa') --This event put head bag on nearest player
AddEventHandler('esx_worek:nalozNa', function(gracz)
    local playerPed = GetPlayerPed(-1)
    Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true) -- Create head bag object!
    AttachEntityToEntity(Worek, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
    SetNuiFocus(false,false)
    SendNUIMessage({type = 'openGeneral'})
    HaveBagOnHead = true
end)    

AddEventHandler('playerSpawned', function() --This event delete head bag when player is spawn again
DeleteEntity(Worek)
SetEntityAsNoLongerNeeded(Worek)
SendNUIMessage({type = 'closeAll'})
HaveBagOnHead = false
end)

RegisterNetEvent('esx_worek:zdejmijc') --This event delete head bag from player head
AddEventHandler('esx_worek:zdejmijc', function(gracz)
    sendNotification('Ktoś zdjął Ci worek z głowy!', 'info', 5000)
    DeleteEntity(Worek)
    SetEntityAsNoLongerNeeded(Worek)
    SendNUIMessage({type = 'closeAll'})
    HaveBagOnHead = false
end)

function OpenBagMenu() --This function is menu function

    local elements = {
          {label = 'Założ worek na głowę', value = 'puton'},
          {label = 'Zdejmij worek z głowy', value = 'putoff'},
          
        }
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'Worek',
        align    = 'bottom-right',
        elements = elements
        },
  
            function(data2, menu2)
  
  
              local player, distance = ESX.Game.GetClosestPlayer()
  
              if distance ~= -1 and distance <= 2.0 then
  
                if data2.current.value == 'puton' then
                    NajblizszyGracz()
                end
  
                if data2.current.value == 'putoff' then
                  TriggerServerEvent('esx_worek:zdejmij')
                end
              else
                sendNotification('Brak gracza w pobliżu.', 'error', 5000)
              end
            end,
      function(data2, menu2)
        menu2.close()
      end
    )
  
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

