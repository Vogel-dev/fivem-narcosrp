RegisterNetEvent('cyber_scoreboard:setscoreboard')
AddEventHandler('cyber_scoreboard:setscoreboard', function(players)
	SendNUIMessage({ text = table.concat(players) })
end)

local keyPressed = false

Citizen.CreateThread( function()
	while true do

		Citizen.Wait(100)
		
		while IsControlPressed(1, 20) and keyPressed do
			Citizen.Wait(100)
		end

		if IsControlPressed(1, 20) and not keyPressed then
			keyPressed = true
			Citizen.Trace('a')
			TriggerServerEvent('cyber_scoreboard:getplayers')
			if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
			end
			Citizen.Wait(100)
		  else if not IsControlPressed(1, 20) and keyPressed then
			keyPressed = false
			ClearPedTasks(GetPlayerPed(-1)) 
			SendNUIMessage({
                meta = 'close'
             })
		  end
		end
	end
end )

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		Citizen.Wait(1)
		local headIds = { }
		if IsControlPressed(0, 20) then
			for id = 0, 99, 1 do
				if NetworkIsPlayerActive( id ) then 
					local ped = GetPlayerPed( id )
					if ped ~= nil and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(ped)) < Config.drawDistance) and HasEntityClearLosToEntity(GetPlayerPed(-1),  ped,  17) then
						if GetPlayerServerId(id) ~= nil then
						 headIds[id] = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, tostring(GetPlayerServerId(id)), false, false, "", false )
						 N_0x63bb75abedc1f6a0(headIds[id], false, true)
						end
					end
				end
			end
			while IsControlPressed(0, 20) do
				Citizen.Wait(20)
			end
			
			for id = 0, 99, 1 do
				if NetworkIsPlayerActive( id ) then
					N_0x63bb75abedc1f6a0(headIds[id], false, false)
				end
			end
		end
	end
end) 

Citizen.CreateThread(function()
	while true do
	   Citizen.Wait(15)
	   if IsControlJustPressed(1, 20) and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
		end   
	end
end)

Citizen.CreateThread(function()
	while true do
	   Citizen.Wait(20)
	   if IsControlJustReleased(1, 20) then 
			ClearPedTasks(GetPlayerPed(-1)) 
		end
	end
end)

local keyPressed2 = false

Citizen.CreateThread( function()
	while true do

		Citizen.Wait(100)
		
		while IsControlPressed(1, 10) and keyPressed2 do
			Citizen.Wait(100)
		end

		if IsControlPressed(1, 10) and not keyPressed2 and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			keyPressed2 = true
			Citizen.Trace('a')
			TriggerServerEvent('cyber_scoreboard:getplayers')
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
			Citizen.Wait(100)
		  else if not IsControlPressed(1, 10) and keyPressed2 then
			keyPressed2 = false
			ClearPedTasks(GetPlayerPed(-1)) 
			SendNUIMessage({
                meta = 'close'
             })
		  end
		end
	end
end )

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		Citizen.Wait(1)
		local headIds = { }
		if IsControlPressed(0, 10) then
			for id = 0, 99, 1 do
				if NetworkIsPlayerActive( id ) then 
					local ped = GetPlayerPed( id )
					if ped ~= nil and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(ped)) < Config.drawDistance) and HasEntityClearLosToEntity(GetPlayerPed(-1),  ped,  17) then
						if GetPlayerServerId(id) ~= nil then
						 headIds[id] = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, tostring(GetPlayerServerId(id)), false, false, "", false )
						 N_0x63bb75abedc1f6a0(headIds[id], false, true)
						end
					end
				end
			end
			while IsControlPressed(0, 10) do
				Citizen.Wait(20)
			end
			
			for id = 0, 99, 1 do
				if NetworkIsPlayerActive( id ) then
					N_0x63bb75abedc1f6a0(headIds[id], false, false)
				end
			end
		end
	end
end) 

Citizen.CreateThread(function()
	while true do
	   Citizen.Wait(15)
	   if IsControlJustPressed(1, 10) and not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
		end   
	end
end)

Citizen.CreateThread(function()
	while true do
	   Citizen.Wait(20)
	   if IsControlJustReleased(1, 10) then 
			ClearPedTasks(GetPlayerPed(-1)) 
		end
	end
end)