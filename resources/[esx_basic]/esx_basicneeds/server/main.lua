ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz chleb...', 'success', 5000)
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz cheeseburgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hotdog', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz hotdoga...', 'success', 5000)
end)

ESX.RegisterUsableItem('frytki', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('frytki', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz frytki...', 'success', 5000)
end)

ESX.RegisterUsableItem('frytkixxl', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('frytkixxl', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz frytki xxl...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_twister', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_twister', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz twistera...', 'success', 5000)
end)

ESX.RegisterUsableItem('rest_obiadduzy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rest_obiadduzy', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz duży zestaw obiadowy...', 'success', 5000)
end)

ESX.RegisterUsableItem('rest_obiadmaly', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rest_obiadmaly', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 260000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz mały zestaw obiadowy...', 'success', 5000)
end)

ESX.RegisterUsableItem('rest_obiadsredni', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rest_obiadsredni', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz średni zestaw obiadowy...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_zinger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_zinger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz zingera...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_kubelekclassic', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_kubelekclassic', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 220000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz kubełek kurczaków...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_kubelek11', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_kubelek11', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 260000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz kubełek kurczaków...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_kubelekclassicxl', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_kubelekclassicxl', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 360000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz kubełek kurczaków...', 'success', 5000)
end)

ESX.RegisterUsableItem('lody', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lody', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz lody...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_grander', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_grander', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 260000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz grandera...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_longer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_longer', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz longera...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_megapocket', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_megapocket', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 190000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz mega-pocketa...', 'success', 5000)
end)

ESX.RegisterUsableItem('kfc_qurrito', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kfc_qurrito', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 190000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz qurrito...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_nuggets', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_nuggets', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz nuggetsy...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_bcwhopper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_bcwhopper', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_bigking', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_bigking', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 260000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_cchicken', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_cchicken', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 260000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_dcburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_dcburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_lchicken', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_lchicken', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_whopper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_whopper', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_whopperj', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_whopperj', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 110000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('bking_chburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bking_chburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 160000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz burgera...', 'success', 5000)
end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwich', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 130000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	sendNotification(source, 'Zjadasz kanapkę...', 'success', 5000)
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	sendNotification(source, 'Pijesz wodę...', 'success', 5000)
end)

ESX.RegisterUsableItem('cola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	sendNotification(source, 'Pijesz Coca Colę...', 'success', 5000)
end)

ESX.RegisterUsableItem('kuflowe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kuflowe', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	sendNotification(source, 'Pijesz Kuflowe Mocne...', 'success', 5000)
end)

ESX.RegisterUsableItem('zubr', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('zubr', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 600000)
	sendNotification(source, 'Pijesz Żubra...', 'success', 5000)
end)

ESX.RegisterUsableItem('martini', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('martini', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	sendNotification(source, 'Pijesz Martini...', 'success', 5000)
end)

ESX.RegisterUsableItem('moet', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('moet', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	sendNotification(source, 'Pijesz Moeta...', 'success', 5000)
end)

ESX.RegisterUsableItem('whiskey', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whiskey', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	sendNotification(source, 'Pijesz Jacka Danielsa...', 'success', 5000)
end)

ESX.RegisterUsableItem('wino', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wino', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	sendNotification(source, 'Pijesz wino...', 'success', 5000)
end)

TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local target = tonumber(args[1])
		
		-- is the argument a number?
		if target ~= nil then
			
			-- is the number a valid player?
			if GetPlayerName(target) then
				print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing a player!')
				--TriggerClientEvent('esx_basicneeds:healPlayer', target)
				--TriggerClientEvent('chatMessage', target, "HEAL", {223, 66, 244}, "You have been healed!")
			else
				--TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Player not found!")
			end
		else
			TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Incorrect syntax! You must provide a valid player ID")
		end
	else
		-- heal source
		print('esx_basicneeds: ' .. GetPlayerName(source) .. ' is healing!')
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})

function sendNotification(xSource, message, messageType, messageTimeout)
	TriggerClientEvent("pNotify:SendNotification", xSource, {
		text = message,
		type = messageType,
		queue = "dev",
		timeout = messageTimeout,
		layout = "bottomLeft"
	})
end