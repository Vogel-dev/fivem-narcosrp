local notes = 20
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not IsPauseMenuActive() then
			local ped = GetPlayerPed(-1)
			if DoesEntityExist(ped) then
				if IsControlJustPressed(1, notes) then
					TriggerEvent('sendProximityMessageZ', "📝 | Obywatel z numer biletu ^5{0}^0 sprawdza wykaz obywateli.")
					if not IsPedInAnyVehicle(ped) and not IsEntityDead(ped) and not IsPedFalling(ped) and not IsPedCuffed(ped) and not IsPedDiving(ped) and not IsPedInCover(ped, false) and not IsPedInParachuteFreeFall(ped) and (GetPedParachuteState(ped) == 0 or GetPedParachuteState(ped) == -1) then
						TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
					end
				end

				if IsControlPressed(1, notes) then
				end

				if IsControlJustReleased(1, notes) and GetLastInputMethod(2) and not IsPedCuffed(ped) then
					ClearPedTasks(ped)
				end
			end
		end
	end
end)


RegisterNetEvent('sendProximityMessageZ')
AddEventHandler('sendProximityMessageZ', function(message)
  local playerName = source
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  local twojeid = GetPlayerServerId(PlayerId())
  if pid == myId then
		--TriggerServerEvent('z_send', " ^2Obywatel [" .. GetPlayerServerId(PlayerId()) .. "] ^3przegląda listę obywateli.")
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.35vw; margin: 0.2vw; background-color: rgba(55, 55, 55, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^* ^r📝|  Obywatel z numerem biletu ^1<strong>{0}</strong>^0 sprawdza wykaz przyjezdnych.  </div>',
			args = { twojeid }
		})
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.35vw; margin: 0.2vw; background-color: rgba(55, 55, 55, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^* ^r📝| Obywatel z numerem biletu ^1<strong>{0}</strong>^0 sprawdza wykaz przyjezdnych.  </div>',
        args = { twojeid }
      })
		--TriggerServerEvent('z_send', " ^2Obywatel [" .. GetPlayerServerId(PlayerId()) .. "] ^3przegląda listę obywateli.")
  end
end)
