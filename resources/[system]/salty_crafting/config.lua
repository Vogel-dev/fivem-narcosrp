Config = {}

Config.WeaponAmmo = 42

Config.Recipes = {
	["kokaina_pooch_high"] = { 
		{item = "kokaina_pooch_medium", quantity = 2 }, 
	},

	["kokaina_pooch_high"] = { 
		{item = "kokaina_pooch_low", quantity = 4 }, 
	},

	["kokaina_pooch_medium"] = { 
		{item = "kokaina_pooch_low", quantity = 2 }, 
	},
	
	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "steel", quantity = 4 }, 
		{item = "gunpowder", quantity = 2},
	}
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = false,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = true,
	keyCode = 56
}
