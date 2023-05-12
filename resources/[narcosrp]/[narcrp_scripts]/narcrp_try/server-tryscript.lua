RegisterCommand('try', function(source, args, rawCommand)
	local score = math.random(1,2)
	if score == 1 then
		TriggerClientEvent('tryscript:pokaz3d', -1, '*próba* zakończona pomyślnie', source)
	else
		TriggerClientEvent('tryscript:pokaz3d', -1, '*próba* zakończona niepomyślnie', source)
	end
end, false)