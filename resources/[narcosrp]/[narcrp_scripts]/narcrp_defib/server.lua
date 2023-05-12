local ESX = nil
local ambulancesConnected = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountAmbulances()
	local xPlayers = ESX.GetPlayers()
	ambulancesConnected = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			ambulancesConnected = ambulancesConnected + 1
		end
	end
	SetTimeout(5000, CountAmbulances)
end
CountAmbulances()

RegisterServerEvent('defib:getAmbulancesCount')
AddEventHandler('defib:getAmbulancesCount', function()
  TriggerClientEvent('defib:useDefib', source, ambulancesConnected)
end)
