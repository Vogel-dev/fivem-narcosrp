ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('salty_crafting:getPlayerInventory')
AddEventHandler('salty_crafting:getPlayerInventory', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		TriggerClientEvent('salty_crafting:openMenu', _source, xPlayer.inventory)
	end
end)

function findRecipe(list)
	for item, ingredients in pairs(Config.Recipes) do
		if #ingredients == #list then
			-- same length, let's compare
			local found = 0
			for i=1, #ingredients, 1 do
				for j=1, #list, 1 do
					if ingredients[i].item == list[j].item and ingredients[i].quantity == list[j].quantity then
						found = found + 1
					end
				end
			end
			if found == #list then
				return item
			end
		end
	end
	return false
end

function hasAllIngredients(inventory, ingredients)
	for i=1, #ingredients, 1 do
		for j=1, #inventory, 1 do
			if ingredients[i].name == inventory[j].name then
				if inventory[j].count < ingredients[i].quantity then
					return false
				end
			end
		end
	end
	return true
end

function itemLabel(name, inventory)
	if string.match(string.lower(name), "weapon_") then
		return ESX.GetWeaponLabel(name)
	else
		for i=1, #inventory, 1 do
			if inventory[i].name == name then
				return inventory[i].label
			end
		end
	end
	return "unknown item"
end

RegisterServerEvent('salty_crafting:craftItem')
AddEventHandler('salty_crafting:craftItem', function(ingredients)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)
	local item = findRecipe(ingredients)
	if not item then
		sendNotification(_source, 'Nie odnaleziono takiej receptury.', 'error', 5000)
	else
		if xPlayer ~= nil then
			if hasAllIngredients(xPlayer.inventory, Config.Recipes[item]) then
				for _,ingredient in pairs(Config.Recipes[item]) do
					if (ingredient.remove ~= nil and ingredient.remove) or (ingredient.remove == nil) then
						xPlayer.removeInventoryItem(ingredient.item, ingredient.quantity)
					end
				end
				if string.match(string.lower(item), "weapon_") then
					xPlayer.addWeapon(item, Config.WeaponAmmo)
				else
					xPlayer.addInventoryItem(item, 1)
				end
				sendNotification(_source, 'Uzyskałeś: '..itemLabel(item, xPlayer.inventory)..'', 'success', 5000)
				local message = "Gracz **"..PlayerName.."** zmieszał składniki uzyskując **" .. item .. "** "
        		narcrp_logs("Crafting - Utworzenie przedmiotu",PlayerName,message,xPlayer.identifier,0x00ffff)
			else
				sendNotification(_source, 'Nie posiadasz wszystkich składników.', 'error', 5000)
			end
		end
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
      PerformHttpRequest("https://discordapp.com/api/webhooks/698532138550689883/xLNYxlhC4Z8jxBvhUSMJ_gw0dJUFdiCm7WHFllM1xALmRy_8fU0Oh6wo8xXE2Bjwjj5D", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end