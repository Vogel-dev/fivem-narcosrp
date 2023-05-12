ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('narcrpcraft:sterydy') 
AddEventHandler('narcrpcraft:sterydy', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local sterydy = xPlayer.getInventoryItem('sterydy').count
    if sterydy < 200 then
    if not xPlayer.job.name ~= 'everyone' then
        TriggerClientEvent('narcrp:sterydyzamroz', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 60000, 'Odbierasz paczkę z hormonami wzrostu...')
        Citizen.Wait(60000)
        local ilosc = math.random(20,80)
        xPlayer.addInventoryItem('sterydy', ilosc)
        TriggerClientEvent('narcrp:sterydyodmroz', _source)
        sendNotification(_source, 'Odebrałeś paczkę z x'..ESX.Math.Round(ilosc)..' hormon wzrostu.', 'success', 10000)
else
    TriggerClientEvent('narcrp:sterydystopanimacja', _source)
    sendNotification(_source, 'BŁĄD #001!.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz więcej miejsca w torbie!', 'warning', 5000)
end
end)

RegisterServerEvent('narcrpjablka:sterydysoki') 
AddEventHandler('narcrpjablka:sterydysoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local sterydy = xPlayer.getInventoryItem('sterydy').count
    local rozpuszczalnik = xPlayer.getInventoryItem('rozpuszczalnik').count
    local benzyna = xPlayer.getInventoryItem('benzyna').count
    if xPlayer.job.name ~= 'everyone' then
    if sterydy > 49 then
        xPlayer.removeInventoryItem('sterydy', 50)
        TriggerClientEvent('narcrp:sterydyzamroz', _source)
        TriggerClientEvent('animacjasterydysoki', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przygotowywanie strzykawek...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa przygotowywanie hormonu wzrostu...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa nabieranie produktu do strzykawek...')
        Citizen.Wait(10000)
       local liczba = math.random(5,15)
       local jakosc = math.random(1,3)
       if jakosc == 1 then
            xPlayer.addInventoryItem('sterydy_pooch_low', liczba)
            TriggerClientEvent('narcrp:sterydyodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' opakowanie "Metanabol".', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki hormonu wzrostu x***"..liczba.."*** opakowanie *'Metanabol'*"
        	narcrp_logs("Sterydy - wytworzenie (low)",PlayerName,message,xPlayer.identifier,0xde8f25)
        elseif jakosc == 3 then
            xPlayer.addInventoryItem('sterydy_pooch_medium', liczba)
            TriggerClientEvent('narcrp:sterydyodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' opakowanie "Omnadren".', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki hormonu wzrostu x***"..liczba.."*** opakowanie *'Omnadren'*"
        	narcrp_logs("Sterydy - wytworzenie (medium)",PlayerName,message,xPlayer.identifier,0xde8f25)
        elseif jakosc == 2 then
            xPlayer.addInventoryItem('sterydy_pooch_high', liczba)
            TriggerClientEvent('narcrp:sterydyodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' opakowanie "Testosterone Cypionate".', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki hormonu wzrostu x***"..liczba.."*** opakowanie *'Testosterone Cypionate'*"
        	narcrp_logs("Sterydy - wytworzenie (high)",PlayerName,message,xPlayer.identifier,0xde8f25)
        end
else
    TriggerClientEvent('narcrp:sterydystopanimacja', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco hormonu wzrostu.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz wystarczająco hormonu wzrostu.', 'error', 5000)
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
