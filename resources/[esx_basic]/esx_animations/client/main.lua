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
  
  local isDead = false
  local inAnim = false
  ESX = nil
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  end)
  
  RegisterNetEvent('esx_animations:play')
  AddEventHandler('esx_animations:play', function(anim)
  --	print(anim)
	  for i=1, #Config.Animations, 1 do
			for j=1, #Config.Animations[i].items, 1 do
			  
				if tostring(anim) == tostring(Config.Animations[i].items[j].data.e) then
				  local cat = not IsPedCuffed(GetPlayerPed(-1)) and Config.Animations[i].items[j].type
				  local cat2 = Config.Animations[i].items[j].type
				  if cat == "anim" then
					  startAnim(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop, Config.Animations[i].items[j].data.car)
					  break
				  elseif cat2 == "faceexpression" then
					  startFaceExpression(Config.Animations[i].items[j].data.anim)
					  break
				  elseif cat == "anim2" then
					  startAnim2(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animangle" then
					  startAnimAngle(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animangle2" then
					  startAnimAngle(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animangle3" then
					  startAnimAngle(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animrozmowa" then
					  startAnimRozmowa(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animtabletka" then
					  startAnimTabletka(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animschowek" then
					  startAnimSchowek(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animochroniarz" then
					  startAnimOchroniarz(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animockniecie" then
					  startAnimOckniecie(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop" then
					  startAnimProp(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop2" then
					  startAnimProp2(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop3" then
					  startAnimProp3(Config.Animations[i].items[j].data.lib)
					  break
				  elseif cat == "animprop5" then
					  startAnimProp5(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop6" then
					  startAnimProp6(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop8" then
					  startAnimProp8(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop10" then
					  startAnimProp10(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop11" then
					  startAnimProp11(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop12" then
					  startAnimProp12(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop15" then
					  startAnimProp15(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop17" then
					  startAnimProp17(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop18" then
					  startAnimProp18(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop19" then
					  startAnimProp19(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop20" then
					  startAnimProp20(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop21" then
					  startAnimProp21(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop22" then
					  startAnimProp22(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop23" then
					  startAnimProp23(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "animprop24" then
					  startAnimProp24(Config.Animations[i].items[j].data.lib, Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "scenario" then
					  startScenario(Config.Animations[i].items[j].data.anim, Config.Animations[i].items[j].data.loop)
					  break
				  elseif cat == "scenariosit" then
					  startScenario2(Config.Animations[i].items[j].data.anim)
					  break				
				  end
			  end
		  end
	  end
  end)
  
  AddEventHandler('esx:onPlayerDeath', function(data)
	  isDead = true
  end)
  
  RegisterNetEvent('esx_animations:playscenario')
  AddEventHandler('esx_animations:playscenario', function(anim, loop)
	  startScenario(anim, loop)
  end)
  
  RegisterNetEvent('esx_animations:playscenario2')
  AddEventHandler('esx_animations:playscenario2', function(anim)
	  startScenario2(anim)
  end)
  
  AddEventHandler('playerSpawned', function(spawn)
	  isDead = false
  end)
  
  function startWalkStyle(lib, anim)
	  ESX.Streaming.RequestAnimSet(lib, function()
		  SetPedMovementClipset(PlayerPedId(), anim, true)
	  end)
  end
  
  function startFaceExpression(anim)
		  SetFacialIdleAnimOverride(PlayerPedId(), anim)
  end
  
  function startAnim(lib, anim, loop, car)
	  if IsPedInAnyVehicle(GetPlayerPed(-1), true) and car == 1 then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
	  end)
	  elseif not IsPedInAnyVehicle(GetPlayerPed(-1), true) and car <= 1 then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
	  end)
	  elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) and car == 2 then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
	  end)
  end
  end
  
  function startAnim2(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
	  end)
  end
  end
  
  function startAnimAngle(lib, anim, loop)
	  local co = GetEntityCoords(GetPlayerPed(-1))
	  local he = GetEntityHeading(GetPlayerPed(-1))
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnimAdvanced(GetPlayerPed(-1), lib, anim, co.x, co.y, co.z, 0, 0, he-180, 8.0, 3.0, -1, loop, 0.0, 0, 0)
	  end)
  end
  end
  
  function startAnimAngle2(lib, anim, loop)
	  local co = GetEntityCoords(GetPlayerPed(-1))
	  local he = GetEntityHeading(GetPlayerPed(-1))
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnimAdvanced(GetPlayerPed(-1), lib, anim, co.x, co.y, co.z, 0, 0, he-90, 8.0, 3.0, -1, loop, 0.0, 0, 0)
	  end)
  end
  end
  
  function startAnimRozmowa(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 33000, loop, 1, false, false, false)
	  end)
  end
  end
  
  function startAnimTabletka(lib, anim, loop)
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 3200, loop, -1, false, false, false)
	  end)
  end
  
  function startAnimSchowek(lib, anim, loop)
	  if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 5000, loop, 1, false, false, false)
	  end)
  end
  end
  
  function startAnimOchroniarz(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  Citizen.Wait(1500)
		  RequestAnimDict("amb@world_human_stand_guard@male@base")
		  while (not HasAnimDictLoaded("amb@world_human_stand_guard@male@base")) do Citizen.Wait(0) end
		  TaskPlayAnim(PlayerPedId(), "amb@world_human_stand_guard@male@base", "base", 8.0, 3.0, -1, 51, 1, false, false, false)
	  end)
  end
  end
  
  function startAnimOckniecie(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 12000, loop, 1, false, false, false)
	  end)
  end
  end
  
  function startAnimProp(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  kierowanieruchemprop()
		  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  end)
  end
  end
  
  function startAnimProp2(lib, anim, loop)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  notesprop()
	  end)
  end
  
  function startAnimProp3(lib)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
	  TaskPlayAnim(PlayerPedId(), "random@burial", "a_burial", 8.0, -4.0, -1, 1, 0, 0, 0, 0)
		  lopataprop()
	  end)
  end
  end
  
  --[[function startAnimProp4(lib, anim, loop)
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 1000, loop, 1, false, false, false)
		  blachaprop()
	  end)
  end]]
  
  function startAnimProp5(lib, anim, loop)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  aparatprop()
	  end)
  end
  
  function startAnimProp6(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 2000, loop, 1, false, false, false)
		  portfeldowodprop()
	  end)
  end
  end
  
  --[[function startAnimProp7(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 2000, loop, 1, false, false, false)
		  portfelkasaprop()
	  end)
  end
  end]]
  
  function startAnimProp8(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  clipboardprop()
	  end)
  end
  end
  
  --[[function startAnimProp9(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, 2000, loop, 1, false, false, false)
		  portfelkasaprop2()
	  end)
  end
  end]]
  
  function startAnimProp10(lib, anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  scierkaprop()
	  end)
  end
  end
  
  function startAnimProp11(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  telefonprop()
	  end)
  end
  
  function startAnimProp12(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  telefonprop2()
	  end)
  end
  
  --[[function startAnimProp13(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  burgerprop()
	  end)
  end]]
  
  --[[function startAnimProp14(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  wodaprop()
	  end)
  end]]
  
  function startAnimProp15(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  kawaprop()
	  end)
  end
  
  --[[function startAnimProp16(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  torbaprop()
	  end)
  end]]
  
  function startAnimProp17(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  kartonprop()
	  end)
  end
  end
  
  function startAnimProp18(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  walizkaprop()
	  end)
  end
  end
  
  function startAnimProp19(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  walizkaprop2()
	  end)
  end
  end
  
  function startAnimProp20(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  walizkaprop3()
	  end)
  end
  end
  
  function startAnimProp21(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  walizkaprop4()
	  end)
  end
  end
  
  function startAnimProp22(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  wiertarkaprop()
	  end)
  end
  end
  
  function startAnimProp23(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  toolboxprop()
	  end)
  end
  end
  
  function startAnimProp24(lib, anim, loop, car)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  toolboxprop2()
	  end)
  end
  end
  
  --[[function startAnimProp25(lib, anim, loop, car)
	  usuwanieanimprop()
	  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
	  Citizen.Wait(1)
	  ESX.Streaming.RequestAnimDict(lib, function()
		  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 3.0, -1, loop, 1, false, false, false)
		  tabletprop()
	  end)
  end]]
  
  
  function startScenario(anim, loop)
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) and loop == 1 then
		  TaskStartScenarioInPlace(PlayerPedId(), anim, 0, true)
	  elseif not IsPedInAnyVehicle(GetPlayerPed(-1), true) and loop == 0 then
		  TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
	  end
  end
  
  function startScenario2(anim)
  -- Get the offset-position from the player. (0.5m behind the player, and 0.5m below the player seems fine for most scenarios)
	  local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.6, -0.5)
	  local heading = GetEntityHeading(PlayerPedId())
  -- Play the scenario at the specified location.
	  if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		  ClearPedTasksImmediately(GetPlayerPed(-1))
		  TaskStartScenarioAtPosition(GetPlayerPed(-1), anim, pos['x'], pos['y'], pos['z'], heading, 0, 1, 0)
	  end
  end
  
  function OpenAnimationsMenu()
	  local elements = {}
  
	  for i=1, #Config.Animations, 1 do
		  table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
	  end
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations',
	  {
		  title    = 'Animacje',
		  align    = 'bottom-right',
		  elements = elements
	  }, function(data, menu)
		  OpenAnimationsSubMenu(data.current.value)
	  end, function(data, menu)
		  menu.close()
	  end)
  end
  
  function OpenAnimationsSubMenu(menu)
	  local title    = nil
	  local elements = {}
  
	  for i=1, #Config.Animations, 1 do
		  if Config.Animations[i].name == menu then
			  title = Config.Animations[i].label
  
			  for j=1, #Config.Animations[i].items, 1 do
				  if Config.Animations[i].items[j].data.e ~= nil and tostring(Config.Animations[i].items[j].data.e) ~= "" then
				  table.insert(elements, {
					  label = Config.Animations[i].items[j].label .. " ("..tostring(Config.Animations[i].items[j].data.e)..")",
					  type  = Config.Animations[i].items[j].type,
					  value = Config.Animations[i].items[j].data
				  })
				  else
				  table.insert(elements, {
					  label = Config.Animations[i].items[j].label,
					  type  = Config.Animations[i].items[j].type,
					  value = Config.Animations[i].items[j].data
				  })
				  end
			  end
  
			  break
  
		  end
	  end
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations_sub',
	  {
		  title    = title,
		  align    = 'bottom-right',
		  elements = elements
	  }, function(data, menu)
		  local type = data.current.type
		  local lib  = data.current.value.lib
		  local anim = data.current.value.anim
		  local loop = data.current.value.loop
		  local car = data.current.value.car
  
		  if type == 'scenario' then
			  startScenario(anim, loop)
		  elseif type == 'scenariosit' then
			  startScenario2(anim)
		  elseif type == 'walkstyle' then
			  startWalkStyle(lib, anim)
		  elseif type == 'faceexpression' then
			  startFaceExpression(anim)
		  elseif type == 'anim' then
			  startAnim(lib, anim, loop, car)
		  elseif type == 'anim2' then
			  startAnim2(lib, anim, loop)
		  elseif type == 'animangle' then
			  startAnimAngle(lib, anim, loop)
		  elseif type == 'animangle2' then
			  startAnimAngle2(lib, anim, loop)
		  elseif type == 'animangle3' then
			  startAnimAngle3(lib, anim, loop)
		  elseif type == 'animrozmowa' then
			  startAnimRozmowa(lib, anim, loop)
		  elseif type == 'animtabletka' then
			  startAnimTabletka(lib, anim, loop)
		  elseif type == 'animschowek' then
			  startAnimSchowek(lib, anim, loop)
		  elseif type == 'animochroniarz' then
			  startAnimOchroniarz(lib, anim, loop)
		  elseif type == 'animockniecie' then
			  startAnimOckniecie(lib, anim, loop)
		  elseif type == 'animprop' then
			  startAnimProp(lib, anim, loop)
		  elseif type == 'animprop2' then
			  startAnimProp2(lib, anim, loop)
		  elseif type == 'animprop3' then
			  startAnimProp3(lib)
  --		elseif type == 'animprop4' then
  --			startAnimProp4(lib, anim, loop)
		  elseif type == 'animprop5' then
			  startAnimProp5(lib, anim, loop)
		  elseif type == 'animprop6' then
			  startAnimProp6(lib, anim, loop)
  --		elseif type == 'animprop7' then
  --			startAnimProp7(lib, anim, loop)
		  elseif type == 'animprop8' then
			  startAnimProp8(lib, anim, loop)
  --		elseif type == 'animprop9' then
  --			startAnimProp9(lib, anim, loop)
		  elseif type == 'animprop10' then
			  startAnimProp10(lib, anim, loop)
		  elseif type == 'animprop11' then
			  startAnimProp11(lib, anim, loop, car)
		  elseif type == 'animprop12' then
			  startAnimProp12(lib, anim, loop, car)
  --		elseif type == 'animprop13' then
  --			startAnimProp13(lib, anim, loop, car)
  --		elseif type == 'animprop14' then
  --			startAnimProp14(lib, anim, loop, car)
		  elseif type == 'animprop15' then
			  startAnimProp15(lib, anim, loop, car)
  --		elseif type == 'animprop16' then
  --			startAnimProp16(lib, anim, loop, car)
		  elseif type == 'animprop17' then
			  startAnimProp17(lib, anim, loop, car)
		  elseif type == 'animprop18' then
			  startAnimProp18(lib, anim, loop, car)
		  elseif type == 'animprop19' then
			  startAnimProp19(lib, anim, loop, car)
		  elseif type == 'animprop20' then
			  startAnimProp20(lib, anim, loop, car)
		  elseif type == 'animprop21' then
			  startAnimProp21(lib, anim, loop, car)
		  elseif type == 'animprop22' then
			  startAnimProp22(lib, anim, loop, car)
		  elseif type == 'animprop23' then
			  startAnimProp23(lib, anim, loop, car)
		  elseif type == 'animprop24' then
			  startAnimProp24(lib, anim, loop, car)
  --		elseif type == 'animprop25' then
  --			startAnimProp25(lib, anim, loop, car)
		  end
	  end, function(data, menu)
		  menu.close()
	  end)
  end
  
  -- Key Controls & Loops
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(5)
  
	  if IsControlJustReleased(0, 170) and IsInputDisabled(0) and not isDead then
			  OpenAnimationsMenu()
		  end
  
		  if IsControlJustReleased(0, 73) and IsInputDisabled(0) and not isDead and not IsAimCamActive() and not IsFirstPersonAimCamActive() then
			  ClearPedTasks(PlayerPedId())
			  usuwanieanimprop()
		  elseif IsPedUsingScenario(GetPlayerPed(-1), "PROP_HUMAN_SEAT_BAR") or IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PICNIC") then
			  if IsControlJustPressed(0, 73) then
			  ClearPedTasksImmediately(GetPlayerPed(-1))
		end
	  end
	end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(5)
		  
	  local RemoveWeaponWhenAnim2 = CheckAnim2()
		  
	  if RemoveWeaponWhenAnim2 then
		  BlockAttack()
		  end
		  
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(500)
		  
	  local RemoveWeaponWhenAnim = CheckAnim()
		  
	  if RemoveWeaponWhenAnim then
		  SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
		  end
		  
	  end
  end)
  
  -- BlockActions
  
  local animsDict = {
	['mini@hookers_sp'] = 'idle_reject_loop_c',
	['amb@world_human_hang_out_street@female_arms_crossed@base'] = 'base',
	['anim@amb@nightclub@peds@'] = 'rcmme_amanda1_stand_loop_cop',
	['random@gang_intimidation@'] = '001445_01_gangintimidation_1_female_wave_loop',
	['amb@medic@standing@timeofdeath@base'] = 'base',
	['amb@world_human_paparazzi@male@idle_a'] = 'idle_c',
	['amb@world_human_clipboard@male@idle_a'] = 'idle_c',
	['anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity'] = 'hi_dance_facedj_09_v1_female^1',
	['Anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity'] = 'hi_dance_facedj_09_v1_female^3',
	['aNim@amb@nightclub@dancers@crowddance_facedj@hi_intensity'] = 'hi_dance_facedj_09_v1_female^6',
	['anim@amb@nightclub@dancers@crowddance_facedj@med_intensity'] = 'mi_dance_facedj_09_v1_female^1',
	['anim@amb@nightclub@dancers@crowddance_groups@hi_intensity'] = 'hi_dance_crowd_09_v1_female^1',
	['Anim@amb@nightclub@lazlow@hi_podium@'] = 'danceidle_hi_11_turnaround_laz',
	['aNim@amb@nightclub@lazlow@hi_podium@'] = 'danceidle_hi_17_smackthat_laz',
	['anIm@amb@nightclub@lazlow@hi_podium@'] = 'danceidle_mi_13_enticing_laz',
	['special_ped@mountain_dancer@monologue_3@monologue_3a'] = 'mnt_dnc_buttwag',
	['amb@world_human_cop_idles@male@base'] = 'base',
	['amb@world_human_cop_idles@female@base'] = 'base',
	['cellphone@'] = 'cellphone_text_to_call',
	['amb@world_human_stand_mobile@male@text@base'] = 'base',
	['amb@world_human_drinking@coffee@male@idle_a'] = 'idle_c',
	['mp_player_int_uppergang_sign_a'] = 'mp_player_int_gang_sign_a',
	['mp_player_int_upperv_sign'] = 'mp_player_int_v_sign',
	['rcmepsilonism8'] = 'bag_handler_idle_a',
	['anim@heists@narcotics@trash'] = 'walk',
	['anim@heists@fleeca_bank@drilling'] = 'drill_straight_start',
	['anim@heists@box_carry@'] = 'idle'
  }
  
  local animsDict2 = {
	['amb@world_human_stand_guard@male@base'] = 'base'
  }
  
  
  function CheckAnim()
	  for k,v in pairs(animsDict)do
		  if IsEntityPlayingAnim(PlayerPedId(), k, v, 3) then
			  return true;
		  end
	  end
	  return false;
  end
  
  function CheckAnim2()
	  for k,v in pairs(animsDict2)do
		  if IsEntityPlayingAnim(PlayerPedId(), k, v, 3) then
			  return true;
		  end
	  end
	  return false;
  end
  
  function BlockAttack()
	  DisableControlAction(0, 25,   true) -- Input Aim
	  DisableControlAction(0, 24,   true) -- Input Attack
	  DisableControlAction(0, 140,  true) -- Melee Attack Alternate
	  DisableControlAction(0, 141,  true) -- Melee Attack Alternate
	  DisableControlAction(0, 142,  true) -- Melee Attack Alternate
	  DisableControlAction(0, 257,  true) -- Input Attack 2
	  DisableControlAction(0, 263,  true) -- Input Melee Attack
	  DisableControlAction(0, 264,  true) -- Input Melee Attack 2
	  DisableControlAction(0, 44,  true) -- Q
	  DisableControlAction(0, 157,  true) -- 1
	  DisableControlAction(0, 158,  true) -- 2
	  DisableControlAction(0, 160,  true) -- 3
	  DisableControlAction(0, 164,  true) -- 4
	  DisableControlAction(0, 165,  true) -- 5
	  DisableControlAction(0, 159,  true) -- 6
	  DisableControlAction(0, 161,  true) -- 7
	  DisableControlAction(0, 162,  true) -- 8
	  DisableControlAction(0, 163,  true) -- 9
	  DisableControlAction(0, 37,  true) -- TAB
	  DisableControlAction(0, 45,  true) -- R
  end
  
  
  -- Props
  
  function kierowanieruchemprop()
  parkingwand = CreateObject(GetHashKey('prop_parking_wand_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(parkingwand, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.0, -0.03, 65.0, 100.0, 130.0, 1, 0, 0, 0, 0, 1)
  end
  
  function notesprop()
  notes = CreateObject(GetHashKey('prop_notepad_02'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(notes, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.15, 0.03, 0.0, -42.0, 0.0, 0.0, 1, 0, 0, 0, 0, 1)
  pen = CreateObject(GetHashKey('prop_pencil_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(pen, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xFA10), 0.04, -0.02, 0.01, 90.0, -125.0, -180.0, 1, 0, 0, 0, 0, 1)
  end
  
  function lopataprop()
  lopata = CreateObject(GetHashKey('prop_ld_shovel'), GetEntityCoords(PlayerPedId()), true, false, false)
  AttachEntityToEntity(lopata, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
  end
  
  function blachaprop()
  blacha = CreateObject(GetHashKey('prop_fib_badge'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(blacha, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.03, 0.003, -0.045, 90.0, 0.0, 75.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(1000)
  usuwanieanimprop()
  end
  
  function aparatprop()
  aparat = CreateObject(GetHashKey('prop_pap_camera_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(aparat, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xE5F2), 0.1, -0.05, 0.0, -10.0, 50.0, 5.0, 1, 0, 0, 0, 0, 1)
  end
  
  function portfeldowodprop()
  portfel = CreateObject(GetHashKey('prop_ld_wallet_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(portfel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.17, 0.0, 0.019, -120.0, 0.0, 0.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(500)
  dowod = CreateObject(GetHashKey('prop_michael_sec_id'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(dowod, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.150, 0.045, -0.015, 0.0, 0.0, 180.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(1300)
  usuwanieportfelanimprop()
  end
  
  function portfelkasaprop()
  portfel = CreateObject(GetHashKey('prop_ld_wallet_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(portfel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.17, 0.0, 0.019, -120.0, 0.0, 0.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(500)
  kasa = CreateObject(GetHashKey('prop_anim_cash_note'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(kasa, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.175, 0.045, -0.015, 90.0, 90.0, 180.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(1300)
  usuwanieportfelanimprop()
  end
  
  function portfelkasaprop2()
  portfel = CreateObject(GetHashKey('prop_ld_wallet_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(portfel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.17, 0.0, 0.019, -120.0, 0.0, 0.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(500)
  kasa2 = CreateObject(GetHashKey('prop_anim_cash_pile_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(kasa2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.175, 0.045, -0.015, 90.0, 90.0, 180.0, 1, 0, 0, 0, 0, 1)
  Citizen.Wait(1300)
  usuwanieportfelanimprop()
  end
  
  function clipboardprop()
  clipboard = CreateObject(GetHashKey('p_amb_clipboard_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(clipboard, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x8CBD), 0.1, 0.015, 0.12, 45.0, -130.0, 180.0, 1, 0, 0, 0, 0, 1)
  end
  
  function scierkaprop()
  scierka = CreateObject(GetHashKey('prop_huf_rag_01'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(scierka, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.16, 0.0, -0.040, 10.0, 0.0, -45.0, 1, 0, 0, 0, 0, 1)
  end
  
  function telefonprop()
  telefon = CreateObject(GetHashKey('prop_amb_phone'), GetEntityCoords(PlayerPedId()), true)-- creates object
  AttachEntityToEntity(telefon, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), -0.01, -0.005, 0.0, -10.0, 8.0, 0.0, 1, 0, 0, 0, 0, 1)
  end
  
  function telefonprop2()
  telefon2 = CreateObject(GetHashKey('prop_amb_phone'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(telefon2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
  end
  
  function burgerprop()
  burger = CreateObject(GetHashKey('prop_sandwich_01'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(burger, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.135, 0.02, 0.05, -30.0, -120.0, -60.0, 1, 1, 0, 1, 1, 1)
  end
  
  function wodaprop()
  woda = CreateObject(GetHashKey('prop_ld_flow_bottle'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(woda, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
  end
  
  function kawaprop()
  kawa = CreateObject(GetHashKey('p_amb_coffeecup_01'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(kawa, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.14, 0.015, -0.03, -80.0, 0.0, -20.0, 1, 1, 0, 1, 1, 1)
  end
  
  function torbaprop()
  torba = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(torba, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xE0FD), 0.0, 0.0, 0.0, 0.0, 90.0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function kartonprop()
  karton = CreateObject(GetHashKey('v_serv_abox_04'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(karton, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0.0, -0.08, -0.17, 0, 0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function walizkaprop()
  walizka = CreateObject(GetHashKey('prop_ld_case_01'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(walizka, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.0, -0.02, -90.0, 0.0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function walizkaprop2()
  walizka2 = CreateObject(GetHashKey('hei_p_attache_case_shut'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(walizka2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.0, 0.0, 0.0, 0.0, -90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function walizkaprop3()
  walizka3 = CreateObject(GetHashKey('prop_ld_suitcase_01'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(walizka3, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.36, 0.0, -0.02, -90.0, 0.0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function walizkaprop4()
  walizka4 = CreateObject(GetHashKey('prop_suitcase_03'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(walizka4, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.36, -0.45, -0.05, -50.0, -60.0, 15.0, 1, 1, 0, 1, 1, 1)
  end
  
  function wiertarkaprop()
  wiertarka = CreateObject(GetHashKey('prop_tool_drill'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(wiertarka, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.1, 0.04, -0.03, -90.0, 180.0, 0.0, 1, 1, 0, 1, 1, 1)
  end
  
  function toolboxprop()
  toolbox = CreateObject(GetHashKey('prop_tool_box_04'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(toolbox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.43, 0.0, -0.02, -90.0, 0.0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function toolboxprop2()
  toolbox2 = CreateObject(GetHashKey('prop_tool_box_02'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(toolbox2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.53, 0.0, -0.02, -90.0, 0.0, 90.0, 1, 1, 0, 1, 1, 1)
  end
  
  function tabletprop()
  tablet = CreateObject(GetHashKey('hei_prop_dlc_tablet'), 1.0, 1.0, 1.0, 1, 1, 0)
  AttachEntityToEntity(tablet, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), -0.05, -0.007, -0.04, 0.0, 0.0, 0.0, 1, 1, 0, 1, 1, 1)
  end
  
  
  function usuwanieanimprop()
  DeleteEntity(parkingwand)
  DeleteEntity(notes)
  DeleteEntity(lopata)
  DeleteEntity(blacha)
  DeleteEntity(pen)
  DeleteEntity(aparat)
  DeleteEntity(dowod)
  DeleteEntity(kasa)
  DeleteEntity(kasa2)
  DeleteEntity(clipboard)
  DeleteEntity(scierka)
  DeleteEntity(telefon)
  DeleteEntity(telefon2)
  DeleteEntity(portfel)
  DeleteEntity(burger)
  DeleteEntity(woda)
  DeleteEntity(kawa)
  DeleteEntity(torba)
  DeleteEntity(karton)
  DeleteEntity(walizka)
  DeleteEntity(walizka2)
  DeleteEntity(walizka3)
  DeleteEntity(walizka4)
  DeleteEntity(wiertarka)
  DeleteEntity(toolbox)
  DeleteEntity(toolbox2)
  DeleteEntity(tablet)
  end
  
  function usuwanieportfelanimprop()
  DeleteEntity(dowod)
  DeleteEntity(kasa)
  DeleteEntity(kasa2)
  Citizen.Wait(200)
  DeleteEntity(portfel)
  end
  
  
  ---------------------------------bongos------------------------------------------------------
  
  local holdingbong = false
  local bongmodel = "hei_heist_sh_bong_01"
  local bong_net = nil
  
  RegisterNetEvent('esx_animations:bongo')
  AddEventHandler('esx_animations:bongo', function(anim)
	  local ad1 = "anim@safehouse@bong"
	  local ad1a = "bong_stage1"
	  local player = GetPlayerPed(-1)
	  local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
	  local bongspawned = CreateObject(GetHashKey(bongmodel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	  local netid = ObjToNet(bongspawned)
	  local plyCoords2 = GetEntityCoords(player, true)
	  local head = GetEntityHeading(player)
  
	  if (DoesEntityExist(player) and not IsEntityDead(player)) then 
		  loadAnimDict(ad1)
		  RequestModel(GetHashKey(bongmodel))
		  if holdingbong then
			  Wait(100)
			  ClearPedSecondaryTask(GetPlayerPed(-1))
			  DetachEntity(NetToObj(bong_net), 1, 1)
			  DeleteEntity(NetToObj(bong_net))
			  bong_net = nil
			  holdingbong = false
		  else
			  Wait(500)
			  SetNetworkIdExistsOnAllMachines(netid, true)
			  NetworkSetNetworkIdDynamic(netid, true)
			  SetNetworkIdCanMigrate(netid, false)
			  AttachEntityToEntity(bongspawned,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.10,-0.25,0.0,95.0,190.0,180.0,1,1,0,1,0,1)
			  Wait(120)
			  bong_net = netid
			  holdingbong = true
			  Wait(1000)
			  TaskPlayAnimAdvanced(player, ad1, ad1a, plyCoords2.x, plyCoords2.y, plyCoords2.z, 0.0, 0.0, head, 8.0, 1.0, 4000, 49, 0.25, 0, 0)
			  Wait(100)
			  Wait(7250)
			  TaskPlayAnim(player, ad2, ad2a, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
			  Wait(500)
			  ClearPedSecondaryTask(GetPlayerPed(-1))
			  DetachEntity(NetToObj(bong_net), 1, 1)
			  DeleteEntity(NetToObj(bong_net))
			  bong_net = nil
			  holdingbong = false
		  end
	  end
  end)
  
  function loadAnimDict(dict)
	  while (not HasAnimDictLoaded(dict)) do 
		  RequestAnimDict(dict)
		  Citizen.Wait(5)
	  end
  end
  