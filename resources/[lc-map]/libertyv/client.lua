
plates = {
{"plate01","https://i.imgur.com/EwFuOJ5.png",370,188},
{"plate01_n","https://i.imgur.com/zPHE0X7.png",370,189},
{"plate02","https://i.imgur.com/nRjfQW6.png",368,189},
{"plate02_n","https://i.imgur.com/zC7LZ9q.png",300,160},
{"plate03","https://i.imgur.com/7LBC1NF.png",500,262},
{"plate03_n","https://i.imgur.com/jm3fgzs.png",300,160},
{"plate04_n","https://i.imgur.com/2BVHApg.png",300,154},
{"plate04","https://i.imgur.com/HCM9D5h.png",370,188},
{"plate05","https://i.imgur.com/lzCWWQq.png",370,187},
{"plate05_n","https://i.imgur.com/WS7DdbZ.png",370,187},
{"yankton_plate","https://i.imgur.com/AaYnMK9.png",734,361},
{"yankton_plate_n","https://i.imgur.com/FNb3UP8.png",256,128},
}

for l, p in pairs(plates) do
    local txd = CreateRuntimeTxd("testing")
    local duiObj = CreateDui(p[2], p[3], p[4])
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, "test", dui)
    AddReplaceTexture("vehshare", p[1], "testing", "test")
end


Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)



local x,y,z = 1198.015, 420.312, 231.624

Citizen.CreateThread(function()


function LoadTrainModels() -- f*ck your rails, too!
			tempmodel = GetHashKey("freight")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcar")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightgrain")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcont1")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freightcont2")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("freighttrailer")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end

			tempmodel = GetHashKey("tankercar")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("metrotrain")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
			tempmodel = GetHashKey("s_m_m_lsmetro_01")
			RequestModel(tempmodel)
			while not HasModelLoaded(tempmodel) do
				RequestModel(tempmodel)
				Citizen.Wait(0)
			end
			
		
	end		
end)

Citizen.CreateThread(function()
print("HEeee")

  SwitchTrainTrack(13, true)
  SwitchTrainTrack(14, true)
  SwitchTrainTrack(15, true)
  SwitchTrainTrack(16, true)  
  SwitchTrainTrack(17, true)    

  SetTrainTrackSpawnFrequency(13, 12000)
  SetTrainTrackSpawnFrequency(14, 12000)
  SetTrainTrackSpawnFrequency(15, 12000)
  SetTrainTrackSpawnFrequency(16, 12000)  
  SetTrainTrackSpawnFrequency(17, 12000)    
  SetRandomTrains(1)
  SetRandomBoats(1)
  
end)

local renderDistance = 500
Citizen.CreateThread(function()
	--if true then return end
	ShutdownLoadingScreenNui()

	while true do
		Citizen.Wait(3000)

		local ped = PlayerPedId()
		local plyPos = GetEntityCoords(ped)

		for k,v in pairs(eastYmap) do
			local min, max = v.extends[1], v.extends[2]
			local dist1, dist2 = GetDistanceBetweenCoords(plyPos, min), GetDistanceBetweenCoords(plyPos, max)
			local shouldDraw, IPLActive = plyPos.z > 150 or dist1 < renderDistance or dist2 < renderDistance or (plyPos.x > min.x and plyPos.x < max.x and plyPos.y > min.y and plyPos.y < max.y), IsIplActive(v.name)
			--shouldDraw = true
			if shouldDraw and not IPLActive then
				--Citizen.Trace("Added: " .. v.name .. "\n")
				RequestIpl(v.name)
				--Wait(100)
			elseif not shouldDraw and IPLActive then
				--Citizen.Trace("Removed: " .. v.name .. "\n")
				RemoveIpl(v.name)
			end
		end
	end
end)

RegisterCommand("render", function(src, args)
	local distance = tonumber(args[1])
	if not distance then return end

	renderDistance = distance <= 0 and 99999 or distance
	TriggerEvent('chat:addMessage', {
        template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(35, 35, 35, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;"<i class="fas fa-low-vision"></i>^3^*  Zasięg renderowania został ustawiony na: '..renderDistance..'.^7 </div>',
        args = { }
    })
end)

CreateThread(function()
	-- TODO use new disquse's natives
	while true do
		Wait(0)

		local ped = PlayerPedId()
		SetRadarZoom(IsPedInAnyVehicle(ped) and 1200 or 900)
	end
end)



