ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(Config.Price)
	sendNotification(source, 'Zapłaciłeś '..ESX.Math.GroupDigits(Config.Price)..' $', 'success', 5000)
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.get('money') >= Config.Price)
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