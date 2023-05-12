Config              = {}
Config.DrawDistance = 50.0
Config.CopsRequired = 0
Config.BlipUpdateTime = 300000 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 15
Config.Locale = 'en'

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = 1552.6596679688, y = 316.21789550781, z = 25.133007049561-1},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Colour    = 6, --BLIP
		Id        = 431, --BLIP
	},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = 1562.5650634766, y = 311.51077270508, z = 24.373586654663-1},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	-- New Jersey
	Delivery1 = {
		Pos      = {x = -1376.5911865234, y = 1210.6097412109, z = 27.356693267822-1},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Payment  = 18000,
		Cars = {'contgt13','911turbos','bmwm8','lp580','m3f80'},
	},
	-- Bronx
	Delivery4 = {
		Pos      = {x = 748.67950439453, y = 1913.3111572266, z = 10.881966590881-1},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Payment  = 20000,
		Cars = {'contgt13','911turbos','bmwm8','lp580','m3f80'},
	},
	-- Bronx
	Delivery7 = {
		Pos      = {x = 1032.3553466797, y = 1932.9244384766, z = 14.248230934143-1},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Payment  = 25000,
		Cars = {'contgt13','911turbos','bmwm8','lp580','m3f80'},
	},
	-- New Jersey
	Delivery10 = {
		Pos      = {x = -1504.2159423828, y = 824.71160888672, z = 25.444213867188-1},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Payment  = 19500,
		Cars = {'contgt13','911turbos','bmwm8','lp580','m3f80'},
	},
	-- New Jersey
	Delivery13 = {
		Pos      = {x = -829.88037109375, y = 1696.1195068359, z = 16.717447280884-1},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 200, g = 100, b = 100},
		Type  = 1,
		Payment  = 16000,
		Cars = {'contgt13','911turbos','bmwm8','lp580','m3f80'},
	},
}
