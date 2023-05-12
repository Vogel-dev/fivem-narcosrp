-- Announcing
TriggerEvent('es:addGroupCommand', 'info', "admin", function(source, args, user)
	TriggerClientEvent('announce', -1, "~b~informacja", table.concat(args, " "), 5)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end, {help = "Announce a message to the entire server", params = {{name = "announcement", help = "The message to announce"}}})