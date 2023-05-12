local showPlayerBlips = false
local ignorePlayerNameDistance = true
local playerNamesDist = 15
local displayIDHeight = 3.5 --Height of ID above players head(starts at center body mass)
--Set Default Values for Colors
local red = 255
local green = 155
local blue = 55
local group
local ShowIDs = true


RegisterNetEvent('setadmin')
AddEventHandler('setadmin', function()
	group = true
end)	


RegisterNetEvent('showid')
AddEventHandler('showid', function(id)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    ShowIDs = true
  end
end)

RegisterNetEvent('dontshowid')
AddEventHandler('dontshowid', function(id)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    ShowIDs = false
  end
end)

function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(1*scale, 2*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end


Citizen.CreateThread(function()
	while true do
		-- Wait 5 seconds after player has loaded in and trigger the event.
		Citizen.Wait( 5000 )

		if NetworkIsSessionStarted() then
			TriggerServerEvent( "checkadmin")
		end
	end
end )


Citizen.CreateThread(function ()
    while true do
        for i=0,99 do
            N_0x31698aa80e0223f8(i)
        end
        for id = 0, 31 do
            if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
                ped = GetPlayerPed( id )
                blip = GetBlipFromEntity( ped ) 
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))

                if(ignorePlayerNameDistance) then
					if group == true and ShowIDs == true then 
						red = 255
						green = 155
						blue = 0
						DrawText3D(x2, y2, z2 + displayIDHeight, "( " .. GetPlayerServerId(id) .. " )( " .. GetPlayerName(id) .. " )")
					end						
	                    
                end

                if ((distance < playerNamesDist)) then
                    if not (ignorePlayerNameDistance) then
						if group == true and ShowIDs == true then 
							red = 255
							green = 155
							blue = 0
							DrawText3D(x2, y2, z2 + displayIDHeight, "( " .. GetPlayerServerId(id) .. " )( " .. GetPlayerName(id)  .. " )")
					    end					
                    end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)
