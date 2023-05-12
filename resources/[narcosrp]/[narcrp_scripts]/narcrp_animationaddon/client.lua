--New custom animations based off DavesEmotes from @davewazere
--https://forum.fivem.net/t/release-daves-emotes/140216 
--Finger Pointing is taken from @Geekness and @Hallux
--https://forum.fivem.net/t/release-finger-pointing-by-geekness/103722
--Ragdoll is from here @callmejaf
--https://forum.fivem.net/t/release-toggle-ragdoll/53668
--Crouch is from wolfknights script @WolfKnight
--https://forum.fivem.net/t/release-crouch-script-1-0-1-now-button-based/14742


-- Commands
-- Salute: 		/e salut		: Salutuj znajomych
-- Surrender: 		/e kolana		: Na Kolanka i rece do g�ry
-- Brief:		/e teczka		: Taktyczna Teczka
-- Brief2:		/e teczka2		: Skr�rzana Teczka
-- Foldarms:		/e foch			: Skrzyzuj rece 
-- Foldarms2: 		/e foch2		: Skrzyzuj rece w inny spos�b
-- Damn:		/e okurwa		: Nie wierze
-- No:			/e nie			: Potrzasnij glowa nie
-- Pickbutt:		/e podrapdupe		: Podrap se dupsko
-- Grab Crotch:		/e podrapjaja		: Podrap se jajca
-- Holster:		/e kabura		: Reka na kaburze
-- 			/e klaskaj		: Klaskaj Wolno
--			/e klaskaj2		: Klaskaj Szybko
--			/e lez			: Pol�z sie w l�zku
--			/e oprzyjsie		: Oprzyj sie o sciane
--			/e spokoj		: Uspok�j Ludzi
--			/e spokoj2		: Uspok�j Ludzi
--			/e pas			: raczki na Pasku


-- If you want ESX features enabled you can uncomment this stuff
--------------------------------------------------------------------------------------------- ESX SUPPORT ---------------------------------------------------------------------------------------------


--ESX 			    			= nil
--local PlayerData 				= {}

--Citizen.CreateThread(function()
--	while ESX == nil do
--		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--		Citizen.Wait(0)
--	end
--end)

--RegisterNetEvent('esx:playerLoaded')
--AddEventHandler('esx:playerLoaded', function(xPlayer)
--  PlayerData = xPlayer
--end)

--RegisterNetEvent('esx:setJob')
--AddEventHandler('esx:setJob', function(job)
--  PlayerData.job = job
--end)

------------------------------------------------------------------------------------------ END ESX SUPPORT ------------------------------------------------------------------------------------------

--[[local radioActive 				= false
--local radioButton				= 303 --- U by default  -- use 57 for f10
--local handsUpButton				= 74 --- H by default -- use 73 for X

--- Function for radio chatter function
--Citizen.CreateThread( function()

	while true do
		Citizen.Wait(0)
		-- if you use ESX Framework and want this to be a cop only thing then replace the line below this with the following:
		-- if (PlayerData.job ~= nil and PlayerData.job.name == 'police') and (IsControlJustPressed(0,radioButton)) then
		if (IsControlJustPressed(0,radioButton))  then
			local ped = PlayerPedId()
			--TriggerEvent('chatMessage', '/do Sprawdza spis')
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				radioActive = true
	
				if radioActive then
	
					RequestAnimDict( "random@arrests" )
	
					while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
						Citizen.Wait( 100 )
					end
	
					if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
						ClearPedSecondaryTask(ped)
					else
						TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
						local prop_name = prop_name
						local secondaryprop_name = secondaryprop_name
						DetachEntity(prop, 1, 1)
						DeleteObject(prop)
						DetachEntity(secondaryprop, 1, 1)
						DeleteObject(secondaryprop)
						--SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
					end
				end
			end
		end
	end
end)]]--
	
--- Broke this into two functions because it was bugging out for some reason.
	
Citizen.CreateThread( function()
	
	while true do
		Citizen.Wait(0)
		-- if you use ESX Framework and want this to be a cop only thing then replace the line below this with the following:
		-- if (PlayerData.job ~= nil and PlayerData.job.name == 'police') and (IsControlJustReleased(0,57))  and (radioActive) then
		if (IsControlJustReleased(0,raisehandbutton))  and (radioActive) then
			local ped = PlayerPedId()
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				radioActive = false
				ClearPedSecondaryTask(ped)
				--SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
			end
		end

			
	end
	
end)


--[[Citizen.CreateThread( function()

	while true do
		Citizen.Wait(0)
		if (IsControlJustPressed(0,handsUpButton))  then
			local ped = PlayerPedId()
	
			if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	
				RequestAnimDict( "random@mugging3" )
	
				while ( not HasAnimDictLoaded( "random@mugging3" ) ) do 
					Citizen.Wait( 100 )
				end
	
				if IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) then
					ClearPedSecondaryTask(ped)
				else
					TaskPlayAnim(ped, "random@mugging3", "handsup_standing_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
					local prop_name = prop_name
					local secondaryprop_name = secondaryprop_name
					DetachEntity(prop, 1, 1)
					DeleteObject(prop)
					DetachEntity(secondaryprop, 1, 1)
					DeleteObject(secondaryprop)
				end
			end
		end
	end
end)]]--


RegisterCommand("e",function(source, args)
	local player = PlayerPedId()
	if tostring(args[1]) == nil then
		print("Invalid syntax, correct syntax is: /e <animation> ")
		return
	else
		if tostring(args[1]) ~= nil then
            local argh = tostring(args[1])

			if argh == 'kolana' then
				local surrendered = false
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( "random@arrests" )
					loadAnimDict( "random@arrests@busted" )
					if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
						TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (3000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
						surrendered = false
					else
						TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (4000)
						TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (500)
						TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
						Wait (1000)
						TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
						Wait(100)
						surrendered = true
					end     
				end

				Citizen.CreateThread(function() --disabling controls while surrendured
					while surrendered do
						Citizen.Wait(0)
						if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
							DisableControlAction(1, 140, true)
							DisableControlAction(1, 141, true)
							DisableControlAction(1, 142, true)
							DisableControlAction(0,21,true)
						end
					end
				end)


			elseif argh == 'salut' then
				local ad = "anim@mp_player_intuppersalute"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
						Wait (600)
						ClearPedSecondaryTask(PlayerPedId())
					else
						TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'foch2' then
				local ad = "missfbi_s4mop"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "guard_idle_a", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "guard_idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end 
				end
			elseif argh == 'teczka' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x88C78EB7, 1, false, true);
				end
			elseif argh == 'teczka2' then
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					GiveWeaponToPed(player, 0x01B79F17, 1, false, true);
				end
			elseif argh == 'foch' then
				local ad = "oddjobs@assassinate@construction@"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "unarmed_fold_arms", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "unarmed_fold_arms", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )

					end     
				end
			elseif argh == 'okurwa' then
				local ad = "gestures@m@standing@casual"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "gesture_damn", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "gesture_damn", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'nie' then
				local ad = "mp_player_int_upper_nod"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_nod_no", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_nod_no", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'podrapdupe' then
				local ad = "mp_player_int_upperarse_pick"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_arse_pick", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_arse_pick", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'podrapjaja' then
				local ad = "mp_player_int_uppergrab_crotch"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "mp_player_int_grab_crotch", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "mp_player_int_grab_crotch", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'kabura' then
				local ad = "move_m@intimidation@cop@unarmed"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "idle", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end
			elseif argh == 'straznik' then
				local ad = "rcmepsilonism8"
				
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "base_carrier", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					else
						TaskPlayAnim( player, ad, "base_carrier", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
					end     
				end

			elseif argh == 'klaskaj' then
				local ad = "anim@mp_player_intcelebrationmale@slow_clap"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "slow_clap", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "slow_clap", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'klaskaj2' then
				local ad = "amb@world_human_cheering@male_a"
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
						loadAnimDict( ad )
						if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) then 
							TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							ClearPedSecondaryTask(player)
							Wait (100)
						else
							TaskPlayAnim( player, ad, "base", 3.0, 1.0, -1, 49, 0, 0, 0, 0 )
							Wait (500)
						end       
					end
				end

			elseif argh == 'lez' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_bum_slumped_left_lo_res_base", 5.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'oprzyjsie' then
				local ad = "amb@lo_res_idles@"
				
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (100)
					else
						TaskPlayAnim( player, ad, "world_human_lean_male_foot_up_lo_res_base", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )
						Wait (500)
					end     
				end
			elseif argh == 'spokoj' then
				local ad = "amb@code_human_police_crowd_control@idle_a" --- insert the animation dic here
				local anim = "idle_a" --- insert the animation name here
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
			elseif argh == 'spokoj2' then
				local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
				local anim = "idle_d" --- insert the animation name here
				local player = PlayerPedId()
				
			
				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					loadAnimDict( ad )
					if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
						TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
						ClearPedSecondaryTask(player)
					else
						TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
					end       
				end
				
			elseif argh == 'pas' then

				if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
					if IsPedActiveInScenario(player) then
						ClearPedTasks(player)
					else
						TaskStartScenarioInPlace(player, 'WORLD_HUMAN_COP_IDLES', 0, 1)   
					end 
				end
			end
		end
	end
end, false)

----Use /testanimation command, you can use this to easily test new animations---

RegisterCommand("testanimation",function(source, args)

	local ad = "amb@code_human_police_crowd_control@idle_b" --- insert the animation dic here
	local anim = "idle_d" --- insert the animation name here
	local player = PlayerPedId()
	

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		TriggerEvent('chatMessage', '^2 Testing Animation')
		if ( IsEntityPlayingAnim( player, ad, anim, 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			TaskPlayAnim( player, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0 )
		end       
	end
end, false)

	
----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ functions -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function(prop_name, secondaryprop_name)
	while true do
		Citizen.Wait(500)
		if IsPedRagdoll(PlayerPedId()) then 
			local playerPed = PlayerPedId()
			local prop_name = prop_name
			local secondaryprop_name = secondaryprop_name
			DetachEntity(prop, 1, 1)
			DeleteObject(prop)
			DetachEntity(secondaryprop, 1, 1)
			DeleteObject(secondaryprop)
		end
	end
end)	

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

