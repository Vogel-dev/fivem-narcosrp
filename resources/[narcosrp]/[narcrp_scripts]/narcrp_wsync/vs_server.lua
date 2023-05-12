local DynamicWeather = true -- set this to false if you don't want the weather to change automatically every 10 minutes.
local debugprint = false -- enable debug mode

-------------------- DON'T CHANGE THIS --------------------
AvailableWeatherTypes = {
	'EXTRASUNNY', 
	'CLEAR', 
	'NEUTRAL', 
	'SMOG', 
	'FOGGY', 
	'OVERCAST', 
	'CLOUDS', 
	'CLEARING', 
	'RAIN', 
	'THUNDER', 
	'SNOW', 
	'BLIZZARD', 
	'SNOWLIGHT', 
	'XMAS', 
	'HALLOWEEN',
}
CurrentWeather = "EXTRASUNNY"
local baseTime = 0
local timeOffset = 0
local freezeTime = false
local blackout = false
local newWeatherTimer = 10

RegisterServerEvent('es_wsync:requestSync')
AddEventHandler('es_wsync:requestSync', function()
	TriggerClientEvent('es_wsync:updateWeather', -1, CurrentWeather, blackout)
	TriggerClientEvent('es_wsync:updateTime', -1, baseTime, timeOffset, freezeTime)
end)

RegisterServerEvent('es_wsync:freeze_time')
AddEventHandler('es_wsync:freeze_time', function(source)
	-- check for console user
	if source ~= 0 then
		freezeTime = not freezeTime
		if freezeTime then
			sendNotification(source, 'Czas został zamrożony.', 'info', 5000)
		else
			sendNotification(source, 'Czas został odmrożony.', 'info', 5000)
		end
	else
		freezeTime = not freezeTime
		if freezeTime then
			print("Time is now frozen.")
		else
			print("Time is no longer frozen.")
		end
	end
end)

TriggerEvent('es:addGroupCommand', 'weather', 'admin', function(source, args, user)
	if source == 0 then
		local validWeatherType = false
		if args[1] == nil then
			print("Invalid syntax, correct syntax is: /weather <weathertype> ")
			return
		else
			for i,wtype in ipairs(AvailableWeatherTypes) do
				if wtype == string.upper(args[1]) then
					validWeatherType = true
					break
				end
			end
			if validWeatherType then
				print("Weather has been updated.")
				CurrentWeather = string.upper(args[1])
				newWeatherTimer = 10
				TriggerEvent('es_wsync:requestSync')
			else
				print("Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ")
			end
		end
	else
		local validWeatherType = false
		if args[1] == nil then
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax, use ^0/weather <weatherType> ^1instead!')
		else
			for i,wtype in ipairs(AvailableWeatherTypes) do
				if wtype == string.upper(args[1]) then
					validWeatherType = true
					break
				end
			end
			if validWeatherType then
				sendNotification(source, 'Pomyślnie zmieniono pogodę na: ' .. string.lower(args[1]) .. '.', 'info', 5000)
				CurrentWeather = string.upper(args[1])
				newWeatherTimer = 10
				TriggerEvent('es_wsync:requestSync')
			else
				TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ')
			end
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Set weather type", params = {{name = "weatherType", help = "Available types: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween"}}})

RegisterServerEvent('es_wsync:blackout')
AddEventHandler('es_wsync:blackout', function(source)
	if source == 0 then
		blackout = not blackout
		if blackout then
			print("Blackout is now enabled.")
		else
			print("Blackout is now disabled.")
		end
	else
		blackout = not blackout
		if blackout then
			sendNotification(source, 'Zaćmienie zostało włączone pomyślnie.', 'info', 5000)
		else
			sendNotification(source, 'Zaćmienie zostało wyłączone pomyślnie.', 'info', 5000)
		end
		TriggerEvent('es_wsync:requestSync')
	end
end)

RegisterServerEvent('es_wsync:morning')
AddEventHandler('es_wsync:morning', function(source)
	if source == 0 then
		print("For console, use the \"/time <hh> <mm>\" command instead!")
		return
	end
	ShiftToMinute(0)
	ShiftToHour(9)
	sendNotification(source, 'Czas został ustawiony na: poranek.', 'info', 5000)
	TriggerEvent('es_wsync:requestSync')
end)

RegisterServerEvent('es_wsync:noon')
AddEventHandler('es_wsync:noon', function(source)
	if source == 0 then
		print("For console, use the \"/time <hh> <mm>\" command instead!")
		return
	end
	ShiftToMinute(0)
	ShiftToHour(12)
	sendNotification(source, 'Czas został ustawiony na: południe.', 'info', 5000)
	TriggerEvent('es_wsync:requestSync')
end)

RegisterServerEvent('es_wsync:evening')
AddEventHandler('es_wsync:evening', function(source)
	if source == 0 then
		print("For console, use the \"/time <hh> <mm>\" command instead!")
		return
	end
	ShiftToMinute(0)
	ShiftToHour(18)
	sendNotification(source, 'Czas został ustawiony na: wieczór.', 'info', 5000)
	TriggerEvent('es_wsync:requestSync')
end)

RegisterServerEvent('es_wsync:night')
AddEventHandler('es_wsync:night', function(source)
	if source == 0 then
		print("For console, use the \"/time <hh> <mm>\" command instead!")
		return
	end
	ShiftToMinute(0)
	ShiftToHour(23)
	sendNotification(source, 'Czas został ustawiony na: noc.', 'info', 5000)
	TriggerEvent('es_wsync:requestSync')
end)

function ShiftToMinute(minute)
	timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
	timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

TriggerEvent('es:addGroupCommand', 'time', 'admin', function(source, args, user)
	if source == 0 then
		if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
			local argh = tonumber(args[1])
			local argm = tonumber(args[2])
			if argh < 24 then
				ShiftToHour(argh)
			else
				ShiftToHour(0)
			end
			if argm < 60 then
				ShiftToMinute(argm)
			else
				ShiftToMinute(0)
			end
			print("Time has changed to " .. argh .. ":" .. argm .. ".")
			TriggerEvent('es_wsync:requestSync')
		else
			print("Invalid syntax, correct syntax is: time <hour> <minute> !")
		end
	elseif source ~= 0 then
		if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
			local argh = tonumber(args[1])
			local argm = tonumber(args[2])
			if argh < 24 then
				ShiftToHour(argh)
			else
				ShiftToHour(0)
			end
			if argm < 60 then
				ShiftToMinute(argm)
			else
				ShiftToMinute(0)
			end
			local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
			local minute = math.floor((baseTime+timeOffset)%60)
			if minute < 10 then
				newtime = newtime .. "0" .. minute
			else
				newtime = newtime .. minute
			end
			sendNotification(source, 'Czas został ustawiony na: '..newtime..'.', 'info', 5000)
			TriggerEvent('es_wsync:requestSync')
		else
			TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax. Use ^0/time <hour> <minute> ^1instead!')
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Change the time", params = {{ name="hours", help="A number between 0 - 23"}, { name="minutes", help="A number between 0 - 59"}}})

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end

