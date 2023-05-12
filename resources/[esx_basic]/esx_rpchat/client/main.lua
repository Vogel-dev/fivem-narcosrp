RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local monid = PlayerId()
  local sonid = GetPlayerFromServerId(id)
  if sonid == monid then
    TriggerEvent('chat:addMessage', {
      template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(41, 41, 41, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;"<i class="fas fa-user"></i> ^*{1}^r: {2}</div>',
      args = { '['..id..'] ', name, message }
  })
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 19.999 then
    TriggerEvent('chat:addMessage', {
      template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(41, 41, 41, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;"<i class="fas fa-user"></i> ^*Local OOC: {1}^r: {2}</div>',
      args = { '['..id..'] ', name, message }
  })
  end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {128, 128, 128}, " Me | " .. name .." ".." " .. message.." ")
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {128, 128, 128}, " Me | " .. name .." ".." " .. message.." ")
  end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "🚑 INFO MEDYCZNE", {255, 0, 0}, " ^*^0 " .. name .. "^r^0".. " " .. message.. " ")
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "🚑 INFO MEDYCZNE", {255, 0, 0}, " ^*^0 " .. name .. "^r^0".. " " .. message.. " ")
  end
end)

RegisterNetEvent('sendProximityMessageMed')
AddEventHandler('sendProximityMessageMed', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chat:addMessage', {
        template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(196, 1, 1, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">{0}<i class="fas fa-plus-square"></i> {1}: {2}</div>',
        args = { '['..id..'] ', name, message }
    })
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chat:addMessage', {
        template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(196, 1, 1, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">{0}<i class="fas fa-plus-square"></i> {1}: {2}</div>',
        args = { '['..id..'] ', name, message }
    })
  end
end)

RegisterNetEvent('sendProximityMessageMedd')
AddEventHandler('sendProximityMessageMedd', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chat:addMessage', {
      template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(76, 35, 86, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^*{0}  * ^r{1} * </div>',
      args = { ''..id..' | ', message }
  })
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chat:addMessage', {
        template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(76, 35, 86, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^*{0} * ^r{1} * </div>',
        args = { ''..id..' | ', message }
      })
  end
end)

RegisterNetEvent('sendProximityMessageMeddd')
AddEventHandler('sendProximityMessageMeddd', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chat:addMessage', {
      template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(36, 36, 36, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^*{0}  * ^r{1} * </div>',
      args = { ''..id..' | ', message }
  })
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chat:addMessage', {
      template = '<div style="text-shadow: 1.2px 1.2px 1.2px #000000; -webkit-box-shadow: 0px 5px 5px -5px #000000; box-shadow: 0px 5px 5px -5px #000000; padding: 0.35vw; margin: 0.2vw; background-color: rgba(36, 36, 36, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^*{0} * ^r{1} * </div>',
      args = { ''..id..' | ', message }
    })
  end
end)
