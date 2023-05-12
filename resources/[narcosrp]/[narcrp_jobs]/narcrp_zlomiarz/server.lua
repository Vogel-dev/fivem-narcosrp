ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('narcrpcraft:zlomiarzzbier') 
AddEventHandler('narcrpcraft:zlomiarzzbier', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local jabka = xPlayer.getInventoryItem('zlom').count
    if jabka < 50 then
    if xPlayer.job.name == 'zlom' then
        TriggerClientEvent('narcrp:zamrozcrft22', _source)
        TriggerClientEvent('pogressBar:drawBar', _source, 6000, 'Trwa zbieranie złomu...')
        TriggerClientEvent('narcrp:craftanimacja22', _source)
        TriggerClientEvent('narcrp:tekstjab2', _source)
        Citizen.Wait(1000)
        Citizen.Wait(1000)
        Citizen.Wait(1000)
        Citizen.Wait(1000)
        Citizen.Wait(1000)

       local ilosc = math.random(10,50)
        xPlayer.addInventoryItem('zlom', ilosc)
        TriggerClientEvent('narcrp:odmrozcrft22', _source)

        sendNotification(_source, 'Pomyślnie zebrałeś '..ilosc..' złomu.', 'success', 5000)

else
    TriggerClientEvent('narcrp:stopcraftanimacja2', _source)
    sendNotification(_source, 'Nie jesteś zatrudniony jako złomiarz.', 'error', 5000)
end 
else
    TriggerClientEvent('narcrp:zdejmijznaczek2', _source)
    sendNotification(_source, 'Nie posiadasz więcej miejsca w ekwipunku na złom.', 'warning', 5000)
end
end)

RegisterServerEvent('narcrpcraft:skup2') 
AddEventHandler('narcrpcraft:skup2', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
    local jabka = xPlayer.getInventoryItem('zlom').count
    if xPlayer.job.name == 'zlom' then
    if jabka >= 1 then 

        local cena = 6
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem('zlom', ESX.Math.Round(jabka / 4))
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        local jabka2 = xPlayer.getInventoryItem('zlom').count
        xPlayer.removeInventoryItem('zlom', jabka2)
        TriggerClientEvent('sprzedawanie:jablekanim2', _source)
        Citizen.Wait(3000)
        xPlayer.addMoney(jabka * cena)
        local fullprice = jabka*cena
        TriggerClientEvent('odlacz:propa', _source)
        sendNotification(_source, 'Pomyślnie sprzedałeś '..ESX.Math.Round(jabka)..' złomu za cenę '..fullprice..' $', 'success', 5000)
        local message = "Gracz **"..PlayerName.."** sprzedał **" .. ESX.Math.Round(jabka) .. "** złomu za ***"..ESX.Math.Round(jabka * cena).."***$ "
        narcrp_logs("Złomiarz - Sprzedaż złomu",PlayerName,message,xPlayer.identifier,0x00ffff)
    else
        sendNotification(_source, 'Nie posiadasz złomu.', 'error', 5000)
    end
else
    sendNotification(_source, 'Nie jesteś zatrudniony jako złomiarz.', 'error', 5000)
end 
end)

function narcrp_logs (title,name,message,steamID,color)
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