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
			if(GetDistanceBetweenCoords(coords, 66.811920166016,853.18408203125,12.835845947266, true) < 3.0) or (GetDistanceBetweenCoords(coords, 629.93334960938,2194.0166015625,16.12126159668, true) < 3.0) then
				if ESX.GetPlayerData().job.name ~= 'everyone' then
					DrawMarker(0, 629.93334960938,2194.0166015625,16.12126159668, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
					DrawMarker(0, 66.811920166016,853.18408203125,12.835845947266, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(15)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
if (GetDistanceBetweenCoords(coords, 629.93334960938,2194.0166015625,16.12126159668, true) < 2.0) then
	ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~r~odebrać paczkę ze środkami chemicznymi.')
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil
      		local zaplata = 0
					if ESX.GetPlayerData().job.name ~= 'everyone' then
								if IsControlJustReleased(0, Keys['E']) then
									if wtrakcie == false then
                                      zbieranie()
									end
								end
						end
					elseif (GetDistanceBetweenCoords(coords, 66.811920166016,853.18408203125,12.835845947266, true) < 2.0) then
						ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~r~przerobić metyloaminę na metamfetaminę.')
						if IsControlJustReleased(0, Keys['E']) then
							if wtrakcie == false then
						metasoki()-- od getdistance
							end
						end
				end
		end -- od while
end)

function zbieranie()
TriggerServerEvent('narcrpcraft:meta')
wtrakcie = true
end
function metasoki()
TriggerServerEvent('narcrpjablka:metasoki')
wtrakcie = true
end


RegisterNetEvent('narcrp:metazamroz')
AddEventHandler('narcrp:metazamroz', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('narcrp:metaodmroz')
AddEventHandler('narcrp:metaodmroz', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())
	TriggerEvent('skinchanger:getSkin', function(skin)
	


		local clothesSkin = {
		['bags_1'] = 41, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)

Citizen.Wait(1000)
	wtrakcie = false


end)


RegisterNetEvent('narcrp:metacraftanimacja')
AddEventHandler('narcrp:metacraftanimacja', function()
	local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_a'
ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
Citizen.Wait(60000)
end)
RegisterNetEvent('narcrp:metastopanimacja2sss')
AddEventHandler('narcrp:metastopanimacja2sss', function()

end)
RegisterNetEvent('animacjametasoki')
AddEventHandler('animacjametasoki', function()
	local pid = PlayerPedId()
	ESX.Streaming.RequestAnimDict("amb@prop_human_bum_bin@idle_b", function()

	TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
	end)
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

RegisterNetEvent('podlacz:propa')
AddEventHandler('podlacz:propa', function()
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.355, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
end)
RegisterNetEvent('sprzedawanie:metaanim')
AddEventHandler('sprzedawanie:metaanim', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)
function metaskup()

	TriggerServerEvent('narcrpcraft:metaskup')
	ClearPedSecondaryTask(PlayerPedId())
	TriggerEvent('skinchanger:getSkin', function(skin)

Citizen.Wait(3500)
		local clothesSkin = {
		['bags_1'] = 0, ['bags_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
	Citizen.Wait(13000)
	FreezeEntityPosition(PlayerPedId(), false)
	DetachEntity(bagspawned, 1, 1)
	DeleteObject(bagspawned)
	ClearPedSecondaryTask(PlayerPedId())
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

local UI = { 

	x =  0.000 ,	-- Base Screen Coords 	+ 	 x
	y = -0.001 ,	-- Base Screen Coords 	+ 	-y

}
RegisterNetEvent('narcrp:metatekst')
AddEventHandler('narcrp:metatekst', function()
while true do
	Citizen.Wait(1)
	if wtrakcie == true then
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
RegisterNetEvent('narcrp:zdejmijznaczeksss')
AddEventHandler('narcrp:zdejmijznaczeksss', function()
wtrakcie = false
end)
RegisterNetEvent('metatekst')
AddEventHandler('metatekst', function()
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

