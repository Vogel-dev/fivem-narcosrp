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
ESX = nil
local ustaw = false
local wylacz = false
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)
--
RegisterNetEvent('freezeplayer1')
AddEventHandler('freezeplayer1', function(freeze)
	FreezeEntityPosition(PlayerPedId(), freeze)
end)
RegisterNetEvent('freezeplayer12')
AddEventHandler('freezeplayer12', function()
	wylacz = true
	FreezeEntityPosition(PlayerPedId(), true)
end)
RegisterNetEvent('freezeplayer13')
AddEventHandler('freezeplayer13', function()
	wylacz = false
	FreezeEntityPosition(PlayerPedId(), false)
end)
--
RegisterNetEvent('start1')
AddEventHandler('start1', function()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local procent = 0
		local ziemniak = 1 + math.random(0,1)
		local player = PlayerPedId()
		local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_a'
		ustaw = true
		ClearPedTasks(ped)
		TriggerEvent('pogressBar:drawBar', 7000, 'Trwa odbieranie kartonu papierosów...')
		TriggerEvent('freezeplayer1', true)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
		end)
		while procent <= 500 do
			Wait(0)
			procent = procent + 1
		end
		TriggerEvent('freezeplayer1', false)
		TriggerServerEvent('wezpapierosy', ziemniak)
		ClearPedTasks(ped)
		ustaw = false
 end)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
				if(GetDistanceBetweenCoords(coords, -735.69085693359,1315.7252197266,5.1072726249695-1, true) < 1.5) and ustaw == false then
					ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~o~odebrać karton papierosów') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) then
						TriggerEvent('start1')
					end
				elseif(GetDistanceBetweenCoords(coords, -737.07958984375,1313.1600341797,5.1072745323181-1, true) < 1.5) and ustaw == false then
						ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~o~odebrać karton papierosów') -- Polskie znaki
						if IsControlJustReleased(0, Keys['E']) then
							TriggerEvent('start1')
						end
					end
	end
end)

function DrawText3DTest(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
			SetTextScale(0.4, 0.4)
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.35)
			SetTextColour(255, 255, 255, 255)
			SetTextDropshadow(0, 0, 0, 0, 55)
			SetTextEdge(2, 0, 0, 0, 150)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			SetTextCentre(1)
			AddTextComponentString(text)
			DrawText(_x,_y)
	end
end
--
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-750.416015625,1323.2531738281,4.2935914993286)
	SetBlipSprite (blip, 431)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipColour (blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Odbiór papierosów')
	EndTextCommandSetBlipName(blip)
end)
--
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(929.14172363281,1952.2971191406,14.758067131042-1)
	SetBlipSprite (blip, 431)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, 2)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Magazyn papierosów')
	EndTextCommandSetBlipName(blip)
end)
--
RegisterNetEvent('sprzedajumyte')
AddEventHandler('sprzedajumyte', function()
	ClearPedTasks(PlayerPedId())
	TriggerEvent('freezeplayer', true)
	DoScreenFadeOut(800)
	Citizen.Wait(1000)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
	TriggerServerEvent('sprzedajumyte', source)
	TriggerEvent('freezeplayer', false)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			DrawMarker(0, -735.69085693359,1315.7252197266,5.1072726249695, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(0, -737.07958984375,1313.1600341797,5.1072745323181, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(0, 946.21374511719,1948.9655761719,14.84769821167, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(coords, 946.21374511719,1948.9655761719,14.84769821167, true) < 1.5 then
					ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby sprzedać ~o~papierosy') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) and wylacz == false then
						TriggerServerEvent('sprzedajpapierosy', source)
					end
				end
  end
end)