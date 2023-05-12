ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sellDrugs')
AddEventHandler('sellDrugs', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local haszysz_pooch_low = xPlayer.getInventoryItem('haszysz_pooch_low').count
	local haszysz_pooch_medium = xPlayer.getInventoryItem('haszysz_pooch_medium').count
	local haszysz_pooch_high = xPlayer.getInventoryItem('haszysz_pooch_high').count
	local haszyszSingle = xPlayer.getInventoryItem('haszysz').count
	local meta_pooch_low = xPlayer.getInventoryItem('meta_pooch_low').count
	local meta_pooch_medium = xPlayer.getInventoryItem('meta_pooch_medium').count
	local meta_pooch_high = xPlayer.getInventoryItem('meta_pooch_high').count
	local metaSingle = xPlayer.getInventoryItem('meta').count
	local kokaina_pooch_low = xPlayer.getInventoryItem('kokaina_pooch_low').count
	local kokaina_pooch_medium = xPlayer.getInventoryItem('kokaina_pooch_medium').count
	local kokaina_pooch_high = xPlayer.getInventoryItem('kokaina_pooch_high').count
	local kokainaSingle = xPlayer.getInventoryItem('kokaina').count
	local sterydy_pooch_low = xPlayer.getInventoryItem('sterydy_pooch_low').count
	local sterydy_pooch_medium = xPlayer.getInventoryItem('sterydy_pooch_medium').count
	local sterydy_pooch_high = xPlayer.getInventoryItem('sterydy_pooch_high').count
	local sterydySingle = xPlayer.getInventoryItem('sterydy').count
	local x = 0
	local blackMoney = 0
	local drugType = nil
	
	if Config.Sellhaszysz and haszysz_pooch_low > 0 or Config.Sellhaszysz and haszysz_pooch_medium > 0 or Config.Sellhaszysz and haszysz_pooch_high > 0 or Config.Sellhaszysz and haszyszSingle > 0 then
		if haszysz_pooch_low > 0 and Config.SellPooch then
			drugType = 'haszysz_pooch_low'
			if haszysz_pooch_low == 1 then
				x = 1
			elseif haszysz_pooch_low == 2 then
				x = math.random(1,2)
			elseif haszysz_pooch_low == 3 then
				x = math.random(1,3)
			elseif haszysz_pooch_low == 4 then
				x = math.random(1,4)
			elseif haszysz_pooch_low >= 5 then
				x = math.random(1,5)
			end
	elseif haszysz_pooch_medium > 0 and Config.SellPooch then
			drugType = 'haszysz_pooch_medium'
			if haszysz_pooch_medium == 1 then
				x = 1
			elseif haszysz_pooch_medium == 2 then
				x = math.random(1,2)
			elseif haszysz_pooch_medium == 3 then
				x = math.random(1,3)
			elseif haszysz_pooch_medium == 4 then
				x = math.random(1,4)
			elseif haszysz_pooch_medium >= 5 then
				x = math.random(1,5)
			end
	elseif haszysz_pooch_high > 0 and Config.SellPooch then
			drugType = 'haszysz_pooch_high'
			if haszysz_pooch_high == 1 then
				x = 1
			elseif haszysz_pooch_high == 2 then
				x = math.random(1,2)
			elseif haszysz_pooch_high == 3 then
				x = math.random(1,3)
			elseif haszysz_pooch_high == 4 then
				x = math.random(1,4)
			elseif haszysz_pooch_high >= 5 then
				x = math.random(1,5)
			end
	elseif haszyszSingle > 0 and Config.SellSingle then
		drugType = 'haszysz'
		if haszyszSingle == 1 then
			x = 1
		elseif haszyszSingle == 2 then
			x = math.random(1,2)
		elseif haszyszSingle == 3 then
			x = math.random(1,3)
		elseif haszyszSingle == 4 then
			x = math.random(1,4)
		elseif haszyszSingle >= 5 then
			x = math.random(1,5)
		end
	end
	elseif Config.Sellmeta and meta_pooch_low > 0 or Config.Sellmeta and meta_pooch_medium > 0 or Config.Sellmeta and meta_pooch_high > 0 or Config.Sellmeta and metaSingle > 0 then
		if meta_pooch_low > 0 and Config.SellPooch then
			drugType = 'meta_pooch_low'
			if meta_pooch_low == 1 then
				x = 1
			elseif meta_pooch_low == 2 then
				x = math.random(1,2)
			elseif meta_pooch_low == 3 then
				x = math.random(1,3)
			elseif meta_pooch_low == 4 then
				x = math.random(1,4)
			elseif meta_pooch_low >= 5 then
				x = math.random(1,5)
			end
	elseif meta_pooch_medium > 0 and Config.SellPooch then
			drugType = 'meta_pooch_medium'
			if meta_pooch_medium == 1 then
				x = 1
			elseif meta_pooch_medium == 2 then
				x = math.random(1,2)
			elseif meta_pooch_medium == 3 then
				x = math.random(1,3)
			elseif meta_pooch_medium == 4 then
				x = math.random(1,4)
			elseif meta_pooch_medium >= 5 then
				x = math.random(1,5)
			end
	elseif meta_pooch_high > 0 and Config.SellPooch then
			drugType = 'meta_pooch_high'
			if meta_pooch_high == 1 then
				x = 1
			elseif meta_pooch_high == 2 then
				x = math.random(1,2)
			elseif meta_pooch_high == 3 then
				x = math.random(1,3)
			elseif meta_pooch_high == 4 then
				x = math.random(1,4)
			elseif meta_pooch_high >= 5 then
				x = math.random(1,5)
			end
	elseif metaSingle > 0 and Config.SellSingle then
		drugType = 'meta'
		if metaSingle == 1 then
			x = 1
		elseif metaSingle == 2 then
			x = math.random(1,2)
		elseif metaSingle == 3 then
			x = math.random(1,3)
		elseif metaSingle == 4 then
			x = math.random(1,4)
		elseif metaSingle >= 5 then
			x = math.random(1,5)
		end
	end
	elseif Config.Sellkokaina and kokaina_pooch_low > 0 or Config.Sellkokaina and kokaina_pooch_medium > 0 or Config.Sellkokaina and kokaina_pooch_high > 0 or Config.Sellkokaina and kokainaSingle > 0 then
		if kokaina_pooch_low > 0 and Config.SellPooch then
		drugType = 'kokaina_pooch_low'
		if kokaina_pooch_low == 1 then
			x = 1
		elseif kokaina_pooch_low == 2 then
			x = math.random(1,2)
		elseif kokaina_pooch_low == 3 then
			x = math.random(1,3)
		elseif kokaina_pooch_low == 4 then
			x = math.random(1,4)
		elseif kokaina_pooch_low >= 5 then
			x = math.random(1,5)
		end
	elseif kokaina_pooch_medium > 0 and Config.SellPooch then
		drugType = 'kokaina_pooch_medium'
		if kokaina_pooch_medium == 1 then
			x = 1
		elseif kokaina_pooch_medium == 2 then
			x = math.random(1,2)
		elseif kokaina_pooch_medium == 3 then
			x = math.random(1,3)
		elseif kokaina_pooch_medium == 4 then
			x = math.random(1,4)
		elseif kokaina_pooch_medium >= 5 then
			x = math.random(1,5)
		end
	elseif kokaina_pooch_high > 0 and Config.SellPooch then
		drugType = 'kokaina_pooch_high'
		if kokaina_pooch_high == 1 then
			x = 1
		elseif kokaina_pooch_high == 2 then
			x = math.random(1,2)
		elseif kokaina_pooch_high == 3 then
			x = math.random(1,3)
		elseif kokaina_pooch_high == 4 then
			x = math.random(1,4)
		elseif kokaina_pooch_high >= 5 then
			x = math.random(1,5)
		end
	elseif kokainaSingle > 0 and Config.SellSingle then
		drugType = 'kokaina'
		if kokainaSingle == 1 then
			x = 1
		elseif kokainaSingle == 2 then
			x = math.random(1,2)
		elseif kokainaSingle == 3 then
			x = math.random(1,3)
		elseif kokainaSingle == 4 then
			x = math.random(1,4)
		elseif kokainaSingle >= 5 then
			x = math.random(1,5)
		end
	end
	elseif Config.Sellsterydy and sterydy_pooch_low > 0 or Config.Sellsterydy and sterydy_pooch_medium > 0 or Config.Sellsterydy and sterydy_pooch_high > 0 or Config.Sellsterydy and sterydySingle > 0 then
		if sterydy_pooch_low > 0 and Config.SellPooch then
		drugType = 'sterydy_pooch_low'
		if sterydy_pooch_low == 1 then
			x = 1
		elseif sterydy_pooch_low == 2 then
			x = math.random(1,2)
		elseif sterydy_pooch_low == 3 then
			x = math.random(1,3)
		elseif sterydy_pooch_low == 4 then
			x = math.random(1,4)
		elseif sterydy_pooch_low >= 5 then
			x = math.random(1,5)
		end
	elseif sterydy_pooch_medium > 0 and Config.SellPooch then
		drugType = 'sterydy_pooch_medium'
		if sterydy_pooch_medium == 1 then
			x = 1
		elseif sterydy_pooch_medium == 2 then
			x = math.random(1,2)
		elseif sterydy_pooch_medium == 3 then
			x = math.random(1,3)
		elseif sterydy_pooch_medium == 4 then
			x = math.random(1,4)
		elseif sterydy_pooch_medium >= 5 then
			x = math.random(1,5)
		end
	elseif sterydy_pooch_high > 0 and Config.SellPooch then
		drugType = 'sterydy_pooch_high'
		if sterydy_pooch_high == 1 then
			x = 1
		elseif sterydy_pooch_high == 2 then
			x = math.random(1,2)
		elseif sterydy_pooch_high == 3 then
			x = math.random(1,3)
		elseif sterydy_pooch_high == 4 then
			x = math.random(1,4)
		elseif sterydy_pooch_high >= 5 then
			x = math.random(1,5)
		end
	elseif sterydySingle > 0 and Config.SellSingle then
		drugType = 'sterydy'
		if sterydySingle == 1 then
			x = 1
		elseif sterydySingle == 2 then
			x = math.random(1,2)
		elseif sterydySingle == 3 then
			x = math.random(1,3)
		elseif sterydySingle == 4 then
			x = math.random(1,4)
		elseif sterydySingle >= 5 then
			x = math.random(1,5)
		end
	end
	else
		TriggerClientEvent('nomoredrugs', _source)
		return
	end
	
	if drugType=='haszysz_pooch_low' then
		drugName = 'gram haszyszu (niskiej jakości)'
		blackMoney = Config.haszysz_pooch_lowPrice * x
	elseif drugType=='meta_pooch_low' then
		drugName = 'gram metamfetaminy (niskiej jakości)'
		blackMoney = Config.meta_pooch_lowPrice* x
	elseif drugType=='kokaina_pooch_low' then
		drugName = 'gram kokainy (niskiej jakości)'
		blackMoney = Config.kokaina_pooch_lowPrice * x
	elseif drugType=='sterydy_pooch_low' then
		drugName = 'opakowanie "Metanabolu"'
		blackMoney = Config.sterydy_pooch_lowPrice * x
	elseif drugType=='haszysz_pooch_medium' then
		drugName = 'gram haszyszu (średniej jakości)'
		blackMoney = Config.haszysz_pooch_mediumPrice * x
	elseif drugType=='meta_pooch_medium' then
		drugName = 'gram metamfetaminy (średniej jakości)'
		blackMoney = Config.meta_pooch_mediumPrice* x
	elseif drugType=='kokaina_pooch_medium' then
		drugName = 'gram kokainy (średniej jakości)'
		blackMoney = Config.kokaina_pooch_mediumPrice * x
	elseif drugType=='sterydy_pooch_medium' then
		drugName = 'opakowanie "Omnadrenu"'
		blackMoney = Config.sterydy_pooch_mediumPrice * x
	elseif drugType=='haszysz_pooch_high' then
		drugName = 'gram haszyszu (wysokiej jakości)'
		blackMoney = Config.haszysz_pooch_highPrice * x
	elseif drugType=='meta_pooch_high' then
		drugName = 'gram metamfetaminy (wysokiej jakości)'
		blackMoney = Config.meta_pooch_highPrice* x
	elseif drugType=='kokaina_pooch_high' then
		drugName = 'gram kokainy (wysokiej jakości)'
		blackMoney = Config.kokaina_pooch_highPrice * x
	elseif drugType=='sterydy_pooch_high' then
		drugName = 'opakowanie "Testosterone Cypionate"'
		blackMoney = Config.sterydy_pooch_highPrice * x
	elseif drugType=='haszysz' then	--single
		drugName = 'sztuka konopii indyjskiej'
		blackMoney = Config.haszyszPrice * x
	elseif drugType=='meta' then
		drugName = 'sztuka metyloaminy'
		blackMoney = Config.metaPrice * x
	elseif drugType=='kokaina' then
		drugName = 'liść kokainy'
		blackMoney = Config.kokainaPrice * x
	elseif drugType=='sterydy' then
		drugName = 'porcja hormonu wzrostu'
		blackMoney = Config.sterydyPrice * x
	end
	
	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, x)
	end
	
	xPlayer.addAccountMoney('black_money', blackMoney)
	TriggerClientEvent('sold', _source)
	local PlayerName = GetPlayerName(_source)
	sendNotification(_source, 'Sprzedałeś x'..x..' '..drugName..' za '..blackMoney..' $', 'success', 10000)
	local message = "Gracz **"..PlayerName.."** sprzedał **x"..x.." "..drugName.."** za ***"..blackMoney.."***$ "
    narcrp_logs("Narkotyki - Sprzedaż",PlayerName,message,xPlayer.identifier,0x00a429)
end)


RegisterServerEvent('check')
AddEventHandler('check', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local haszysz_pooch_low = xPlayer.getInventoryItem('haszysz_pooch_low').count
	local haszysz_pooch_medium = xPlayer.getInventoryItem('haszysz_pooch_medium').count
	local haszysz_pooch_high = xPlayer.getInventoryItem('haszysz_pooch_high').count
	local haszyszSingle = xPlayer.getInventoryItem('haszysz').count
	local meta_pooch_low = xPlayer.getInventoryItem('meta_pooch_low').count
	local meta_pooch_medium = xPlayer.getInventoryItem('meta_pooch_medium').count
	local meta_pooch_high = xPlayer.getInventoryItem('meta_pooch_high').count
	local metaSingle = xPlayer.getInventoryItem('meta').count
	local kokaina_pooch_low = xPlayer.getInventoryItem('kokaina_pooch_low').count
	local kokaina_pooch_medium = xPlayer.getInventoryItem('kokaina_pooch_medium').count
	local kokaina_pooch_high = xPlayer.getInventoryItem('kokaina_pooch_high').count
	local kokainaSingle = xPlayer.getInventoryItem('kokaina').count
	local sterydy_pooch_low = xPlayer.getInventoryItem('sterydy_pooch_low').count
	local sterydy_pooch_medium = xPlayer.getInventoryItem('sterydy_pooch_medium').count
	local sterydy_pooch_high = xPlayer.getInventoryItem('sterydy_pooch_high').count
	local sterydySingle = xPlayer.getInventoryItem('sterydy').count
	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.CopsRequiredToSell then
		if Config.Sellhaszysz then
			if Config.SellPooch and haszysz_pooch_low > 0 or haszysz_pooch_medium > 0 or haszysz_pooch_high > 0 or Config.SellSingle and haszyszSingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.Sellmeta then
			if Config.SellPooch and  meta_pooch_low > 0 or meta_pooch_medium > 0 or meta_pooch_high > 0 or Config.SellSingle and  metaSingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.Sellkokaina then
			if Config.SellPooch and  kokaina_pooch_low > 0 or kokaina_pooch_medium > 0 or kokaina_pooch_high > 0 or Config.SellSingle and  kokainaSingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.Sellsterydy then
			if Config.SellPooch and  sterydy_pooch_low > 0 or sterydy_pooch_medium > 0 or sterydy_pooch_high > 0 or Config.SellSingle and  sterydySingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		TriggerClientEvent('nomoredrugs', _source)
	else
		sendNotification(_source, 'Wymagana jest '..Config.CopsRequiredToSell..' ilość funkcjonariuszy na służbie, aby sprzedawać narkotyki.', 'warning', 5000)
	end
end)


RegisterServerEvent('drugsNotify')
AddEventHandler('drugsNotify', function()
	TriggerClientEvent("drugsEnable", source)
end)

--if you need you can translate it to your language
RegisterServerEvent('drugsInProgress')
AddEventHandler('drugsInProgress', function(street1, street2, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1.."~r~ and ~w~"..street2)
	TriggerClientEvent("outlawNotify", -1, "~r~Sprzedarz dragów przez ~w~"..sex.." ~r~między ~w~"..street1.."~r~ a ~w~"..street2)
end)
--if you need you can translate it to your language too
RegisterServerEvent('drugsInProgressS1')
AddEventHandler('drugsInProgressS1', function(street1, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1)
	TriggerClientEvent("outlawNotify", -1, "~r~Sprzedarz dragów przez ~w~"..sex.." ~r~przy ulicy ~w~"..street1)
end)

RegisterServerEvent('drugsInProgressPos')
AddEventHandler('drugsInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('drugsPlace', -1, gx, gy, gz)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697552057267126272/eSxxjKreNkDfmIDyLuIfI7f7WcNJW3wEZopj6LTi2XqvmZ0lbsCNSaW_KlcwPUWPwkuB", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end