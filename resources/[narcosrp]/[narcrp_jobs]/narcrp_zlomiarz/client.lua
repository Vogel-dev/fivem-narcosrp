local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local bagModel = "prop_apple_box_01"
local bagspawned = nil
local maitem = false
local tekst = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)

end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(5)
		local coords = GetEntityCoords(GetPlayerPed(-1))

			if(GetDistanceBetweenCoords(coords, 1296.1566162109,1000.6021728516,19.383897781372-1, true) < 10.0) or (GetDistanceBetweenCoords(coords, 1272.9125976563,999.01147460938,19.289035797119-1, true) < 10.0) or (GetDistanceBetweenCoords(coords, 1267.9986572266,992.03857421875,19.297012329102-1, true) < 10.0) then

					ESX.Game.Utils.DrawText3D({ x = 1296.1534423828, y = 1000.6008911133, z = 19.383752822876 }, '~y~[E] ~w~Zbieranie złomu', 1)		
					ESX.Game.Utils.DrawText3D({ x = 1272.9116210938, y = 999.01171875, z = 19.289035797119 }, '~y~[E] ~w~Zbieranie złomu', 1)	
					ESX.Game.Utils.DrawText3D({ x = 1268.0469970703, y = 992.14044189453, z = 19.296838760376 }, '~y~[E] ~w~Zbieranie złomu', 1)				

	end
	end
end)
function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end


Citizen.CreateThread(function()
	while true do

		Wait(15)
		local coords      = GetEntityCoords(GetPlayerPed(-1))


if (GetDistanceBetweenCoords(coords, 1296.1566162109,1000.6021728516,19.383897781372, true) < 4.0) or (GetDistanceBetweenCoords(coords, 1273.1262207031,999.05816650391,19.289026260376-1, true) < 4.0) or (GetDistanceBetweenCoords(coords, 1267.9986572266,992.03857421875,19.297012329102, true) < 4.0) then


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
      		local zaplata = 0


					if ESX.GetPlayerData().job.name == 'zlom' then
								if IsControlJustReleased(0, Keys['E']) then
									if wtrakcie == false and maitem == false then
                                      zbieranie()
									end
								end
						end
		end -- od getdistance
		end -- od while
end)

function zbieranie()
TriggerServerEvent('narcrpcraft:zlomiarzzbier')
wtrakcie = true
end



RegisterNetEvent('narcrp:zamrozcrft22')
AddEventHandler('narcrp:zamrozcrft22', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('narcrp:odmrozcrft22')
AddEventHandler('narcrp:odmrozcrft22', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())

	


maitem = true
Citizen.Wait(1000)
	wtrakcie = false
	TriggerEvent('podlacz:propa2')

end)


RegisterNetEvent('narcrp:craftanimacja22')
AddEventHandler('narcrp:craftanimacja22', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
Citizen.Wait(2000)
end)



function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("s_m_m_dockwork_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_dockwork_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("s_m_m_dockwork_01"), 1267.1573486328,1014.374206543,24.470176696777-1, 270.404, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)

Citizen.CreateThread(function()
	while true do

		Wait(5)
		local coords  = GetEntityCoords(GetPlayerPed(-1))


if(GetDistanceBetweenCoords(coords, 1267.6499023438,1018.4432983398,24.470161437988-1, true) < 20.0) or (GetDistanceBetweenCoords(coords, -1040.660, 5329.250, 43.370, true) < 5.0) then
	if ESX.GetPlayerData().job.name == 'zlom' then

	ESX.Game.Utils.DrawText3D({ x = 1267.5874023438, y = 1018.4560546875, z = 24.470182418823 }, '~y~[E] ~w~Szatnia', 1)	
			local coords      = GetEntityCoords(GetPlayerPed(-1))

                        local zaplata = 0

						if(GetDistanceBetweenCoords(coords, 1267.2729492188,1013.7166748047,24.470161437988-1, true) < 3.0) then
							ESX.ShowAdvancedNotification('Sprzedaż złomu', '', '~y~[E] ~w~Sprzedaj', 'CHAR_PROPERTY_CAR_SCRAP_YARD', 3)
								if IsControlJustReleased(0, Keys['E']) then
                            		  skup()
								end

							end
	

								
								if(GetDistanceBetweenCoords(coords, 1267.6499023438,1018.4432983398,24.470161437988-1, true) < 5.0) then
							
									if IsControlJustReleased(0, Keys['E']) then
										
									ubrania()
								end
	
								end	
						end
		end
		end

end)
function ubrania()

	TriggerEvent('skinchanger:getSkin', function(skin)
	
		if skin.tshirt_1 == 59 and skin.torso_1 == 56 then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
				
			else
				local clothesSkin = {
					['tshirt_1'] = 59, ['tshirt_2'] = 1,
					['torso_1'] = 56, ['torso_2'] = 0,
					['arms'] = 52, ['arms_2'] = 0,
					['pants_1'] = 9, ['pants_2'] = 1,
					['helmet_1'] = 85,  ['helmet_2'] = 0,
					['shoes_1'] = 9, ['shoes_2'] = 2
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				
		end
	end)
end
RegisterNetEvent('podlacz:propa2')
AddEventHandler('podlacz:propa2', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	local szn = math.random(1,3)
	if szn == 1 then
		bagModel = 'prop_car_door_01'
		bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)

	elseif szn == 2 then
		bagModel = 'prop_car_seat'
		bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, -045.0, 480.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)

	else	
		bagModel = 'prop_rub_bike_02'
		bagspawned = CreateObject(GetHashKey(bagModel), x, y, z,  true,  true, true)
		AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.125, -0.50, 0.355, -045.0, 410.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)

	end

end)
RegisterNetEvent('sprzedawanie:jablekanim2')
AddEventHandler('sprzedawanie:jablekanim2', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function skup()

	TriggerServerEvent('narcrpcraft:skup2')

Citizen.Wait(3500)
	Citizen.Wait(13000)
	FreezeEntityPosition(PlayerPedId(), false)

	wtrakcie = false
end
	
RegisterNetEvent('odlacz:propa')
AddEventHandler('odlacz:propa', function()
	DetachEntity(bagspawned, 1, 1)
	DeleteObject(bagspawned)
	maitem = false
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)

local blips = {
	{title="Złomowisko", colour=25, id=431, x = 1281.640625, y = 1016.3502807617, z = 24.470167160034-1},
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

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('narcrp:tekstjab2')
AddEventHandler('narcrp:tekstjab2', function()
while true do
	Citizen.Wait(1)
	if wtrakcie == true then

	-- drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)

end
end
end)
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
RegisterNetEvent('narcrp:zdejmijznaczek2')
AddEventHandler('narcrp:zdejmijznaczek2', function()
wtrakcie = false
end)
RegisterNetEvent('zacznijtekst2')
AddEventHandler('zacznijtekst2', function()
	Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1
Citizen.Wait(37)
tekst = tekst + 1

Citizen.Wait(1500)
tekst = 0
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

