Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 244, g = 5, b = 244 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableFreemodePeds         = false  -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 30 * 60000 -- 30 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'pl'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Pos     = { x = 425.130, y = -979.558, z = 30.711 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 15,
		},
		-- https://wiki.rage.mp/index.php?title=Weapons
		    
			AuthorizedWeapons = {
			{ name = 'WEAPON_STUNGUN',          price = 0 },
			{ name = 'WEAPON_FLASHLIGHT',       price = 0 },
			{ name = 'WEAPON_NIGHTSTICK',       price = 0 },
			{ name = 'WEAPON_POOLCUE',       price = 0 },
			{ name = 'WEAPON_COMBATPISTOL',     price = 6500 },
			{ name = 'WEAPON_HEAVYPISTOL',     price = 9500 },
			{ name = 'WEAPON_PISTOL',       price = 5000 },
			{ name = 'WEAPON_PUMPSHOTGUN',     price = 33000 },
			{ name = 'WEAPON_CARBINERIFLE',       price = 50000 },
			{ name = 'WEAPON_MOLOTOV',     price = 100 },
			{ name = 'WEAPON_FLARE',     price = 100 },
		},

		Cloakrooms = {
			{ x = 456.58, y = -988.79, z = 29.69 },
		},

		Armories = {
			{ x = 460.36, y = -981.06, z = 29.69 },
		},

		Vehicles = {
			{
				Spawner    = { x = 462.98, y = -1019.3, z = 27.1 },
				SpawnPoint = { x = 440.89, y = -1021.62, z = 27.59 },
				Heading    = 91.6,
			}
		},
		Helicopters = {
			{
				Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
				SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
				Heading    = 0.0,
			}
		},

		VehicleDeleters = {
			{ x = 454.28, y = -1022.68, z = 27.42 },
		},

		BossActions = {
			{ x = 456.57, y = -971.1, z = 25.67 }
		},

	},

}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {
	},
	recruit = {
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		}
	},
	officer1 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		}
	},
	officer2 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		}
	},
	officer3 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		}
	},
	sergeant1 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	sergeant2 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	sergeant3 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
		{
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	lieutenant1 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'suburban',
			label = 'Suburban UM'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	lieutenant2 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'chgr',
			label = 'Dodge Charger 2011 UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	lieutenant3 = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
				{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'chgr',
			label = 'Dodge Charger 2011 UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'unmarked8',
			label = 'Chevrolet Tahoe UM'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	kapitan = {
        {
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
				{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'chgr',
			label = 'Dodge Charger 2011 UM'
		},
		{
			model = 'gtr',
			label = 'Nissan GTR-35 UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	zboss = {
        {
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'chgr',
			label = 'Dodge Charger 2011 UM'
		},
		{
			model = 'gtr',
			label = 'Nissan GTR-35 UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},
	boss = {
		{
			model = 'police',
			label = 'Ford Crown LSPD'
		},
		{
			model = 'police2',
			label = 'Dodge Charger LSPD'
		},
		{
			model = 'police3',
			label = 'Ford Taurus LSPD'
		},
		{
			model = '17raptorpd',
			label = 'Ford Raptor LSPD'
		},
		{
			model = 'policeold1',
			label = 'Chevrolet Tahoe LSPD'
		},
	    {
			model = '1200RT',
			label = 'BMW 1200RT LSPD'
		},
		{
			model = 'scorcher',
			label = 'Rower LSPD'
		},
		{
			model = 'lspdvant',
			label = 'Van LSPD'
		},
		{
			model = 'policet',
			label = 'Van2 LSPD'
		},
				{
			model = 'riot',
			label = 'Opancerzony LSPD'
		},
		{
			model = 'pbus',
			label = 'Bus LSPD'
		},
		{
			model = 'taxi2',
			label = 'Declasse Vapid TAXI UM'
		},
	    {
			model = 'suburban',
			label = 'Chevrolet Suburban UM'
		},
		{
			model = '16fpiu',
			label = 'Ford Explorer UM'
		},
		{
			model = '11cvpi',
			label = 'Ford Crown Victoria UM'
		},
		{
			model = 'chgr',
			label = 'Dodge Charger 2011 UM'
		},
		{
			model = 'gtr',
			label = 'Nissan GTR-35 UM'
		},
		{
			model = 'bearcat',
			label = 'Bearcat SWAT'
		},
		{
			model = 'lspdtru',
			label = 'Granger SWAT'
		},
		{
			model = 'lambolapd',
			label = 'Lamborghini Gallardo'
		}
	},

}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 24,   ['pants_2'] = 2,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 24,   ['pants_2'] = 2,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 19,
			['pants_1'] = 4,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 60,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 30,
			['pants_1'] = 4,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 58,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}