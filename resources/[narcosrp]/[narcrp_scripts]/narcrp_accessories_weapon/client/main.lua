ESX          = nil
local IsDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

				local used = 0

RegisterNetEvent('eden_accesories:silencieux')
AddEventHandler('eden_accesories:silencieux', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local silencieux = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'silencieux' then
						silencieux = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used < silencieux then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  			used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
					used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  			used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
				   sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  		  	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
		  		 	used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 sendNotification('Pomyślnie założyłeś tłumik do broni.', 'success', 5000)
	used = used + 1
		  		
		  	else 
					sendNotification('Nie masz broni w ręku lub twoja broń nie może obsługiwać tłumika.', 'warning', 5000)
					
		  		
			end
			else
				   sendNotification('Ten tłumik jest już założony.', 'error', 5000)
							   

		end
end)
				local used2 = 0

RegisterNetEvent('eden_accesories:flashlight')
AddEventHandler('eden_accesories:flashlight', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'flashlight' then
						flashlight = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used2 < flashlight then
						print('used2')

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
		  		 	used2 = used2 + 1
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
		  		 	used2 = used2 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
				 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  			

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 sendNotification('Pomyślnie założyłeś latarkę do broni.', 'success', 5000)
	used2 = used2 + 1
		  		
		  	else 
					sendNotification('Nie masz broni w ręku lub twoja broń nie może mieć latarki.', 'warning', 5000)
			end
		else
							sendNotification('Ta latarka jest już założona.', 'error', 5000)
		end
end)
				local used3 = 0

RegisterNetEvent('eden_accesories:grip')
AddEventHandler('eden_accesories:grip', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local grip = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'grip' then
						grip = inventory[i].count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used3 < grip then

			
			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
		  				used3 = used3 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		 
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 sendNotification('Pomyślnie założyłeś uchwyt do broni.', 'success', 5000)
	used3 = used3 + 1
		  		
		  	else 
					sendNotification('Nie masz broni w ręku lub twoja broń nie może mieć uchwytu.', 'warning', 5000)
			end
		else
							sendNotification('Ten uchwyt jest już założony.', 'error', 5000)
		end
end)

				local used4 = 0

RegisterNetEvent('eden_accesories:yusuf')
AddEventHandler('eden_accesories:yusuf', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for i=1, #inventory, 1 do
					  if inventory[i].name == 'yusuf' then
						yusuf = inventory[i].count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used4 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
		  		 	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
				


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		  		 sendNotification('Pomyślnie przemalowałeś broń.', 'success', 5000)
	used4 = used4 + 1
		  		
		  	
		  	else 
					sendNotification('Nie masz broni w ręku lub twoja broń nie może mieć zdobienia.', 'warning', 5000)
		  		
			end
		else
					sendNotification('To zdobienie jest już wykorzystane.', 'error', 5000)
							

		end
end)



AddEventHandler('playerSpawned', function()
  used = 0
  used2 = 0
  used3 = 0
  used4 = 0
end)

function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end












