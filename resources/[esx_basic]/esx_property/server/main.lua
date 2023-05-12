ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetProperty(name)
	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name == name then
			return Config.Properties[i]
		end
	end
end

function SetPropertyOwned(name, price, rented, owner)
	MySQL.Async.execute('INSERT INTO owned_properties (name, price, rented, owner) VALUES (@name, @price, @rented, @owner)',
	{
		['@name']   = name,
		['@price']  = price,
		['@rented'] = (rented and 1 or 0),
		['@owner']  = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, true)

			if rented then
				sendNotification(xPlayer.source, 'Pomyślnie wynająłeś mieszkanie za: '..ESX.Math.GroupDigits(price)..' $', 'success', 5000)
			else
				sendNotification(xPlayer.source, 'Pomyślnie zakupiłeś mieszkanie za: '..ESX.Math.GroupDigits(price)..' $', 'success', 5000)
			end
		end
	end)
end

function RemoveOwnedProperty(name, owner)
	MySQL.Async.execute('DELETE FROM owned_properties WHERE name = @name AND owner = @owner',
	{
		['@name']  = name,
		['@owner'] = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('esx_property:setPropertyOwned', xPlayer.source, name, false)
			sendNotification(xPlayer.source, 'Opuściłeś mieszkanie.', 'info', 5000)
		end
	end)
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM properties', {}, function(properties)

		for i=1, #properties, 1 do
			local entering  = nil
			local exit      = nil
			local inside    = nil
			local outside   = nil
			local isSingle  = nil
			local isRoom    = nil
			local isGateway = nil
			local roomMenu  = nil

			if properties[i].entering ~= nil then
				entering = json.decode(properties[i].entering)
			end

			if properties[i].exit ~= nil then
				exit = json.decode(properties[i].exit)
			end

			if properties[i].inside ~= nil then
				inside = json.decode(properties[i].inside)
			end

			if properties[i].outside ~= nil then
				outside = json.decode(properties[i].outside)
			end

			if properties[i].is_single == 0 then
				isSingle = false
			else
				isSingle = true
			end

			if properties[i].is_room == 0 then
				isRoom = false
			else
				isRoom = true
			end

			if properties[i].is_gateway == 0 then
				isGateway = false
			else
				isGateway = true
			end

			if properties[i].room_menu ~= nil then
				roomMenu = json.decode(properties[i].room_menu)
			end

			table.insert(Config.Properties, {
				name      = properties[i].name,
				label     = properties[i].label,
				entering  = entering,
				exit      = exit,
				inside    = inside,
				outside   = outside,
				ipls      = json.decode(properties[i].ipls),
				gateway   = properties[i].gateway,
				isSingle  = isSingle,
				isRoom    = isRoom,
				isGateway = isGateway,
				roomMenu  = roomMenu,
				price     = properties[i].price
			})
		end

		TriggerClientEvent('esx_property:sendProperties', -1, Config.Properties)
	end)

end)

ESX.RegisterServerCallback('esx_property:getProperties', function(source, cb)
	cb(Config.Properties)
end)

AddEventHandler('esx_ownedproperty:getOwnedProperties', function(cb)
	MySQL.Async.fetchAll('SELECT * FROM owned_properties', {}, function(result)
		local properties = {}

		for i=1, #result, 1 do
			table.insert(properties, {
				id     = result[i].id,
				name   = result[i].name,
				label  = GetProperty(result[i].name).label,
				price  = result[i].price,
				rented = (result[i].rented == 1 and true or false),
				owner  = result[i].owner
			})
		end

		cb(properties)
	end)
end)

AddEventHandler('esx_property:setPropertyOwned', function(name, price, rented, owner)
	SetPropertyOwned(name, price, rented, owner)
end)

AddEventHandler('esx_property:removeOwnedProperty', function(name, owner)
	RemoveOwnedProperty(name, owner)
end)

RegisterServerEvent('esx_property:rentProperty')
AddEventHandler('esx_property:rentProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)
	local rent     = ESX.Math.Round(property.price / 200)

	SetPropertyOwned(propertyName, rent, true, xPlayer.identifier)
end)

RegisterServerEvent('esx_property:buyProperty')
AddEventHandler('esx_property:buyProperty', function(propertyName)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)

	if property.price <= xPlayer.getMoney() then
		xPlayer.removeMoney(property.price)
		SetPropertyOwned(propertyName, property.price, false, xPlayer.identifier)
	else
		sendNotification(source, 'Nie posiadasz wystarczającej sumy pieniędzy.', 'error', 5000)
	end
end)

RegisterServerEvent('esx_property:removeOwnedProperty')
AddEventHandler('esx_property:removeOwnedProperty', function(propertyName)
	local xPlayer = ESX.GetPlayerFromId(source)
	RemoveOwnedProperty(propertyName, xPlayer.identifier)
end)

AddEventHandler('esx_property:removeOwnedPropertyIdentifier', function(propertyName, identifier)
	RemoveOwnedProperty(propertyName, identifier)
end)

RegisterServerEvent('esx_property:saveLastProperty')
AddEventHandler('esx_property:saveLastProperty', function(property)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = @last_property WHERE identifier = @identifier',
	{
		['@last_property'] = property,
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_property:deleteLastProperty')
AddEventHandler('esx_property:deleteLastProperty', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = NULL WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('esx_property:getItem')
AddEventHandler('esx_property:getItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then

		local sourceItem = xPlayer.getInventoryItem(item)

		TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
			
				-- can the player carry the said amount of x item?
				if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
					sendNotification(_source, 'Nie posiadasz wystarczająco wolnego miejsca w ekwipunku.', 'warning', 5000)
				else
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					sendNotification(_source, 'Wyciągasz '..inventoryItem.label..' w ilości '..count..'.', 'error', 5000)
					local message = "Gracz **"..PlayerName.."** wyjmuje z mieszkania **" .. inventoryItem.label .. "** w ilości ***"..count.."*** "
        			narcrp_logs("Mieszkanie - wyjęcie przedmiotu",PlayerName,message,xPlayer.identifier,0x0080ff)
				end
			else
				sendNotification(_source, 'Nie posiadasz wystarczająco tego przedmiotu w mieszkaniu', 'error', 5000)
			end
		end)

	elseif type == 'item_account' then

		TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
				local message = "Gracz **"..PlayerName.."** wyjmuje z mieszkania **" .. item .. "** w ilości ***"..count.."*** "
        		narcrp_logs("Mieszkanie - wyjęcie przedmiotu",PlayerName,message,xPlayer.identifier,0xff0000)
			else
				sendNotification(_source, 'Nieprawidłowa wartość.', 'error', 5000)
			end
		end)

	elseif type == 'item_weapon' then

		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
			local message = "Gracz **"..PlayerName.."** wyjmuje z mieszkania **" .. weaponName .. "** z ammo ***"..ammo.."*** "
        	narcrp_logs("Mieszkanie - wyjęcie przedmiotu",PlayerName,message,xPlayer.identifier,0xff8000)
		end)

	end

end)

RegisterServerEvent('esx_property:putItem')
AddEventHandler('esx_property:putItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local PlayerName = GetPlayerName(source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then

		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayerOwner.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				sendNotification(_source, 'Odkładasz '..item..' w ilości '..count..'.', 'error', 5000)
				local message = "Gracz **"..PlayerName.."** odkłada w mieszkaniu **" .. item .. "** w ilości ***"..count.."*** "
        		narcrp_logs("Mieszkanie - depozyt przedmiotu",PlayerName,message,xPlayer.identifier,0x8080ff)
			end)
		else
			sendNotification(_source, 'Nieprawidłowa wartość.', 'error', 5000)
		end

	elseif type == 'item_account' then

		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'property_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
				local message = "Gracz **"..PlayerName.."** odkłada w mieszkaniu **" .. item .. "** w ilości ***"..count.."*** "
        		narcrp_logs("Mieszkanie - depozyt przedmiotu",PlayerName,message,xPlayer.identifier,0x80ff80)
			end)
		else
			sendNotification(_source, 'Nieprawidłowa wartość.', 'error', 5000)
		end

	elseif type == 'item_weapon' then

		TriggerEvent('esx_datastore:getDataStore', 'property', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}

			table.insert(storeWeapons, {
				name = item,
				ammo = count
			})

			store.set('weapons', storeWeapons)
			xPlayer.removeWeapon(item)
			local message = "Gracz **"..PlayerName.."** odkłada w mieszkaniu **" .. item .. "**"
        	narcrp_logs("Mieszkanie - depozyt przedmiotu",PlayerName,message,xPlayer.identifier,0x800040)
		end)

	end

end)

ESX.RegisterServerCallback('esx_property:getOwnedProperties', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE owner = @owner', {
	['@owner'] = xPlayer.identifier
	}, function(ownedProperties)
		local properties = {}

		for i=1, #ownedProperties, 1 do
			table.insert(properties, ownedProperties[i].name)
		end

		cb(properties)
	end)
end)

ESX.RegisterServerCallback('esx_property:getLastProperty', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT last_property FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		cb(users[1].last_property)
	end)
end)

ESX.RegisterServerCallback('esx_property:getPropertyInventory', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'property_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'property', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

ESX.RegisterServerCallback('esx_property:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('esx_property:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('esx_property:removeOutfit')
AddEventHandler('esx_property:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

function PayRent(d, h, m)
	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE rented = 1', {}, function (result)
		for i=1, #result, 1 do
			local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

			-- message player if connected
			if xPlayer then
				xPlayer.removeAccountMoney('bank', result[i].price)
				sendNotification(xPlayer.source, 'Zapłaciłeś za wynajem mieszkania: '..ESX.Math.GroupDigits(result[i].price)..' $', 'info', 5000)
			else -- pay rent either way
				MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier',
				{
					['@bank']       = result[i].price,
					['@identifier'] = result[i].owner
				})
			end

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
				account.addMoney(result[i].price)
			end)
		end
	end)
end

TriggerEvent('cron:runAt', 22, 0, PayRent)

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
      PerformHttpRequest("https://discordapp.com/api/webhooks/697553065288400976/jo3BUukKPtFBuKNud__kPRUpfUO5K2gj5HiHMsxxHtI_0GFeB_Xzexrg5VOzCNYBAHqD", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
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
