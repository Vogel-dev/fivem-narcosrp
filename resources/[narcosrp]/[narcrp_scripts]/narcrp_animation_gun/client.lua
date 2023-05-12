local holstered = true
local lastWeapon = nil

local weapons = {
    "WEAPON_KNIFE",
    "WEAPON_PISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_COMBATPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_MINISMG",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTSMG",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOl",
    "WEAPON_DBSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PISTOL_MK2",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_SNSPISTOL",
    "WEAPON_STUNGUN",
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        
        local ped = GetPlayerPed(-1)

        if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then
            loadAnimDict("reaction@intimidation@1h")

            if CheckWeapon(ped) then
                if holstered then
                    local weapon = GetSelectedPedWeapon(ped)

                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)

                    TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    
                    Citizen.Wait(1200)

                    SetCurrentPedWeapon(ped, weapon, true)
                    DisablePlayerFiring(ped, true)

                    Citizen.Wait(800)

                    DisablePlayerFiring(ped, false)

                    ClearPedTasks(ped)

                    holstered = false
                end
            elseif not CheckWeapon(ped) then
                if not holstered then
                    if lastWeapon ~= nil then
                        SetCurrentPedWeapon(ped, lastWeapon, true)
                    end

                    TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                    
                    Citizen.Wait(1500)

                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                    
                    ClearPedTasks(ped)
                    holstered = true
                end
            end

            lastWeapon = GetSelectedPedWeapon(ped)
        end
    end
end)

function CheckWeapon(ped)
    for i=1, #weapons do
        if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
            return true
        end
    end

    return false
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        
        Citizen.Wait(10)
    end
end