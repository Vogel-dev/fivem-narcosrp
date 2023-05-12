ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clothes:sellVehicle')
AddEventHandler('esx_clothes:sellVehicle', function(target, plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _target = target
	local tPlayer = ESX.GetPlayerFromId(_target)
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
			['@identifier'] = xPlayer.identifier,
			['@plate'] = plate
		})
	if result[1] ~= nil then
		MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = plate,
			['@target'] = tPlayer.identifier
		}, function (rowsChanged)
			if rowsChanged ~= 0 then
				TriggerClientEvent('esx_contract:showAnim', _source)
				Wait(22000)
				TriggerClientEvent('esx_contract:showAnim', _target)
				Wait(22000)
				sendNotification(_source, 'Sprzedałeś pojazd o rejestracji: '..plate..'', 'success', 5000)
				sendNotification(_target, 'Zakupiłes pojazd o rejestracji: '..plate..'', 'success', 5000)
				xPlayer.removeInventoryItem('contract', 1)
				
				local PlayerName = GetPlayerName(_source)
				local TargetName = GetPlayerName(_target)
				local message = "Gracz **" .. PlayerName .. "** przekazuje umową sprzedaży graczowi ***" .. TargetName .. "[" .. tPlayer.identifier .. "]*** pojazd o rejestracji [" .. plate .. "]"
				narcos_logs("Przekazanie Pojazdu",PlayerName,message,xPlayer.identifier,16761856)
				
			end
		end)
	else
		sendNotification(_source, 'Ten pojazd nie należy do Ciebie.', 'error', 5000)
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697599112421441576/nnoRwloDpaKjnZsw153BAKPD-Z5uGfsHIIcSh0aZyQ_LfClKrA-RlKqyaMTL-G0yPoxC", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

ESX.RegisterUsableItem('contract', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_contract:getVehicle', _source)
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