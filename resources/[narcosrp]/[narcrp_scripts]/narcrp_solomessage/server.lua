RegisterServerEvent('FaxSM:CheckSession')
AddEventHandler('FaxSM:CheckSession', function(clientPlayerNumber)
	if source ~= nil then
		serverPlayerNumber = countPlayer()
		if serverPlayerNumber-clientPlayerNumber > 4 then 
			TriggerClientEvent(source, "FaxSM:SendMessage")
		end
	end
end)

function countPlayer() -- Get players connected
	local joinedpeeps = 0
	for _ in pairs(GetPlayers()) do
		joinedpeeps = joinedpeeps + 1
	end
	return joinedpeeps
end