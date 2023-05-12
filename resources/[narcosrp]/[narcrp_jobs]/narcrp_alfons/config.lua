Config                            = {}

Config.DrawDistance               = 100

Config.NPCJobEarnings             = {min = 300, max = 600}
Config.MinimumDistance            = 100 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.Locale                     = 'pl'

Config.AuthorizedVehicles = {
	{model = 'e34touring', label = 'BMW E34 M5 Touring'}
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 729.05944824219, y = 674.11791992188, z = 8.6694030761719},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 36, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = 735.06311035156, y = 668.86871337891, z = 8.5980854034424},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 180.0
	},

	VehicleDeleter = {
		Pos   = {x = 728.52294921875, y = 667.58422851563, z = 8.6817188262939-1},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 0, g = 150, b = 50},
		Type  = 1, Rotate = false
	},

	AlfonsActions = {
		Pos   = {x = 73900.92376708984, y = 66500.60583496094, z = 8.6139917373657},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 20, Rotate = true
	},

	Cloakroom = {
		Pos     = {x = 743.03558349609, y = 678.37347412109, z = 8.6779680252075},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 200, g = 100, b = 100},
		Type    = 21, Rotate = true
	}
}

Config.JobLocations = {
	vector3(-160.01686096191,885.07629394531,14.012596130371),
	vector3(1014.7177124023,-52.120986938477,9.4822607040405),
	vector3(4.7781376838684,130.24058532715,14.113414764404),
	vector3(3.4409177303314,528.05310058594,14.708475112915),
	vector3(272.49649047852,1474.2381591797,14.546144485474),
	vector3(71.454521179199,1108.8831787109,14.815008163452),
	vector3(-1356.3753662109,519.08142089844,10.099461555481),
	vector3(-184.09425354004,1982.6784667969,18.861440658569),
	vector3(1452.0131835938,2205.8928222656,16.518920898438),
	vector3(-224.36419677734,647.12854003906,9.8592653274536)
}
