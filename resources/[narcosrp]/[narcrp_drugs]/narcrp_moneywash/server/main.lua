local PlayersWashing = {}
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function WhiteningMoney(source,percent)
	local source = source
		SetTimeout(10000, function()

		if PlayersWashing[source] == true then
			local xPlayer		= ESX.GetPlayerFromId(source)
			local blackMoney	= xPlayer.getAccount('black_money')
			local _percent		= Config.Percentage
			
			if blackMoney.money < Config.Slice then
				sendNotification(source, 'Nie posiadasz wystarczającej sumy pieniędzy.', 'error', 5000)
			else
				local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
				local washedMoney = math.floor(Config.Slice / 100 * (_percent + bonus))

				xPlayer.removeAccountMoney('black_money', Config.Slice)
				xPlayer.addMoney(washedMoney)
				WhiteningMoney(source,_percent)
				sendNotification(source, 'Otrzymałeś '..washedMoney..' $ czystych pieniędzy.', 'success', 5000)
			end
		end
	end)
end

RegisterServerEvent('esx_moneywash:washMoney')
AddEventHandler('esx_moneywash:washMoney', function(amount)
	local xPlayer 		= ESX.GetPlayerFromId(source)
	local account 		= xPlayer.getAccount('black_money')
	local _percent		= Config.Percentage

	if amount > 0 and account.money >= amount then
		
		local bonus = math.random(Config.Bonus.min, Config.Bonus.max)
		local washedMoney = math.floor(amount / 100 * (_percent + bonus))	

		xPlayer.removeAccountMoney('black_money', amount)
		xPlayer.addMoney(washedMoney)
		sendNotification(source, 'Otrzymałeś '..washedMoney..' $ czystych pieniędzy.', 'success', 5000)
		
	else
		sendNotification(source, 'Wartość nieprawidłowa.', 'error', 5000)

	end

end)

RegisterServerEvent('esx_moneywash:startWhitening')
AddEventHandler('esx_moneywash:startWhitening', function(percent)
	PlayersWashing[source] = true
	sendNotification(source, 'Pranie w toku...', 'info', 5000)
	WhiteningMoney(source,percent)
end)

RegisterServerEvent('esx_moneywash:Nothere')
AddEventHandler('esx_moneywash:Nothere', function()
	PlayersWashing[source] = false
	sendNotification(source, 'Wróć później...', 'info', 5000)
end)


RegisterServerEvent('esx_moneywash:stopWhitening')
AddEventHandler('esx_moneywash:stopWhitening', function()
	PlayersWashing[source] = false
end)

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end


