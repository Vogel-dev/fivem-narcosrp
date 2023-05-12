unction getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end



RegisterServerEvent('z_send')
AddEventHandler('z_send', function(message)
  local playerName = source
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  local twojeid = GetPlayerServerId(PlayerId())
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.35vw; margin: 0.2vw; background-color: rgba(55, 55, 55, 0.5); border-radius: 25px; margin-left: 0; margin-right: 0;">^* ^r📝| Obywatel z numerem biletu ^1<strong>{0}</strong>^0 sprawdza wykaz przyjezdnych.  </div>',
			args = { message }
	})
end, false)