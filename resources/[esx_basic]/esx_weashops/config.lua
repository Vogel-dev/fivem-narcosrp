Config                			= {}
Config.DrawDistance   			= 100
Config.Size           			= { x = 1.5, y = 1.5, z = 1.5 }
Config.Color          			= {r = 200, g = 100, b = 100}
Config.Type           			= 1
Config.Locale = 'pl'
Config.EnableLicense  			= true
Config.LicensePrice   			= 1000
Config.EnableClipGunShop		= true
Config.EnableClipBlackWeashop	= true

Config.EnableClip = {
	GunShop = {
		Price = 2500,
		Label = "Magazynek"	
	},
	BlackWeashop = {
		Price = 1000,
		Label = "Magazynek"	
	}
}

Config.Zones = {

    GunShop = {
        legal = 0,
        Items = {},
        Pos   = {
            { x = -1095.21,   y = 811.13,   z = 13.62 },
            { x = 317.85,   y = 151.42,   z = 10.19 },
            { x = 1303.31,   y = 586.7,   z = 33.25 },
        }
    },

    BlackWeashop = {
        legal = 1,
        Items = {},
        Pos   = {
            { x = -162.53,   y = -1636.16,  z = 35.95 },
        }
    },

}
