ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



function ShowAdvancedNotification(title, subject, msg, icon, iconType)


	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)

end
RegisterNetEvent('esx:dowod_pokazdowod')
AddEventHandler('esx:dowod_pokazdowod', function(id, imie, data, dodatek)


local praca = PlayerData.job.label

  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))
  if pid == myId then
ShowAdvancedNotification(imie, data, dodatek, mugshotStr, 8)

  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
 ShowAdvancedNotification(imie, data, dodatek, mugshotStr, 8)

  end
  
  UnregisterPedheadshot(mugshot)

end)

RegisterNetEvent('esx:dowod_wiz')
AddEventHandler('esx:dowod_wiz', function(id, imie, dodatek)


local praca = PlayerData.job.label

  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))
  if pid == myId then
ShowAdvancedNotification(imie, '', dodatek, mugshotStr, 8)

  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
 ShowAdvancedNotification(imie, '', dodatek, mugshotStr, 8)

  end
  
  UnregisterPedheadshot(mugshot)

end)
CreateThread(function()
	while true do 
Citizen.Wait(5000)
TriggerServerEvent('esx_dowod:dajitem', GetPlayerPed(-1))
TriggerServerEvent('esx_dowod:dajwiz', GetPlayerPed(-1))


     end
end)



