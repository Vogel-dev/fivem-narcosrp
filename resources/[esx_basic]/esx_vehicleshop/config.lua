Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = {r = 200, g = 100, b = 100}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50

Config.Locale = 'pl'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = {x = 318.29507446289, y = 1295.2044677734, z = 15.159297943115-1},
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1
	},

	ShopInside = {
		Pos     = {x = 310.65664672852, y = 1298.2579345703, z = 15.159308433533-1},
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 15.0,
		Type    = -1
	},

	ShopOutside = {
		Pos     = {x = 323.82708740234, y = 1245.9584960938, z = 14.6790599823-1},
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 180.0,
		Type    = -1
	},

	BossActions = {
		Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = { x = 321.77209472656, y = 1278.5080566406, z = 20.156648635864-1 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 1
	}

}
