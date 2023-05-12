ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('narcrpcraft:kokaina') 
AddEventHandler('narcrpcraft:kokaina', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local kokaina = xPlayer.getInventoryItem('kokaina').count
    if kokaina < 500 then
    if not xPlayer.job.name ~= 'everyone' then
        TriggerClientEvent('narcrp:kokainazamroz', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 60000, 'Odbierasz paczkę z liśćmi kokainy...')
        Citizen.Wait(60000)
        local ilosc = math.random(50,100)
        xPlayer.addInventoryItem('kokaina', ilosc)
        TriggerClientEvent('narcrp:kokainaodmroz', _source)
        sendNotification(_source, 'Odebrałeś paczkę z '..ESX.Math.Round(ilosc)..' liśćmi kokainy.', 'success', 10000)
else
    TriggerClientEvent('narcrp:kokainastopanimacja', _source)
    sendNotification(_source, 'BŁĄD #001!.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz więcej miejsca w torbie na liście kokainy!', 'warning', 5000)
end
end)

RegisterServerEvent('narcrpjablka:kokainasoki') 
AddEventHandler('narcrpjablka:kokainasoki', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local kokaina = xPlayer.getInventoryItem('kokaina').count
    local rozpuszczalnik = xPlayer.getInventoryItem('rozpuszczalnik').count
    local benzyna = xPlayer.getInventoryItem('benzyna').count
    if xPlayer.job.name == 'kasyno' then
    if kokaina > 49 then
    if rozpuszczalnik > 4 then
    if benzyna > 4 then
        xPlayer.removeInventoryItem('kokaina', 50)
        xPlayer.removeInventoryItem('rozpuszczalnik', 5)
        xPlayer.removeInventoryItem('benzyna', 5)
        TriggerClientEvent('narcrp:kokainazamroz', _source)
        TriggerClientEvent('animacjakokainasoki', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa moczenie liści w benzynie...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa odsączanie benzyny...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa suszenie bazy kokainowej...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa rozpuszczanie w rozpuszczalniku...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa usuwanie nadmiaru rozpuszczalników...')
        Citizen.Wait(10000)
        TriggerClientEvent('pogressBar:drawBar', _source, 10000, 'Trwa rozdzielanie gramów kokainy do torebek...')
        Citizen.Wait(10000)
       local liczba = math.random(5,15)
       local jakosc = math.random(1,3)
       if jakosc == 1 then
            xPlayer.addInventoryItem('kokaina_pooch_low', liczba)
            TriggerClientEvent('narcrp:kokainaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram kokainy niskiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki liści kokainy x***"..liczba.."*** gram kokainy *niskiej czystości*"
        	narcrp_logs("Kokaina - wytworzenie (low)",PlayerName,message,xPlayer.identifier,0xa6dff0)
        elseif jakosc == 3 then
            xPlayer.addInventoryItem('kokaina_pooch_medium', liczba)
            TriggerClientEvent('narcrp:kokainaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram kokainy średniej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki liści kokainy x***"..liczba.."*** gram kokainy *średniej czystości*"
        	narcrp_logs("Kokaina - wytworzenie (medium)",PlayerName,message,xPlayer.identifier,0xa6dff0)
        elseif jakosc == 2 then
            xPlayer.addInventoryItem('kokaina_pooch_high', liczba)
            TriggerClientEvent('narcrp:kokainaodmroz', _source)
            sendNotification(_source, 'Wyprodukowałeś x'..liczba..' gram kokainy wysokiej czystości.', 'success', 5000)
            local message = "Gracz **"..PlayerName.."** uzyskał z przeróbki liści kokainy x***"..liczba.."*** gram kokainy *wysokiej czystości*"
        	narcrp_logs("Kokaina - wytworzenie (high)",PlayerName,message,xPlayer.identifier,0xa6dff0)
        end
else
    TriggerClientEvent('narcrp:kokainastopanimacja', _source)
    sendNotification(_source, 'Nie posiadasz odpowiednich składników.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz odpowiednich składników.', 'error', 5000)
end
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz odpowiednich składników.', 'error', 5000)
end
else
    TriggerClientEvent('narcrp:zdejmijznaczeksss', _source)
    sendNotification(_source, 'Nie posiadasz odpowiedniej wiedzy.', 'error', 5000)
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
