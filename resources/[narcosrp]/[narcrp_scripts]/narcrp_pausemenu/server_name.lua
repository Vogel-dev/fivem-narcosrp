function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', 'NarcosRP - Kryminogenny serwer RolePlay > https://discord.gg/hwyDkaJ |')
end)