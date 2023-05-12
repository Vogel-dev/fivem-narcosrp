local vehWeapons = {
	0x1D073A89, -- ShotGun
	0x83BF0278, -- Carbine
	0x5FC3C11, -- Sniper
	0x13532244, -- MicroSMG
	0x2BE6766B, -- SMG
	0xEFE7E2DF, -- asmg
	0xCC7CCD1B, -- smgcar
	0xB86AEE5B, -- msmgcar
	0x116FC4E6, -- smgammo
	0x77F3F2DD, -- ammoshotgun
	0xA9355DCD, -- pickuppumpgun
	0x96B412A3, -- sawnoffshotgun
	0x9299C95B, -- assaultshotgun
}


local hasBeenInPoliceVehicle = false

local alreadyHaveWeapon = {}

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not hasBeenInPoliceVehicle) then
				hasBeenInPoliceVehicle = true
			end
		else
			if(hasBeenInPoliceVehicle) then
				for i,k in pairs(vehWeapons) do
					if(not alreadyHaveWeapon[i]) then
						TriggerServerEvent("PoliceVehicleWeaponDeleter:askDropWeapon",k)
					end
				end
				hasBeenInPoliceVehicle = false
			end
		end

	end

end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#vehWeapons do
				if(HasPedGotWeapon(GetPlayerPed(-1), vehWeapons[i], false)==1) then
					alreadyHaveWeapon[i] = true
				else
					alreadyHaveWeapon[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)


RegisterNetEvent("PoliceVehicleWeaponDeleter:drop")
AddEventHandler("PoliceVehicleWeaponDeleter:drop", function(wea)
	RemoveWeaponFromPed(GetPlayerPed(-1), wea)
end)

-- Anulowanie przyjazdu pojazdów lokalnych medyków, straży pożarnej, policji

Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerLoc = GetEntityCoords(GetPlayerPed(-1))

		ClearAreaOfCops(playerLoc.x, playerLoc.y, playerLoc.z, 200.0)
		
		Citizen.Wait(300)
	end
end)

local blips = {
	{title="Departament Sprawiedliwości", colour=15, id=181, x = -284.06988525391, y = 1515.1153564453, z = 9.7010078430176-1},
	{title="Super Star Cafe", colour=60, id=304, x = 2.9787051677704, y = 542.79333496094, z = 15.700168609619-1},
	{title="Super Star Cafe", colour=60, id=304, x = 256.572265625, y = 1473.8802490234, z = 15.64101600647-1},
	{title="Narcos News", colour=18, id=459, x = 1520.4460449219, y = 1094.6014404297, z = 38.996105194092-1},
	{title="Mr. Fuk's Rice Box", colour=1, id=93, x = -1001.7506713867, y = 1567.8957519531, z = 19.780363082886-1},
	{title="69th Street Diner", scale=1.0, colour=11, id=93, x = 1121.1254882813, y = 8.4244890213013, z = 15.882800102234-1},
	{title="Comrades Bar", scale=1.0, colour=17, id=93, x = 1175.2071533203, y = 1.488067984581, z = 15.484642028809-1},
	{title="Honkers", scale=1.0, colour=8, id=121, x = -1343.1973876953, y = 520.6552734375, z = 10.026762008667-1},
	{title="The Triangle Club", scale=1.0, colour=8, id=121, x = 1441.7473144531, y = 2202.6691894531, z = 16.663385391235-1},
	{title="Bahama Mamas", scale=1.0, colour=75, id=279, x = -160.47520446777, y = 885.34375, z = 13.965964317322-1},
}      
Citizen.CreateThread(function()

   for _, info in pairs(blips) do
	 info.blip = AddBlipForCoord(info.x, info.y, info.z)
	 SetBlipSprite(info.blip, info.id)
	 SetBlipDisplay(info.blip, 4)
	 SetBlipScale(info.blip, 1.0)
	 SetBlipColour(info.blip, info.colour)
	 SetBlipAsShortRange(info.blip, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString(info.title)
	 EndTextCommandSetBlipName(info.blip)
   end

end)

