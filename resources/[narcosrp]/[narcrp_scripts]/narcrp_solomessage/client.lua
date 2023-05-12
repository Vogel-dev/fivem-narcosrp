Citizen.CreateThread(function()
	Wait(30000) -- Small delay (30s)
	while true do
		TriggerServerEvent('FaxSM:CheckSession', GetNumberOfPlayers()) -- Start solo check via server
		Wait(60000)
	end
end)

RegisterNetEvent('FaxSM:SendMessage')
AddEventHandler('FaxSM:SendMessage', function()
	DrawText("Możliwe że jesteś na solo sesji.")		
end)

function DrawText(text)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.45)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.10)
end