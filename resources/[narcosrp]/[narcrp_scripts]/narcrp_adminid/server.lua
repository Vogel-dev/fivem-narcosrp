--[[

  Made with love by Cheleber, you can join my RP Server here: www.grandtheftlusitan.com
  Just add your admins steam id to server and client!

--]]

--- ADD YOUR STEAM ID OR LICENSE FROM YOUR ADMINS!
local admins = {
    'steam:110000104eb808d',
    'steam:11000010fdc8544',
    'steam:110000114f63a7e',
}



function isAdmin(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end



AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	if cm[1] == "/noid" then
		CancelEvent()
		if isAdmin(source) then
		    TriggerClientEvent("dontshowid", -1, source)
		    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID's OFF!")
		end
	end	
	if cm[1] == "/seeid" then
		CancelEvent()
		if isAdmin(source) then
		    TriggerClientEvent("showid", -1, source)
		    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID's ON!")
		end
	end	
end)


RegisterServerEvent('checkadmin')
AddEventHandler('checkadmin', function()
	local id = source
	if isAdmin(id) then
		TriggerClientEvent("setadmin", source)
	end
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
