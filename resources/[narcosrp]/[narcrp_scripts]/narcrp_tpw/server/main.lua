local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback("esx_marker:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

AddEventHandler('serverlog', function(text)
	local gt = os.date('*t')
	local f,err = io.open("serverlog.log","a")
	if not f then return print(err) end
	local h = gt['hour'] if h < 10 then h = "0"..h end
	local m = gt['min'] if m < 10 then m = "0"..m end
	local s = gt['sec'] if s < 10 then s = "0"..s end
	local formattedlog = string.format("[%s:%s:%s] %s \n",h,m,s,text)
	f:write(formattedlog)
	f:close()
	-- uncomment line below, if you need (to show all logs in console also)
	print(formattedlog)
end)