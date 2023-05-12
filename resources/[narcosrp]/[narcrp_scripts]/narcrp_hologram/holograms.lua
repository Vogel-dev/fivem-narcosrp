Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)
		if GetDistanceBetweenCoords(1210.0244140625,-117.36671447754,14.226522445679-1, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
			Draw3DText(1210.0244140625,-117.36671447754,14.226522445679-1, "~g~Fernando Wilson\n**mówi** ~c~Najlepsze ceny tylko u mnie!", 4, 0.05, 0.05) --maski #1
		end
		if GetDistanceBetweenCoords(-75.615547180176,643.54699707031,14.757212638855-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(-75.615547180176,643.54699707031,14.757212638855-1, "~g~Victoria Boone\n**mówi** ~c~Kupujesz czy tylko oglądasz?", 4, 0.05, 0.05) -- maski #2
		end
		if GetDistanceBetweenCoords(-1249.3972167969,1615.0825195313,23.055116653442-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(-1249.3972167969,1615.0825195313,23.055116653442-1, "~g~Rolando Moody\n**mówi** ~c~Kolejny złom...", 4, 0.05, 0.05) -- jersey customs
		end
		if GetDistanceBetweenCoords(1267.1573486328,1014.374206543,24.470176696777-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(1267.1573486328,1014.374206543,24.470176696777-1, "~y~Jorge Wilkins\n**mówi** ~c~Przebieraj się i zapierdalaj!", 4, 0.05, 0.05) -- zlomowisko
		end
		if GetDistanceBetweenCoords(694.24029541016,2225.1596679688,15.804805755615-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(694.24029541016,2225.1596679688,15.804805755615-1, "~g~Melissa Steele\n**mówi** ~c~Masz na wóde królewiczu?", 4, 0.05, 0.05) -- bronx_garaz
		end
		if GetDistanceBetweenCoords(82.228721618652,71.809387207031,14.751227378845-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(82.228721618652,71.809387207031,14.751227378845-1, "~g~Joey Scott\n**mówi** ~c~Szukasz roboty?", 4, 0.05, 0.05) -- manhattan_posrednik
		end
		if GetDistanceBetweenCoords(1275.4588623047,2357.7976074219,12.881420135498-1, GetEntityCoords(GetPlayerPed(-1))) < 18.0 then
			Draw3DText(1275.4588623047,2357.7976074219,12.881420135498-1, "~g~Gordon Norris\n**mówi** ~c~Szukasz jakiejś fuchy kolo?", 4, 0.05, 0.05) -- zlomowisko
		end
	end
end
-- maski #1
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("a_m_y_beach_01"))
    while not HasModelLoaded(GetHashKey("a_m_y_beach_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("a_m_y_beach_01"), 1210.0244140625,-117.36671447754,14.226522445679-1, 95.23, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)
-- maski #2
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("csb_abigail"))
    while not HasModelLoaded(GetHashKey("csb_abigail")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("csb_abigail"), -75.615547180176,643.54699707031,14.757212638855-1, 179.23, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)
-- jersey customs
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("s_m_y_armymech_01"))
    while not HasModelLoaded(GetHashKey("s_m_y_armymech_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("s_m_y_armymech_01"), -1249.3972167969,1615.0825195313,23.055116653442-1, 306.23, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)
-- bronx_parking
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("u_f_o_prolhost_01"))
    while not HasModelLoaded(GetHashKey("u_f_o_prolhost_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("u_f_o_prolhost_01"), 694.24029541016,2225.1596679688,15.804805755615-1, 140.23, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)
-- manhattan_posrednik
Citizen.CreateThread(function()
	
    RequestModel(GetHashKey("cs_paper"))
    while not HasModelLoaded(GetHashKey("cs_paper")) do
		Wait(155)
    end
	
	local ped =  CreatePed(4, GetHashKey("cs_paper"), 82.228721618652,71.809387207031,14.751227378845-1, 140.23, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
end)
-- bronx_posrednik
Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("g_m_y_salvaboss_01"))
    while not HasModelLoaded(GetHashKey("g_m_y_salvaboss_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("g_m_y_salvaboss_01"), 1275.4588623047,2357.7976074219,12.881420135498-1, 235.23, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(200, 200, 200, 255)		-- You can change the text color here
         SetTextDropshadow(31, 31, 31, 0.5, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end
