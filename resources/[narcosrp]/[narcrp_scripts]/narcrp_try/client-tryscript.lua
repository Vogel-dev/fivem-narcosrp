local try = 1
RegisterNetEvent('tryscript:pokaz3d')
AddEventHandler('tryscript:pokaz3d', function(tekst, source)
    local zmienna = 1 + (try*0.15)
    Pokazuj(GetPlayerFromServerId(source), tekst, zmienna)
end)

function Pokazuj(osoba, tekst, zmienna)
    local pokazuje = true

    Citizen.CreateThread(function()
        Wait(7000)
        pokazuje = false
    end)
	
    Citizen.CreateThread(function()
        try = try + 1
        while pokazuje do
            Wait(0)
            local kordygracz = GetEntityCoords(GetPlayerPed(osoba), false)
            local kordy = GetEntityCoords(PlayerPedId(), false)
            local odleglosc = Vdist2(kordygracz, kordy)
            if odleglosc < 500 then
                 Tekst3d(kordygracz['x'], kordygracz['y'], kordygracz['z']+zmienna-0.20, tekst)
            end
        end
        try = try - 1
    end)
end

function Tekst3d(x,y,z, tekst)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(tekst)
		DrawText(_x,_y)
		local factor = (string.len(tekst)) / 370
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 100, 40, 40, 125)
    end
end