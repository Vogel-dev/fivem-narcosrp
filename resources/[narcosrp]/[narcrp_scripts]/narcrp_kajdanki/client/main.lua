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

local PlayerData = {}
local HasAlreadyEnteredMarker = false
local LastStation, LastPart, LastPartNum, LastEntity
local CurrentAction = nil
local CurrentActionMsg  = ''
local CurrentActionData = {}
local IsHandcuffed = false
local HandcuffTimer = {}
local DragStatus = {}
DragStatus.IsDragged = false
local hasAlreadyJoined = false
local blipsCops = {}
local isDead = false
local CurrentTask = {}
local playerInService = false
local spawnedVehicles, isInShopMenu = {}, false
local prop
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('tostKajdany:getOtherPlayerData', function(data)

		local elements = {}

		for i=1, #data.accounts, 1 do

			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then

				table.insert(elements, {
					label    = 'Brudne pieniądze: <font color=red>'..ESX.Math.Round(data.accounts[i].money)..'$</font>',
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end

		end

		table.insert(elements, {label = '<font color=orange>---Bronie---</font>', value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = 'Broń: '..ESX.GetWeaponLabel(data.weapons[i].name)..'',
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = '<font color=orange>---Ekwipunek---</font>', value = nil})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = 'Przedmiot: '..data.inventory[i].label.. ' | '..data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		{
			title    = 'Przeszukiwanie',
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			local itemType = data.current.itemType
			local itemName = data.current.value
			local amount   = data.current.amount

			if data.current.value ~= nil then
				TriggerServerEvent('tostKajdany:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
				OpenBodySearchMenu(player)
			end

		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))

end

-----------------
RegisterNetEvent('tostKajdany:MenuKajdanek')
AddEventHandler('tostKajdany:MenuKajdanek', function()
ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'tost_kajdany',
	{
		title    = 'Kajdanki',
		align    = 'bottom-right',
		elements = {
			{label = 'Zakuj/Rozkuj', value = '11'},
			{label = 'Przenieś obywatela', value = '22'},
			{label = 'Przeszukaj obywatela', value = '33'},
			{label = 'Wsadź do pojazdu', value = '44'},
			{label = 'Wyjmij do pojazdu', value = '55'}
		}
	},
	function(data2, menu2)
		if data2.current.value == '11' then
			menu2.close()
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 6.0 then
			-- sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			else
				if IsPedStill(GetPlayerPed(-1)) then
				TriggerServerEvent("tostKajdany:handcuff", GetPlayerServerId(closestPlayer))
				TriggerServerEvent('tostKajdany:PlayWithinDistance', 1.5, 'cuff', 1.0)
				RequestAnimDict('mp_arrest_paired')
				while not HasAnimDictLoaded('mp_arrest_paired') do
				Citizen.Wait(10)
				end
				--
				AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
				TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
				Citizen.Wait(3000)
				ClearPedTasks(GetPlayerPed(-1))
				DetachEntity(GetPlayerPed(-1))
				else
				-- sendNotification('Nie możesz zakuć podczas poruszania się.', 'warning', 5000)
				end
			end
		elseif data2.current.value == '22' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			else
			TriggerServerEvent("tostKajdany:drag", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
        elseif data2.current.value == '33' then
			menu2.close()
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			else
				local closestPlayerPed = GetPlayerPed(closestPlayer)
				if IsEntityPlayingAnim(closestPlayerPed, "mp_arresting", "idle", 3 ) then
				RequestAnimDict('amb@prop_human_bum_bin@idle_a')
				while not HasAnimDictLoaded('amb@prop_human_bum_bin@idle_a') do
				Citizen.Wait(10)
				end
				TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
				OpenBodySearchMenu(closestPlayer)
				else
				--sendNotification('Osoba nie jest zakuta!', 'error', 5000)
				end
			end
		elseif data2.current.value == '44' then
			menu2.close()
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			else
			TriggerServerEvent("tostKajdany:putInVehicle", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
		elseif data2.current.value == '55' then
			menu2.close()
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			else
			TriggerServerEvent("tostKajdany:OutVehicle", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
		end
		
	end,
	function(data2, menu2)
		menu2.close()
	
end)
end)

RegisterNetEvent('tostKajdany:handcuff')
AddEventHandler('tostKajdany:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			prop = CreateObject(GetHashKey('p_cs_cuffs_02_s'), x, y, z+0.2,  true,  true, true)
			AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), -0.02, 0.06, 0.04, 0.0, 100.0, 110.0, true, true, false, true, 1, true)

			RequestAnimDict('mp_arrest_paired')
			while not HasAnimDictLoaded('mp_arrest_paired') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
			Citizen.Wait(3000)
	
			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end
			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end
			

		else

			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			DeleteEntity(prop)
			
			
		end
	end)

end)

RegisterNetEvent('tostKajdany:unrestrain')
AddEventHandler('tostKajdany:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)

		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

RegisterNetEvent('tostKajdany:drag')
AddEventHandler('tostKajdany:drag', function(copID)
	if not IsHandcuffed then
		return
	end

	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if DragStatus.IsDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

				if IsPedDeadOrDying(targetPed, true) then
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)
RegisterNetEvent('tostKajdany:putInVehicle')
AddEventHandler('tostKajdany:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				DragStatus.IsDragged = false
			end
		end
	end
end)
RegisterNetEvent('tostKajdany:OutVehicle')
AddEventHandler('tostKajdany:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		if IsHandcuffed then
		ESX.UI.Menu.CloseAll()
		Citizen.Wait(700)
		else
		Citizen.Wait(1500)
		end
		
end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		if IsHandcuffed then
		Citizen.Wait(1500)
		-- sendNotification('Masz na sobie kajdanki!', 'error', 5000)
		else
		Citizen.Wait(2500)
		end
		
end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			
			DisableControlAction(2, 24, true) 
			DisableControlAction(2, 257, true) 
			DisableControlAction(2, 25, true) 
			DisableControlAction(2, 263, true) 
			DisableControlAction(2, Keys['R'], true)
			DisableControlAction(0, 140, true) 
			DisableControlAction(2, Keys['TOP'], true) 
			DisableControlAction(2, Keys['SPACE'], true) 
			DisableControlAction(2, Keys['Q'], true) 
			DisableControlAction(2, Keys['TAB'], true) 
			DisableControlAction(2, Keys['P'], true) 
			DisableControlAction(2, 59, true) 
			DisableControlAction(2, Keys['LEFTCTRL'], true)
		    DisableControlAction(0, Keys['X'], true)
			DisableControlAction(0, Keys['F2'], true)  
			DisableControlAction(0, Keys['F1'], true)  
			DisableControlAction(0, Keys['F3'], true)  
			DisableControlAction(0, Keys['F5'], true)  
			DisableControlAction(0, Keys['F4'], true)
			DisableControlAction(0, Keys['F10'], true)  
			DisableControlAction(0, Keys['F6'], true)
			DisableControlAction(0, Keys['X'], true) 
			
			
			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				Citizen.Wait(3000)
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
				TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
			
			
		else
			Citizen.Wait(500)
		end
		
		
	end
end)
AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end

	HandcuffTimer.Active = true

	HandcuffTimer.Task = ESX.SetTimeout(Config.HandcuffTimer, function()
		sendNotification('Kajdanki sie poluzowały', 'info', 5000)
		TriggerEvent('tostKajdany:unrestrain')
		HandcuffTimer.Active = false
	end)
end
RegisterNetEvent('tostKajdany2:PlayWithinDistance')
AddEventHandler('tostKajdany2:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(5)
        
--     if IsControlJustPressed(0, Keys['G']) then
--         local inventory = ESX.GetPlayerData().inventory
--         local kajeCount = 0
--             for i=1, #inventory, 1 do
--                 if inventory[i].name == 'kaje' then
--                 kajeCount = inventory[i].count
--                 end
--             end
--             if kajeCount > 0 then
--             --
--             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()            
--             if closestPlayer == -1 or closestDistance > 6.0 then
-- 			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
-- 			print "test"
--             else
--                 if IsPedStill(GetPlayerPed(-1)) then
--                 TriggerServerEvent("tostKajdany:handcuff", GetPlayerServerId(closestPlayer))
--                 TriggerServerEvent('tostKajdany:PlayWithinDistance', 1.5, 'cuff', 1.0)
-- 				RequestAnimDict('mp_arrest_paired')
-- 				print "test2"
--                 while not HasAnimDictLoaded('mp_arrest_paired') do
--                 Citizen.Wait(10)
--                 end
--                 --
--                 AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
--                 TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
--                 Citizen.Wait(3000)
--                 ClearPedTasks(GetPlayerPed(-1))
--                 DetachEntity(GetPlayerPed(-1))
--                 else
-- 				--sendNotification('Nie możesz zakuć podczas poruszania się.', 'warning', 5000)
--                 end
--             end
--             --
--             else
-- 			--sendNotification('Nie masz kajdanek.', 'error', 5000)
--             end
--     end
-- end
-- end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        
    if IsControlJustPressed(0, Keys['L']) then
        local inventory = ESX.GetPlayerData().inventory
        local kajeCount = 0
            for i=1, #inventory, 1 do
                if inventory[i].name == 'kaje' then
                kajeCount = inventory[i].count
                end
            end
            if kajeCount > 0 then
            --
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()            
            if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
			print "test"
            else
                if IsPedStill(GetPlayerPed(-1)) then
                TriggerServerEvent("tostKajdany:handcuff", GetPlayerServerId(closestPlayer))
                TriggerServerEvent('tostKajdany:PlayWithinDistance', 1.5, 'cuff', 1.0)
				RequestAnimDict('mp_arrest_paired')
				print "test2"
                while not HasAnimDictLoaded('mp_arrest_paired') do
                Citizen.Wait(10)
                end
                --
                --AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
                --TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
                Citizen.Wait(3000)
                ClearPedTasks(GetPlayerPed(-1))
                DetachEntity(GetPlayerPed(-1))
                else
				--sendNotification('Nie możesz zakuć podczas poruszania się.', 'warning', 5000)
                end
            end
            --
            else
			--sendNotification('Nie masz kajdanek.', 'error', 5000)
            end
    end
end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        
    if IsControlJustPressed(0, Keys['H']) then
        local inventory = ESX.GetPlayerData().inventory
        local kajeCount = 0
            for i=1, #inventory, 1 do
                if inventory[i].name == 'kaje' then
                kajeCount = inventory[i].count
                end
            end
            if kajeCount > 0 then
            --
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()            
            if closestPlayer == -1 or closestDistance > 6.0 then
			--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
            else
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
				if closestPlayer == -1 or closestDistance > 6.0 then
				--sendNotification('Nie ma nikogo w pobliżu.', 'error', 5000)
				else
				TriggerServerEvent("tostKajdany:drag", GetPlayerServerId(closestPlayer))
				Citizen.Wait(500)
				end
            end
            --
            else
			--sendNotification('Nie masz kajdanek.', 'error', 5000)
            end
    end
end
end)

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end