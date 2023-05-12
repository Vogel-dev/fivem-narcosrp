ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('narcrpcraft:meta') 
AddEventHandler('narcrpcraft:meta', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local meta = xPlayer.getInventoryItem('meta').count
    if meta < 500 then
    if not xPlayer.job.name ~= 'everyone' then
        TriggerClientEvent('narcrp:metazamroz', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 60000, 'Odbierasz paczkę ze środkami chemicznymi...')
        Citizen.Wait(60000)
        local ilosc = math.random(50,100)
        xPlayer.addInventoryItem('meta', ilosc)
        TriggerClientEvent('narcrp:metaodmroz', _source)
        sendNotification(_source, 'Odebrałeś paczkę z x'..ESX.Math.Round(ilosc)..' metyloamina.', 'success', 10000)
else
    TriggerClientEvent('narcrp:metastopanimacja', _source)
    sendNotification(_source, 'BŁĄD #001!.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz więcej miejsca w torbie!', 'warning', 5000)
end
end)

RegisterServerEvent('narcrpjablka:metasoki') 
AddEventHandler('narcrpjablka:metasoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local meta = xPlayer.getInventoryItem('meta').count
    if xPlayer.job.name ~= 'everyone' then
    if meta > 49 then
        xPlayer.removeInventoryItem('meta', 50)
        TriggerClientEvent('narcrp:metazamroz', _source)
        TriggerClientEvent('animacjametasoki', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przygotowywanie środków chemicznych...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przygotowywanie metyloaminy...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa gotowanie metyloaminy...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa krystalizacja metyloaminy...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa rozdzielanie gramów towaru do torebek...')
        Citizen.Wait(10000)
       local liczba = math.random(5,15)
       local jakosc = math.random(1,3)
       if jakosc == 1 then
            xPlayer.addInventoryItem('meta_pooch_low', liczba)
            TriggerClientEvent('narcrp:metaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram metamfetaminy niskiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki metyloaminy x***"..liczba.."*** gram metamfetaminy *niskiej czystości*"
        	narcrp_logs("Metamfetamina - wytworzenie (low)",PlayerName,message,xPlayer.identifier,0x15a9c4)
        elseif jakosc == 3 then
            xPlayer.addInventoryItem('meta_pooch_medium', liczba)
            TriggerClientEvent('narcrp:metaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram metamfetaminy średniej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki metyloaminy x***"..liczba.."*** gram metamfetaminy *średniej czystości*"
        	narcrp_logs("Metamfetamina - wytworzenie (medium)",PlayerName,message,xPlayer.identifier,0x15a9c4)
        elseif jakosc == 2 then
            xPlayer.addInventoryItem('meta_pooch_high', liczba)
            TriggerClientEvent('narcrp:metaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram metamfetaminy wysokiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki metyloaminy x***"..liczba.."*** gram metamfetaminy *wysokiej czystości*"
        	narcrp_logs("Metamfetamina - wytworzenie (high)",PlayerName,message,xPlayer.identifier,0x15a9c4)
        end
else
    TriggerClientEvent('narcrp:metastopanimacja', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco metyloaminy.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco metyloaminy.', 'error', 5000)
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

function narcrp_logs (title,name,message,steamID,color)
    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["description"] = message,
            ["color"] = color,
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697552057267126272/eSxxjKreNkDfmIDyLuIfI7f7WcNJW3wEZopj6LTi2XqvmZ0lbsCNSaW_KlcwPUWPwkuB", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
