local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX								= nil
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local isDead					= false
local firstjoin = true
local clothe = 0
local maska = true
local ubieranie = false
local second = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenAccessoryMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory',
	{
		title = _U('set_unset'),
		align = 'bottom-right',
		elements = {
			{label = _U('helmet'), value = 'Helmet'},
			{label = _U('ears'), value = 'Ears'},
			{label = _U('glasses'), value = 'Glasses'},
			{label = _U('mask'), value = 'Mask'},
		}
	}, function(data, menu)
		menu.close()
		SetUnsetAccessory(data.current.value)

	end, function(data, menu)
		menu.close()
	end)
end

function SetUnsetAccessory(accessory)
	ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
		local _accessory = string.lower(accessory)

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0

				if _accessory == "mask" then
					mAccessory = 0
				end

				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end

				local accessorySkin = {}
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
			end)
		else
			sendNotification('Nie posiadasz tego elementu garderoby.', 'warning', 5000)
		end

	end, accessory)
end

function OpenShopMenu(accessory)
	local _accessory = string.lower(accessory)
	local restrict = {}

	restrict = { _accessory .. '_1', _accessory .. '_2' }
	
	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm',
		{
			title = _U('valid_purchase'),
			align = 'center',
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes', ESX.Math.GroupDigits(Config.Price)), value = 'yes'}
			}
		}, function(data, menu)
			menu.close()
			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_accessories:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerServerEvent('esx_accessories:pay')
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_accessories:save', skin, accessory)
						end)
					else
						TriggerEvent('esx_skin:getLastSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
						sendNotification('Nie posiadasz wystarzcającej ilości gotówki.', 'error', 5000)
					end
				end)
			end

			if data.current.value == 'no' then
				local player = PlayerPedId()
				TriggerEvent('esx_skin:getLastSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
				if accessory == "Ears" then
					ClearPedProp(player, 2)
				elseif accessory == "Mask" then
					SetPedComponentVariation(player, 1, 0 ,0, 2)
				elseif accessory == "Helmet" then
					ClearPedProp(player, 0)
				elseif accessory == "Glasses" then
					SetPedPropIndex(player, 1, -1, 0, 0)
				end
			end
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}

		end)
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_access')
		CurrentActionData = {}
	end, restrict)
end

AddEventHandler('playerSpawned', function()
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
end)

AddEventHandler('esx_accessories:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_access')
	CurrentActionData = { accessory = zone }
end)

AddEventHandler('esx_accessories:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Create Blips --
Citizen.CreateThread(function()
	for k,v in pairs(Config.ShopsBlips) do
		if v.Pos ~= nil then
			for i=1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)

				SetBlipSprite (blip, v.Blip.sprite)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, v.Blip.color)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('shop', _U(string.lower(k))))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance) then
					DrawMarker(Config.Type, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)

		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil
		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.Size.x then
					isInMarker  = true
					currentZone = k
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone = currentZone
			TriggerEvent('esx_accessories:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_accessories:hasExitedMarker', LastZone)
		end

	end
end)

function menu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'clothes',
	{
		title    = 'Menu',
		align    = 'bottom-right',
		elements = {
			{label = 'Akcesoria',	value = 'akcesoria'},
			{label = 'Ubrania',		value = 'ubrania'},


		}
	}, function(data, menu)

--thirst15
--legs14 1
--torso 15
--arms15
--shoes34
		               
					local action = data.current.value

					if action == 'akcesoria' then
									OpenAccessoryMenu()
					elseif action == 'ubrania' then
								menux2()				

					
					end





	

	end, function(data, menu)
		menu.close()
	end)
end

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and CurrentActionData.accessory then
				OpenShopMenu(CurrentActionData.accessory)
				CurrentAction = nil
			end
		elseif CurrentAction == nil and not Config.EnableControls then
			Citizen.Wait(500)
		end

		if Config.EnableControls then
			if GetLastInputMethod(2) and not isDead then
		if IsControlJustReleased(0, Keys['K']) and not firstjoin then
			menu()
elseif IsControlJustReleased(0, Keys['K']) and firstjoin then
TriggerEvent('esx_ciuchy:wear')

firstjoin = false
Citizen.Wait(100)
menu()


		end
			end
		end

	end
end)


function menux2()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'clothes',
	{
		title    = 'Menu',
		align    = 'bottom-right',
		elements = {
			{label = 'Szalik',		value = 'chain'},
			{label = 'Torba',		value = 'bag'},
			{label = 'Kurtka',	value = 'coat'},
			{label = 'Koszulka',	value = 'tshirt'},
			{label = 'Spodnie',	value = 'legs'},
			{label = 'Buty',		value = 'shoes'},


		}
	}, function(data, menu)

--thirst15
--legs14 1
--torso 15
--arms15
--shoes34
		local dict = "clothingtrousers"
		local dict1 = "clothingshirt"
		local dict2 = "clothingshoes"
		local dict3 = "clothingtie"
		local dict4 = "mp_masks@on_foot"
                local dict5 = "missfbi4"
                local dict6 = "amb@medic@standing@kneel@base"
    
    RequestAnimDict(dict)
    RequestAnimDict(dict1)
    RequestAnimDict(dict2)
    RequestAnimDict(dict3)
    RequestAnimDict(dict4)
    RequestAnimDict(dict5)
    RequestAnimDict(dict6)

    while not HasAnimDictLoaded(dict) and HasAnimDictLoaded(dict1) and HasAnimDictLoaded(dict2) and HasAnimDictLoaded(dict3) and HasAnimDictLoaded(dict4)  do
        Citizen.Wait(100)
    end
		               
					local action = data.current.value

					if action == 'chain' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict3, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
					
if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 7) then
TriggerServerEvent('esx_ciuchy:szalik')
else
SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2)

end
--TriggerEvent('esx_ciuchy:ubierz')

elseif action == 'mask' then
if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 1) then
					TaskPlayAnim(GetPlayerPed(-1), dict4, "put_on_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1000)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
TriggerServerEvent('esx_ciuchy:maska')
else
					TaskPlayAnim(GetPlayerPed(-1), dict5, "takeoff_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1000)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)

end

												
					elseif action == 'bag' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
                                   if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 5) then
TriggerServerEvent('esx_ciuchy:torba')
else
SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 2)

end



					elseif action == 'coat' and not ubieranie then

					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_c", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

    if 15 == GetPedDrawableVariation(GetPlayerPed(-1), 11) then
TriggerServerEvent('esx_ciuchy:kurtka')
else


SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 2)
end


					elseif action == 'tshirt' and not ubieranie then

					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_c", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

    if 15 == GetPedDrawableVariation(GetPlayerPed(-1), 8) then
TriggerServerEvent('esx_ciuchy:koszulka')
else


SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 2)
end
					elseif action == 'legs' and not ubieranie then
TaskPlayAnim(GetPlayerPed(-1), dict2, "try_shoes_positive_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

	TriggerEvent('skinchanger:getSkin', function(skin)
	if 14 == GetPedDrawableVariation(GetPlayerPed(-1), 4) and skin.sex == 0 or  17 == GetPedDrawableVariation(GetPlayerPed(-1), 4) and skin.sex == 1 then

TriggerServerEvent('esx_ciuchy:spodnie')
else

		if skin.sex == 0 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 14, 0, 2)
else
		SetPedComponentVariation(GetPlayerPed(-1), 4, 17, 1, 2)
end
end
end)




					elseif action == 'shoes' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict6, "base", 8.0, 8.0, -1, 11, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
	TriggerEvent('skinchanger:getSkin', function(skin)
		 if 34 == GetPedDrawableVariation(GetPlayerPed(-1), 6) and skin.sex == 0 or  35 == GetPedDrawableVariation(GetPlayerPed(-1), 6) and skin.sex == 1 then

TriggerServerEvent('esx_ciuchy:buty')
else
if skin.sex == 0 then
SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 2)
else
SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2)
end
end
end)



					end





	

	end, function(data, menu)
		menu.close()
	end)
end

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end