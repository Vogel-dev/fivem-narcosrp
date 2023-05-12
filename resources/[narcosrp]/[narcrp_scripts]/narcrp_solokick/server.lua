RegisterServerEvent('sendSession:PlayerNumber')
AddEventHandler('sendSession:PlayerNumber', function(clientPlayerNumber)
	if source ~= nil then
		local serverPlayerNumber = #GetPlayers()
		if serverPlayerNumber-clientPlayerNumber > 5 then 
			DropPlayer(source, '[KICK] NARCOS RP - Zostałeś wyrzucony za solo sesję.') -- Kick player
			print("^1[SOLO-KICK] Server-"..serverPlayerNumber.." / Client-"..clientPlayerNumber.."^0") -- Debug
		end
	end
end)
