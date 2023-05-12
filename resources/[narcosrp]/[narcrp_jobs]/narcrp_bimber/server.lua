ESX 						   = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wez_bimber') 
AddEventHandler('wez_bimber', function(ziemniak)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('bimber_pooch')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
        sendNotification(source, 'Posiadasz już maksymalną butelek...', 'warning', 5000)
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)
RegisterServerEvent('sprzedaj_bimber') 
AddEventHandler('sprzedaj_bimber', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local bimber = xPlayer.getInventoryItem('bimber_pooch').count
    if bimber >= 1 then 

        local cena = 80
        TriggerClientEvent('pogressBar:drawBar', source, 12000, 'Trwa sprzedawanie butelek bimbru...')
        TriggerClientEvent('freeze_player_bimber12', _source)
        xPlayer.removeInventoryItem('bimber_pooch', ESX.Math.Round(bimber / 4))
        TriggerClientEvent('sprzedawanie:bimbru', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('bimber_pooch', ESX.Math.Round(bimber / 4))
        TriggerClientEvent('sprzedawanie:bimbru', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('bimber_pooch', ESX.Math.Round(bimber / 4))
        TriggerClientEvent('sprzedawanie:bimbru', _source)
        Citizen.Wait(3000)
        local bimber2 = xPlayer.getInventoryItem('bimber_pooch').count
        xPlayer.removeInventoryItem('bimber_pooch', bimber2)
        TriggerClientEvent('sprzedawanie:bimbru', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(bimber * cena)
        TriggerClientEvent('freeze_player_bimber13', _source)
        sendNotification(_source, 'Zarobiłeś '..ESX.Math.Round(bimber * cena)..' $ za sprzedanie '.. ESX.Math.Round(bimber) ..' butelek bimbru.', 'success', 5000)
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(bimber) .. "** butelek bimbru za ***"..ESX.Math.Round(bimber * cena).."***$ "
        narcos_logs("Bimber - Sprzedaż butelek bimbru",PlayerName,message,xPlayer.identifier,0x55e16d)
    else
        sendNotification(_source, 'Nie posiadasz żadnych butelek bimbru.', 'error', 5000)
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