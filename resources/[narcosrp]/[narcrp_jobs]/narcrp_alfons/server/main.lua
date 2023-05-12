ESX = nil
local lastPlayerSuccess = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'alfons', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'alfons', _U('alfons_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'alfons', 'Alfons', 'society_alfons', 'society_alfons', 'society_alfons', {type = 'public'})

RegisterNetEvent('esx_alfonsjob:success')
AddEventHandler('esx_alfonsjob:success', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local PlayerName = GetPlayerName(source)
	local timeNow = os.clock()

	if xPlayer.job.name == 'alfons' then
		if not lastPlayerSuccess[source] or timeNow - lastPlayerSuccess[source] > 5 then
			lastPlayerSuccess[source] = timeNow

			math.randomseed(os.time())
			local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max)

			if xPlayer.job.grade >= 3 then
				total = total * 2
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_alfons', function(account)
				if account then
					local playerMoney  = ESX.Math.Round(total / 100 * 30)
					local societyMoney = ESX.Math.Round(total / 100 * 70)

					xPlayer.addMoney(playerMoney)
					account.addMoney(societyMoney)

					sendNotification(source, 'Dotarłeś z klientem do celu, twoje wynagrodzenie za kurs: '..playerMoney..' $', 'success', 5000)
					local message = "Gracz **"..PlayerName.."** dotarł do celu, za kurs otrzymał: ***"..playerMoney.." $***"
        			narcos_logs("Alfons - Kurs ukończony",PlayerName,message,xPlayer.identifier,0xdf44c8)
				else
					xPlayer.addMoney(total)
				end
			end)
		end
	else
		print(('[esx_alfonsjob] [^3WARNING^7] %s attempted to trigger success (cheating)'):format(xPlayer.identifier))
	end
end)

RegisterNetEvent('esx_alfonsjob:getStockItem')
AddEventHandler('esx_alfonsjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'alfons' then
		TriggerEvent('esx_addoninventory:getSharedInventory', 'society_alfons', function(inventory)
			local item = inventory.getItem(itemName)

			-- is there enough in the society?
			if count > 0 and item.count >= count then
				-- can the player carry the said amount of x item?
				if xPlayer.canCarryItem(itemName, count) then
					inventory.removeItem(itemName, count)
					xPlayer.addInventoryItem(itemName, count)
					xPlayer.showNotification(_U('have_withdrawn', count, item.label))
				else
					xPlayer.showNotification(_U('player_cannot_hold'))
				end
			else
				xPlayer.showNotification(_U('quantity_invalid'))
			end
		end)
	else
		print(('[esx_alfonsjob] [^3WARNING^7] %s attempted to trigger getStockItem'):format(xPlayer.identifier))
	end
end)

ESX.RegisterServerCallback('esx_alfonsjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_alfons', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterNetEvent('esx_alfonsjob:putStockItems')
AddEventHandler('esx_alfonsjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'alfons' then
		TriggerEvent('esx_addoninventory:getSharedInventory', 'society_alfons', function(inventory)
			local item = inventory.getItem(itemName)

			if item.count >= 0 then
				xPlayer.removeInventoryItem(itemName, count)
				inventory.addItem(itemName, count)
				xPlayer.showNotification(_U('have_deposited', count, item.label))
			else
				xPlayer.showNotification(_U('quantity_invalid'))
			end
		end)
	else
		print(('[esx_alfonsjob] [^3WARNING^7] %s attempted to trigger putStockItems'):format(xPlayer.identifier))
	end
end)

ESX.RegisterServerCallback('esx_alfonsjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(xPlayer.getInventory())
end)

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomCenter"
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
