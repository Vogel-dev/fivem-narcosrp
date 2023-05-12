ESX = nil
mandatAmount = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)
RegisterServerEvent('hospital:price')
AddEventHandler('hospital:price', function(target)
  	local price = 2000
	print('sever')
	local targetXPlayer = ESX.GetPlayerFromId(target)
	--targetXPlayer.removeBank(price)
	print(price)
	targetXPlayer.removeAccountMoney('bank', price)
end)
RegisterServerEvent('sprawdz:ambulans')
AddEventHandler('sprawdz:ambulans', function()
local xPlayers = ESX.GetPlayers()
local cops = 0
print('1')
for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 if xPlayer.job.name == 'ambulance' then
			cops = cops + 1
	end
end
print('2')
if cops == 0 then
	print('3')
	TriggerClientEvent('smerfik:lekarz', source)
else
	TriggerClientEvent('smerfik:zaduzomedykow', source)
end

end)
