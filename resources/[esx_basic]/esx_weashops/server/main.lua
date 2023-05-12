ESX               = nil
local ItemsLabels = {}
local GunShopPrice = Config.EnableClip.GunShop.Price
local GunShopLabel = Config.EnableClip.GunShop.Label
local BlackWeashopPrice = Config.EnableClip.BlackWeashop.Price
local BlackWeashopLabel = Config.EnableClip.BlackWeashop.Label

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
  TriggerEvent('esx_license:getLicenses', source, function (licenses)
    TriggerClientEvent('esx_weashop:loadLicenses', source, licenses)
  end)
end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end

RegisterServerEvent('esx_weashop:buyLicense')
AddEventHandler('esx_weashop:buyLicense', function ()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.get('money') >= Config.LicensePrice then
    xPlayer.removeMoney(Config.LicensePrice)

    TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
      LoadLicenses(_source)
    end)
  else
    sendNotification(_source, 'Nie posiadasz wystarczającej sumy pieniędzy.', 'error', 5000)
  end
end)


ESX.RegisterServerCallback('esx_weashop:requestDBItems', function(source, cb)

  MySQL.Async.fetchAll(
    'SELECT * FROM weashops',
    {},
    function(result)

      local shopItems  = {}

      for i=1, #result, 1 do

        if shopItems[result[i].name] == nil then
          shopItems[result[i].name] = {}
        end

        table.insert(shopItems[result[i].name], {
          name  = result[i].item,
          price = result[i].price,
          label = ESX.GetWeaponLabel(result[i].item)
        })
      end
	  
	  if Config.EnableClipGunShop == true then
		table.insert(shopItems["GunShop"], {
          name  = "clip",
          price = GunShopPrice,--Config.EnableClip.GunShop.Price,
          label = GunShopLabel--Config.EnableClip.GunShop.label
        })
		end
		
		if Config.EnableClipGunShop == true then
		table.insert(shopItems["BlackWeashop"], {
          name  = "clip",
          price = BlackWeashopPrice,--Config.EnableClip.BlackWeashop.Price,
          label = BlackWeashopLabel--Config.EnableClip.BlackWeashop.label
        })
		end
      cb(shopItems)

    end
  )

end)


RegisterServerEvent('esx_weashop:buyItem')
AddEventHandler('esx_weashop:buyItem', function(itemName, price, zone)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local account = xPlayer.getAccount('black_money')
  local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local PlayerName = GetPlayerName(source)

  if zone=="BlackWeashop" then
    if account.money >= price then
		if itemName == "clip" then
			xPlayer.addInventoryItem(itemName, 1)
      sendNotification(_source, 'Pomyślnie zakupiono magazynek.', 'success', 5000)
		else
			xPlayer.addWeapon(itemName, 42)
      sendNotification(_source, 'Pomyślnie zakupiono '..ESX.GetWeaponLabel(itemName)..'.', 'success', 5000)
      local message = "Gracz **"..PlayerName.."** zakupił **" .. ESX.GetWeaponLabel(itemName) .. "**"
      narcrp_logs("Czarny sklep - kupno broni",PlayerName,message,xPlayer.identifier,0xb30000)
		end
		xPlayer.removeAccountMoney('black_money', price)
	else
    sendNotification(_source, 'Nie posiadasz wystarczającej sumy brudnych pieniędzy.', 'warning', 5000)
	end

  else if xPlayer.get('money') >= price then
		if itemName == "clip" then
			xPlayer.addInventoryItem(itemName, 1)
			sendNotification(_source, 'Pomyślnie zakupiono magazynek.', 'success', 5000)
		else
			
			xPlayer.addWeapon(itemName, 42)
      sendNotification(_source, 'Pomyślnie zakupiono '..ESX.GetWeaponLabel(itemName)..'.', 'success', 5000)
      local message = "Gracz **"..PlayerName.."** zakupił **" .. ESX.GetWeaponLabel(itemName) .. "**"
      narcrp_logs("Sklep z bronią - kupno broni",PlayerName,message,xPlayer.identifier,0x38cbf5)
		end
		xPlayer.removeMoney(price)
  else
    sendNotification(_source, 'Nie posiadasz wystarczającej sumy pieniędzy.', 'warning', 5000)
  end
  end

end)

-- thx to Pandorina for script
RegisterServerEvent('esx_weashop:remove')
AddEventHandler('esx_weashop:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_weashop:clipcli', source)
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
    PerformHttpRequest("https://discordapp.com/api/webhooks/697552501813018669/66lb-VKA04oGdLsghYCGJpWHxH8yk9EII7pheQ72A2pE20xL_o2sRBq9v_lSxnNFdLJZ", function(err, text, headers) end, 'POST', json.encode({ username = title, embeds = embeds}), { ['Content-Type'] = 'application/json' })
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
