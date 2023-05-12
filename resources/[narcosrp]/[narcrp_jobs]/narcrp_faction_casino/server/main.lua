ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'kasyno', Config.MaxInService)
end

-- TriggerEvent('esx_phone:registerNumber', 'kasyno', _U('alert_kasyno'), true, true)
TriggerEvent('esx_society:registerSociety', 'kasyno', 'kasyno', 'society_kasyno', 'society_kasyno', 'society_kasyno', {type = 'public'})

RegisterServerEvent('esx_kasynojob:giveWeapon')
AddEventHandler('esx_kasynojob:giveWeapon', function(weapon, ammo)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_kasynojob:confiscatePlayerItem')
AddEventHandler('esx_kasynojob:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local sourceXPlayer = ESX.GetPlayerFromId(source)
  local targetXPlayer = ESX.GetPlayerFromId(target)

  if itemType == 'item_standard' then

    local label = sourceXPlayer.getInventoryItem(itemName).label

    targetXPlayer.removeInventoryItem(itemName, amount)
    sourceXPlayer.addInventoryItem(itemName, amount)

    sendNotification(sourceXPlayer.source, 'Skonfiskowałeś '..label..' w ilości '..amount..' od '..targetXPlayer.name..'', 'success', 5000)
    sendNotification(targetXPlayer.source, 'Skonfiskowano Ci '..label..' w ilości '..amount..' przez '..targetXPlayer.name..'', 'warning', 5000)

  end

  if itemType == 'item_account' then

    targetXPlayer.removeAccountMoney(itemName, amount)
    sourceXPlayer.addAccountMoney(itemName, amount)

    sendNotification(sourceXPlayer.source, 'Skonfiskowałeś '..amount..' $ od '..targetXPlayer.name..'', 'success', 5000)
    sendNotification(targetXPlayer.source, 'Skonfiskowano Ci '..amount..' $ przez '..targetXPlayer.name..'', 'warning', 5000)

  end

  if itemType == 'item_weapon' then

    targetXPlayer.removeWeapon(itemName)
    sourceXPlayer.addWeapon(itemName, amount)
    
    sendNotification(sourceXPlayer.source, 'Skonfiskowałeś '..ESX.GetWeaponLabel(itemName)..' od '..targetXPlayer.name..'', 'success', 5000)
    sendNotification(targetXPlayer.source, 'Skonfiskowano Ci '..ESX.GetWeaponLabel(itemName)..' przez '..targetXPlayer.name..'', 'warning', 5000)

  end

end)

RegisterServerEvent('esx_kasynojob:zakuj')
AddEventHandler('esx_kasynojob:zakuj', function(target)
  TriggerClientEvent('esx_kasynojob:zakuj', target)
end)

RegisterServerEvent('esx_kasynojob:drag')
AddEventHandler('esx_kasynojob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_kasynojob:drag', target, _source)
end)

RegisterServerEvent('esx_kasynojob:putInVehicle')
AddEventHandler('esx_kasynojob:putInVehicle', function(target)
  TriggerClientEvent('esx_kasynojob:putInVehicle', target)
end)

RegisterServerEvent('esx_kasynojob:OutVehicle')
AddEventHandler('esx_kasynojob:OutVehicle', function(target)
    TriggerClientEvent('esx_kasynojob:OutVehicle', target)
end)

RegisterServerEvent('esx_kasynojob:getStockItem')
AddEventHandler('esx_kasynojob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kasyno', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      sendNotification(xPlayer.source, 'Nieprawidłowa wartość', 'error', 5000)
    end

    sendNotification(xPlayer.source, 'Zabrałeś '..item.label..' w ilości '..count..'', 'success', 5000)

  end)

end)

RegisterServerEvent('esx_kasynojob:putStockItems')
AddEventHandler('esx_kasynojob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kasyno', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      sendNotification(xPlayer.source, 'Nieprawidłowa wartość', 'error', 5000)
    end

    sendNotification(xPlayer.source, 'Włożyłeś '..item.label..' w ilości '..count..'', 'success', 5000)

  end)

end)

ESX.RegisterServerCallback('esx_kasynojob:getOtherPlayerData', function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " Inches"

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

    TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', source, function(licenses)
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

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_kasynojob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types_kasyno WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_kasynojob:getVehicleInfos', function(source, cb, plate)

  if Config.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

ESX.RegisterServerCallback('esx_kasynojob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kasyno', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_kasynojob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kasyno', function(store)

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

ESX.RegisterServerCallback('esx_kasynojob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_kasyno', function(store)

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


ESX.RegisterServerCallback('esx_kasynojob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kasyno', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_kasynojob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kasyno', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_kasynojob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

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
