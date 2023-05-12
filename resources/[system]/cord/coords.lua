function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.4)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(0)
		x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		
    	roundx = tonumber(string.format("%.2f", x))
    	roundy = tonumber(string.format("%.2f", y))
		roundz = tonumber(string.format("%.2f", z))
		
		DrawTxt("~r~X:~s~ "..roundx, 0.62, 0.95)
		DrawTxt("~r~Y:~s~ "..roundy, 0.68, 0.95)
		DrawTxt("~r~Z:~s~ "..roundz, 0.745, 0.95)

		heading = GetEntityHeading(GetPlayerPed(-1))
		roundh = tonumber(string.format("%.2f", heading))
		DrawTxt("~p~H:~s~ "..roundh, 0.80, 0.95)

        local rx,ry,rz = table.unpack(GetEntityRotation(PlayerPedId(), 1))
		--DrawTxt("~p~RX:~s~ "..tonumber(string.format("%.2f", rx)), 0.38, 0.03)
		--DrawTxt("~p~RY:~s~ "..tonumber(string.format("%.2f", ry)), 0.44, 0.03)
		--DrawTxt("~p~RZ:~s~ "..tonumber(string.format("%.2f", rz)), 0.495, 0.03)
	
		speed = GetEntitySpeed(PlayerPedId())
		rounds = tonumber(string.format("%.2f", speed))
		--DrawTxt("~p~Player Speed: ~s~"..rounds, 0.40, 0.92)

		health = GetEntityHealth(PlayerPedId())
		--DrawTxt("~p~Player Health: ~s~"..health, 0.40, 0.95)

		veheng = GetVehicleEngineHealth(GetVehiclePedIsUsing(PlayerPedId()))
		vehbody = GetVehicleBodyHealth(GetVehiclePedIsUsing(PlayerPedId()))
		if IsPedInAnyVehicle(PlayerPedId(), 1) then
			vehenground = tonumber(string.format("%.2f", veheng))
			vehbodround = tonumber(string.format("%.2f", vehbody))

			--DrawTxt("~p~Engine Health: ~s~"..vehenground, 0.015, 0.76)

			--DrawTxt("~p~Body Health: ~s~"..vehbodround, 0.015, 0.73)

			--DrawTxt("~p~Vehicle Fuel: ~s~"..tonumber(string.format("%.2f", GetVehicleFuelLevel(GetVehiclePedIsUsing(PlayerPedId())))), 0.015, 0.70)
		end
    end
end)
