ESX 						   = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wezpapierosy') 
AddEventHandler('wezpapierosy', function(ziemniak)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('tyton_pooch')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
        sendNotification(source, 'Posiadasz już maksymalną ilość kartonów...', 'warning', 5000)
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)
RegisterServerEvent('sprzedajpapierosy') 
AddEventHandler('sprzedajpapierosy', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local papierosy = xPlayer.getInventoryItem('tyton_pooch').count
    if papierosy >= 1 then 

        local cena = 75
        TriggerClientEvent('pogressBar:drawBar', source, 12000, 'Trwa sprzedawanie kartonów papierosów...')
        TriggerClientEvent('freezeplayer12', _source)
        xPlayer.removeInventoryItem('tyton_pooch', ESX.Math.Round(papierosy / 4))
        TriggerClientEvent('sprzedawanie:papierosow', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('tyton_pooch', ESX.Math.Round(papierosy / 4))
        TriggerClientEvent('sprzedawanie:papierosow', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('tyton_pooch', ESX.Math.Round(papierosy / 4))
        TriggerClientEvent('sprzedawanie:papierosow', _source)
        Citizen.Wait(3000)
        local papierosy2 = xPlayer.getInventoryItem('tyton_pooch').count
        xPlayer.removeInventoryItem('tyton_pooch', papierosy2)
        TriggerClientEvent('sprzedawanie:papierosow', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(papierosy * cena)
        TriggerClientEvent('freezeplayer13', _source)
        sendNotification(_source, 'Zarobiłeś '..ESX.Math.Round(papierosy * cena)..' $ za sprzedanie '.. ESX.Math.Round(papierosy) ..' paczek papierosów.', 'success', 5000)
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(papierosy) .. "** paczek papierosów za ***"..ESX.Math.Round(papierosy * cena).."***$ "
        narcos_logs("Przemyt papierosów - Sprzedaż paczek papierosów",PlayerName,message,xPlayer.identifier,0xdb6211)
    else
        sendNotification(_source, 'Nie posiadasz żadnych kartonów papierosów.', 'error', 5000)
    end
end)

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

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end