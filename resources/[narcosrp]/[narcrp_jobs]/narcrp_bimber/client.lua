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
RegisterNetEvent('freeze_player_bimber1')
AddEventHandler('freeze_player_bimber1', function(freeze)
	FreezeEntityPosition(PlayerPedId(), freeze)
end)
RegisterNetEvent('freeze_player_bimber12')
AddEventHandler('freeze_player_bimber12', function()
	wylacz = true
	FreezeEntityPosition(PlayerPedId(), true)
end)
RegisterNetEvent('freeze_player_bimber13')
AddEventHandler('freeze_player_bimber13', function()
	wylacz = false
	FreezeEntityPosition(PlayerPedId(), false)
end)
--
RegisterNetEvent('start_bimber1')
AddEventHandler('start_bimber1', function()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local procent = 0
		local ziemniak = 1 + math.random(0,1)
		local player = PlayerPedId()
		local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_a'
		ustaw = true
		ClearPedTasks(ped)
		TriggerEvent('pogressBar:drawBar', 7000, 'Trwa odbieranie butelek bimbru...')
		TriggerEvent('freeze_player_bimber1', true)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
		end)
		while procent <= 500 do
			Wait(0)
			procent = procent + 1
		end
		TriggerEvent('freeze_player_bimber1', false)
		TriggerServerEvent('wez_bimber', ziemniak)
		ClearPedTasks(ped)
		ustaw = false
 end)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
				if(GetDistanceBetweenCoords(coords, 1011.5393066406,937.59716796875,11.743813514709-1, true) < 1.5) and ustaw == false then
					ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~o~odebrać butelkę bimbru') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) then
						TriggerEvent('start_bimber1')
					end
				elseif(GetDistanceBetweenCoords(coords, 1015.1167602539,936.66149902344,11.743786811829-1, true) < 1.5) and ustaw == false then
						ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby ~o~odebrać butelkę bimbru') -- Polskie znaki
						if IsControlJustReleased(0, Keys['E']) then
							TriggerEvent('start_bimber1')
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
	local blip = AddBlipForCoord(1010.5342407227,930.68243408203,11.55288028717-1)
	SetBlipSprite (blip, 431)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipColour (blip, 31)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Odbiór bimbru')
	EndTextCommandSetBlipName(blip)
end)
--
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(-1477.4729003906,840.99261474609,26.341625213623-1)
	SetBlipSprite (blip, 431)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, 2)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Dostawa bimbru')
	EndTextCommandSetBlipName(blip)
end)
--
RegisterNetEvent('sprzedaj_bimber')
AddEventHandler('sprzedaj_bimber', function()
	ClearPedTasks(PlayerPedId())
	TriggerEvent('freeze_player_bimber', true)
	DoScreenFadeOut(800)
	Citizen.Wait(1000)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
	TriggerServerEvent('sprzedaj_bimber', source)
	TriggerEvent('freeze_player_bimber', false)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			DrawMarker(0, 1011.5393066406,937.59716796875,11.743813514709, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(0, 1015.1167602539,936.66149902344,11.743786811829, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(0, -1477.5085449219,840.78851318359,26.341625213623, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 100, 100, 150, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(coords, -1477.5085449219,840.78851318359,26.341625213623, true) < 1.5 then
					ESX.ShowHelpNotification('Wciśnij ~INPUT_CONTEXT~ aby sprzedać ~o~butelki bimbru') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) and wylacz == false then
						TriggerServerEvent('sprzedaj_bimber', source)
					end
				end
  end
end)