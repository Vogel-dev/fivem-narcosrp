ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 121) then
			TriggerServerEvent("kossek-antylua:kick")
		end
	end
end)
