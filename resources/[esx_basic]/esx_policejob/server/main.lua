ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'police', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
        sendNotification(_source, 'Niepoprawna wartość...', 'warning', 5000)
			else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
        sendNotification(_source, 'Skonfiskowałeś '..sourceItem.label..' w ilości '..amount..' od '..targetXPlayer.name..'', 'success', 5000)
        sendNotification(target, 'Skonfiskowano Ci '..sourceItem.label..' w ilości '..amount..' przez '..sourceXPlayer.name..'', 'warning', 5000)
			end
		else
			sendNotification(_source, 'Niepoprawna wartość...', 'warning', 5000)
		end

	elseif itemType == 'item_account' then
		if amount == nil then amount = 1 end

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)
    sendNotification(_source, 'Skonfiskowałeś '..ESX.GetWeaponLabel(itemName)..' ('..amount..') od '..targetXPlayer.name..'', 'success', 5000)
    sendNotification(target, 'Skonfiskowano Ci '..ESX.GetWeaponLabel(itemName)..' ('..amount..') przez '..sourceXPlayer.name..'', 'warning', 5000)
	end
end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
  TriggerClientEvent('esx_policejob:handcuff', target)
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_policejob:drag', target, _source)
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
  TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
    TriggerClientEvent('esx_policejob:OutVehicle', target)
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				sendNotification(_source, 'Niepoprawna wartość...', 'warning', 5000)
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			sendNotification(_source, 'Niepoprawna wartość...', 'warning', 5000)
		end
	end)

end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			sendNotification(xPlayer.source, 'Niepoprawna wartość...', 'warning', 5000)
		end

	end)

end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user          = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " cm"

    local data = {
      name        = GetPlayerName(target),
      job         = xPlayer.job,
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }

    TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', target, function(licenses)
        data.licenses = licenses
        cb(data)
      end)

    else
      cb(data)
    end

  else

    local xPlayer = ESX.GetPlayerFromId(target)

    local data = {
      name       = GetPlayerName(target),
      job        = xPlayer.job,
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    TriggerEvent('esx_license:getLicenses', target, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_policejob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE plate = @plate', 
		{
			['@plate'] = plate
		},
		function(result)
			if result[1] ~= nil then

				MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
					['@identifier'] = result[1].owner
				}, function(result2)
	
					if Config.EnableESXIdentity then
						cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
					else
						cb(result2[1].name, true)
					end

				end)
			else
				cb(_U('unknown'), false)
			end
		end
	)
end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

  local xPlayer = ESX.GetPlayerFromId(source)

  if removeWeapon then
   xPlayer.removeWeapon(weaponName)
   
   local PlayerName = GetPlayerName(source)
	local message = "Gracz **" .. PlayerName .. "** wkłada broń ***" .. ESX.GetWeaponLabel(weaponName) .. "*** do zbrojowni."
	BetonoweLogi("Zbrojownia - Wkładam Broń",PlayerName,message,xPlayer.identifier,4886754)
  end

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)
  
  local PlayerName = GetPlayerName(source)
	local message = "Gracz **" .. PlayerName .. "** wyjmuje broń ***" .. ESX.GetWeaponLabel(weaponName) .. "*** do zbrojowni."
	BetonoweLogi("Zbrojownia - Wkładam Broń",PlayerName,message,xPlayer.identifier,16098851)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_policejob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)

AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source
	
	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_policejob:updateBlip', -1)
		end
	end	
end)

function BetonoweLogi (title,name,message,steamID,color)
  local embeds = {
      {
          ["title"] = title,
          ["type"] = "rich",
          ["description"] = message,
          ["color"] = color,
  --		  ["timestamp"] = os.time(),
          ["footer"] =  {
              ["icon_url"] = "https://i.imgur.com/6aPjIDn.png",
              ["text"] = steamID,
          },
          ["author"] = {
              ["name"] = name,
              ["url"] = "http://societyrp.pl",
              ["icon_url"] = "https://i.imgur.com/S4huusc.png",
          }
      }
  }
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest("https://discordapp.com/api/webhooks/617411755554897931/HWqqQqrc5gsqXRrD9fQ_kKbWM0GSvjOSZQF3_RxCDIe2Vy997hiy2xKz7vUA-Qb52aNa", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'police' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_policejob:forceBlip')
AddEventHandler('esx_policejob:forceBlip', function()
	TriggerClientEvent('esx_policejob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_policejob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'police')
	end
end)

RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

ESX.RegisterUsableItem('handcuff', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_policejob:CitizenHandcuff',source)

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