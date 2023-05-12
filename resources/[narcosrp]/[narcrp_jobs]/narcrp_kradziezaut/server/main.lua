ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local cooldown = 0

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function(payment)
	local _source = source
	local PlayerName = GetPlayerName(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.addAccountMoney('black_money',tonumber(payment))
	xPlayer.addMoney(tonumber(payment))
	sendNotification(_source, 'Dostawa zakończona pomyślnie, twoje wynagrodzenie wynosi: '..tonumber(payment)..' $', 'success', 10000)
	local message = "Gracz **"..PlayerName.."** dotarł do celu, za dostawę otrzymał: ***"..tonumber(payment).." $***"
	narcos_logs("Kradzież pojazdów - Dostawa ukończona",PlayerName,message,xPlayer.identifier,0xda0e0e)
	--Add cooldown
	cooldown = Config.CooldownMinutes * 60000
end)

ESX.RegisterServerCallback('esx_carthief:anycops',function(source, cb)
  local anycops = 0
  local playerList = ESX.GetPlayers()
  for i=1, #playerList, 1 do
    local _source = playerList[i]
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerjob = xPlayer.job.name
    if playerjob == 'police' then
      anycops = anycops + 1
    end
  end
  cb(anycops)
end)

ESX.RegisterServerCallback('esx_carthief:isActive',function(source, cb)
  cb(activity, cooldown)
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('esx_carthief:setcopnotification', xPlayers[i])
			end
		end
	else
		activitySource = 0
	end
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_carthief:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)

RegisterServerEvent('esx_carthief:stopalertcops')
AddEventHandler('esx_carthief:stopalertcops', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
		end
	end
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		--Remove blip for all cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
			end
		end
		--Set activity to 0
		activity = 0
		activitySource = 0
	end
end)

--Cooldown manager
AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
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

function narcos_logs (title,name,message,steamID,color)
    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["description"] = message,
            ["color"] = color,
            --		["timestamp"] = os.time(),
            ["footer"] =  {
                ["icon_url"] = "https://i.imgur.com/6aPjIDn.png",
                ["text"] = steamID,
            },
            ["author"] = {
                ["name"] = name,
                ["url"] = "http://narcosrp.pl",
                ["icon_url"] = "https://i.imgur.com/3vnUDSl.png",
            }
        }
    }
    
      if message == nil or message == '' then return FALSE end
      PerformHttpRequest("https://discordapp.com/api/webhooks/693838509836075008/RLTUDG86kEPYsYoitrgMobVh22zAdmy6bYKvlBpbqntcpQaGIKqOUYeh02AYvhWnhamZ", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
