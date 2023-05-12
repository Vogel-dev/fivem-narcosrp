ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('narcrpcraft:haszysz') 
AddEventHandler('narcrpcraft:haszysz', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local haszysz = xPlayer.getInventoryItem('haszysz').count
    if haszysz < 500 then
    if not xPlayer.job.name ~= 'everyone' then
        TriggerClientEvent('narcrp:haszyszzamroz', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 60000, 'Odbierasz paczkę z konopią indyjską...')
        Citizen.Wait(60000)
        local ilosc = math.random(50,100)
        xPlayer.addInventoryItem('haszysz', ilosc)
        TriggerClientEvent('narcrp:haszyszodmroz', _source)
        sendNotification(_source, 'Odebrałeś paczkę z x'..ESX.Math.Round(ilosc)..' konopią indyjską.', 'success', 10000)
else
    TriggerClientEvent('narcrp:haszyszstopanimacja', _source)
    sendNotification(_source, 'BŁĄD #001!.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz więcej miejsca w torbie!', 'warning', 5000)
end
end)

RegisterServerEvent('narcrpjablka:haszyszsoki') 
AddEventHandler('narcrpjablka:haszyszsoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local haszysz = xPlayer.getInventoryItem('haszysz').count
    if xPlayer.job.name ~= 'everyone' then
    if haszysz > 49 then
        xPlayer.removeInventoryItem('haszysz', 50)
        TriggerClientEvent('narcrp:haszyszzamroz', _source)
        TriggerClientEvent('animacjahaszyszsoki', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przygotowywanie konopi indyjskiej...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa suszenie konopi indyjskiej...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przerabianie konopi w haszysz...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa rozdzielanie gramów towaru do torebek...')
        Citizen.Wait(10000)
       local liczba = math.random(5,15)
       local jakosc = math.random(1,3)
       if jakosc == 1 then
            xPlayer.addInventoryItem('haszysz_pooch_low', liczba)
            TriggerClientEvent('narcrp:haszyszodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram haszyszu niskiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki konopi indyjskiej x***"..liczba.."*** gram haszyszu *niskiej czystości*"
        	narcrp_logs("Haszysz - wytworzenie (low)",PlayerName,message,xPlayer.identifier,0x17b30f)
        elseif jakosc == 3 then
            xPlayer.addInventoryItem('haszysz_pooch_medium', liczba)
            TriggerClientEvent('narcrp:haszyszodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram haszyszu średniej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki konopi indyjskiej x***"..liczba.."*** gram haszyszu *średniej czystości*"
        	narcrp_logs("Haszysz - wytworzenie (medium)",PlayerName,message,xPlayer.identifier,0x17b30f)
        elseif jakosc == 2 then
            xPlayer.addInventoryItem('haszysz_pooch_high', liczba)
            TriggerClientEvent('narcrp:haszyszodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram haszyszu wysokiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki konopi indyjskiej x***"..liczba.."*** gram haszyszu *wysokiej czystości*"
        	narcrp_logs("Haszysz - wytworzenie (high)",PlayerName,message,xPlayer.identifier,0x17b30f)
        end
else
    TriggerClientEvent('narcrp:haszyszstopanimacja', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco konopi indyjskiej.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco konopi indyjskiej.', 'error', 5000)
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
