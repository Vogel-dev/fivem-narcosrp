ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("kossek-antylua:kick")
AddEventHandler("kossek-antylua:kick", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	print(('NarcosRP | Wykryto nielegalne oprogramowanie.'):format(xPlayer.identifier))
	DropPlayer(source, "NarcosRP | Wykryto nielegalne oprogramowanie.")
end)