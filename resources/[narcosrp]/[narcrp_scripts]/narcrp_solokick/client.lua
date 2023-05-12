local wait = 2*60*1000
Citizen.CreateThread(function()
	Citizen.Wait(wait) -- Delay first spawn.
	while true do
		TriggerServerEvent('sendSession:PlayerNumber', #GetActivePlayers())
		Citizen.Wait(wait)
	end
end)
