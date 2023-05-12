local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('cyber_scoreboard:getplayers')
AddEventHandler('cyber_scoreboard:getplayers', function()		

	local _source = source
	local xPlayers = ESX.GetPlayers()
	local players = {}

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
                 table.insert(players,
                    '<tr><td style=\"font-weight:bold;text-align:center;color:#000878;\">' .. xPlayer.identifier .. '</td><td style=\"width:20px;font-weight:bold;text-align:center;color:#000878;\">' .. xPlayers[i] .. '</td></tr>'
                    )
			elseif xPlayer.job.name == 'ambulance' then
                 table.insert(players,
                    '<tr><td style=\"font-weight:bold;text-align:center;color:#960000;\">' .. xPlayer.identifier .. '</td><td style=\"width:20px;font-weight:bold;text-align:center;color:#960000;\">' .. xPlayers[i] .. '</td></tr>'
                    )
			elseif xPlayer.job.name == 'mecano' then
                 table.insert(players,
                    '<tr><td style=\"font-weight:bold;text-align:center;color:#9e8600;\">' .. xPlayer.identifier .. '</td><td style=\"width:20px;font-weight:bold;text-align:center;color:#9e8600;\">' .. xPlayers[i] .. '</td></tr>'
                    )
			else
                 table.insert(players,
                    '<tr><td style=\"text-align:center;\">' .. xPlayer.identifier .. '</td><td style=\"width:20px;text-align:center;\">' .. xPlayers[i] .. '</td></tr>'
                    )
			end
		end

		TriggerClientEvent('cyber_scoreboard:setscoreboard', _source , players)
end)