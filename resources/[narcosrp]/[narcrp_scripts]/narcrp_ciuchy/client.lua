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


ESX                           = nil
local PlayerData                = {}
local wear = true
local component = 0
local type = 0
local firstjoin = true
local clothe = 0
local maska = true
local ubieranie = false
local second = false

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)





function menu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'clothes',
	{
		title    = 'Menu',
		align    = 'bottom-right',
		elements = {
			{label = 'Maski',		value = 'mask'},
			{label = 'Szalik',		value = 'chain'},
			{label = 'Torba',		value = 'bag'},
			{label = 'Koszulka i Kurtka',	value = 'coat'},
			{label = 'Koszulka',	value = 'tshirt'},
			{label = 'Spodnie',	value = 'legs'},
			{label = 'Buty',		value = 'shoes'},


		}
	}, function(data, menu)

--thirst15
--legs14 1
--torso 15
--arms15
--shoes34
		local dict = "clothingtrousers"
		local dict1 = "clothingshirt"
		local dict2 = "clothingshoes"
		local dict3 = "clothingtie"
		local dict4 = "mp_masks@on_foot"
                local dict5 = "missfbi4"
                local dict6 = "amb@medic@standing@kneel@base"
    
    RequestAnimDict(dict)
    RequestAnimDict(dict1)
    RequestAnimDict(dict2)
    RequestAnimDict(dict3)
    RequestAnimDict(dict4)
    RequestAnimDict(dict5)
    RequestAnimDict(dict6)

    while not HasAnimDictLoaded(dict) and HasAnimDictLoaded(dict1) and HasAnimDictLoaded(dict2) and HasAnimDictLoaded(dict3) and HasAnimDictLoaded(dict4)  do
        Citizen.Wait(100)
    end
		               
					local action = data.current.value

					if action == 'chain' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict3, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
					
if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 7) then
TriggerServerEvent('esx_ciuchy:szalik')
else
SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2)

end
--TriggerEvent('esx_ciuchy:ubierz')

elseif action == 'mask' then
if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 1) then
					TaskPlayAnim(GetPlayerPed(-1), dict4, "put_on_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1000)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
TriggerServerEvent('esx_ciuchy:maska')
else
					TaskPlayAnim(GetPlayerPed(-1), dict5, "takeoff_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1000)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)

end

												
					elseif action == 'bag' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
                                   if 0 == GetPedDrawableVariation(GetPlayerPed(-1), 5) then
TriggerServerEvent('esx_ciuchy:torba')
else
SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 2)

end



					elseif action == 'coat' and not ubieranie then

					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_c", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

    if 15 == GetPedDrawableVariation(GetPlayerPed(-1), 11) then
TriggerServerEvent('esx_ciuchy:kurtka')
else

SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 2)
end


					
					
					elseif action == 'tshirt' and not ubieranie then

					TaskPlayAnim(GetPlayerPed(-1), dict1, "check_out_c", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

    if 15 == GetPedDrawableVariation(GetPlayerPed(-1), 8) then
TriggerServerEvent('esx_ciuchy:koszulka')
else


SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)
SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 2)
end


					
					elseif action == 'legs' and not ubieranie then
TaskPlayAnim(GetPlayerPed(-1), dict2, "try_shoes_positive_a", 8.0, 8.0, -1, 50, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))

	TriggerEvent('skinchanger:getSkin', function(skin)
	if 14 == GetPedDrawableVariation(GetPlayerPed(-1), 4) and skin.sex == 0 or  17 == GetPedDrawableVariation(GetPlayerPed(-1), 4) and skin.sex == 1 then

TriggerServerEvent('esx_ciuchy:spodnie')
else

		if skin.sex == 0 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 14, 0, 2)
else
		SetPedComponentVariation(GetPlayerPed(-1), 4, 17, 1, 2)
end
end
end)




					elseif action == 'shoes' and not ubieranie then
					TaskPlayAnim(GetPlayerPed(-1), dict6, "base", 8.0, 8.0, -1, 11, 0, false, false, false)
ubieranie = true
					Wait(1400)
ubieranie = false
				ClearPedTasks(GetPlayerPed(-1))
	TriggerEvent('skinchanger:getSkin', function(skin)
		 if 34 == GetPedDrawableVariation(GetPlayerPed(-1), 6) and skin.sex == 0 or  35 == GetPedDrawableVariation(GetPlayerPed(-1), 6) and skin.sex == 1 then

TriggerServerEvent('esx_ciuchy:buty')
else
if skin.sex == 0 then
SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 2)
else
SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2)
end
end
end)



					end





	

	end, function(data, menu)
		menu.close()
	end)
end




RegisterNetEvent('esx_ciuchy:wear')
AddEventHandler('esx_ciuchy:wear', function()

mask= GetPedDrawableVariation(GetPlayerPed(-1), 1)
mask1 = GetPedTextureVariation(GetPlayerPed(-1), 1)
bag = GetPedDrawableVariation(GetPlayerPed(-1), 5)
bag1 = GetPedTextureVariation(GetPlayerPed(-1), 5)
tshirt = GetPedDrawableVariation(GetPlayerPed(-1), 8)
tshirt2 = GetPedTextureVariation(GetPlayerPed(-1), 8)
torso = GetPedDrawableVariation(GetPlayerPed(-1), 11)
torso2 = GetPedTextureVariation(GetPlayerPed(-1), 11)
legs = GetPedDrawableVariation(GetPlayerPed(-1), 4)
legs1 = GetPedTextureVariation(GetPlayerPed(-1), 4)
boots = GetPedDrawableVariation(GetPlayerPed(-1), 6)
boots1 = GetPedTextureVariation(GetPlayerPed(-1), 6)
arms = GetPedDrawableVariation(GetPlayerPed(-1), 3)
chain = GetPedDrawableVariation(GetPlayerPed(-1), 7)
chain1 = GetPedTextureVariation(GetPlayerPed(-1), 7)
mask= GetPedDrawableVariation(GetPlayerPed(-1), 1)
mask1 = GetPedTextureVariation(GetPlayerPed(-1), 1)
decals= GetPedDrawableVariation(GetPlayerPed(-1), 10)
decals1 = GetPedTextureVariation(GetPlayerPed(-1), 10)
    TriggerServerEvent('esx_ciuchy:dodaj', bag, bag1, tshirt, tshirt2, torso, torso2, legs, legs1, boots, boots1, arms, chain,chain1,mask,mask1,decals,decals1)

end)
RegisterNetEvent('esx_ciuchy:ubierz')
AddEventHandler('esx_ciuchy:ubierz', function(id1,id2, id3)
	local playerPed       = PlayerPedId()
SetPedComponentVariation(GetPlayerPed(-1), id3, id1, id2, 2)

end)
