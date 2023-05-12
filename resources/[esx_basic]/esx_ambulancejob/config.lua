Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 200, g = 100, b = 100 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.ReviveReward               = 100  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale = 'pl'

local second = 1000
local minute = 60 * second

-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 10 * minute

Config.EnablePlayerManagement       = true
Config.EnableSocietyOwnedVehicles   = false

Config.RemoveWeaponsAfterRPDeath    = true
Config.RemoveCashAfterRPDeath       = true
Config.RemoveItemsAfterRPDeath      = true

-- Will display a timer that shows RespawnDelayAfterRPDeath as a countdown
Config.ShowDeathTimer               = true

-- Will allow respawn after half of RespawnDelayAfterRPDeath has elapsed.
Config.EarlyRespawn                 = true
-- The player will be fined for respawning early (on bank account)
Config.EarlyRespawnFine                  = true
Config.EarlyRespawnFineAmount            = 3000

Config.Blip = {
	Pos     = { x = 49.771278381348, y = -64.288299560547, z = 4.9391069412231-1 },
	Sprite  = 61,
	Display = 4,
	Scale   = 1.0,
	Colour  = 12,
}
Config.HelicopterSpawner = {
	SpawnPoint = { x = 35100.63, y = -58700.98, z = 7300.17 },
	Heading    = 335.1
}
-- https://wiki.fivem.net/wiki/Vehicles
Config.AuthorizedVehicles = {
	{
		model = 'ambulance',
		label = 'Ambulans'
	},
	{
		model = 'sheriff2',
		label = 'Dodge RAM'
	},
	{
		model = 'safta',
		label = 'Suv'
	}
}
Config.Zones = {
	HospitalInteriorEntering1 = { -- Main entrance
		Pos	= { x = 311118.84, y = -573.47, z = 42.5 },
		Type = 1
	},
	HospitalInteriorInside1 = {
		Pos	= { x = 49.771278381348, y = -64.288299560547, z = 4.9391069412231-1 },
		Type = -1
	},
	HospitalInteriorOutside1 = {
		Pos	= { x = 3111120.59, y = -574.12, z = 42.5 },
		Type = -1
	},
	HospitalInteriorExit1 = {
		Pos	= { x = 211154.43, y = -1372.64, z = 23.5 },
		Type = 1
	},
	HospitalInteriorEntering2 = { -- Lift go to the roof
	Pos	= { x = 351.63, y = -587.98, z = 73.17 },
		Type = 1
	},
	HospitalInteriorInside2 = { -- Roof outlet
		Pos	= { x = 34000.92,	y = -584.65, z = 73.5 },
		Type = -1
	},
	HospitalInteriorOutside2 = { -- Lift back from roof
		Pos	= { x = 242342349.1,	y = -1369.6, z = 23.5 },
		Type = -1
	},
	HospitalInteriorExit2 = { -- Roof entrance
		Pos	= { x = 312344123312435.5, y = -1432.0, z = 45.5 },
		Type = 1
	},
	AmbulanceActions = { -- Cloakroom
		Pos	= { x = 309.55, y = -602.86, z = 42.29 },
		Type = 1
	},
	VehicleSpawner = {
		Pos	= { x = 295.49, y = -591.15, z = 42.25 },
		Type = 1
	},
	VehicleSpawnPoint = {
		Pos	= { x = 290.54, y = -589.95, z = 42.29 },
		Type = -1
	},
	VehicleDeleter = {
		Pos	= { x = 291.0, y = -613.07, z = 42.4 },
		Pos	= { x = 291.0, y = -613.07, z = 42.4 },
		Type = 1
	},
	Pharmacy = {
		Pos	= { x = 305.35, y = -598.23, z = 42.29 },
		Type = 1
	},
	ParkingDoorGoOutInside = {
		Pos	= { x = 212334.56, y = -1373.77, z = 20.97 },
		Type = 1
	},
	ParkingDoorGoOutOutside = {
		Pos	= { x = 321230.98, y = -1478.62, z = 28.81 },
		Type = -1
	},
	ParkingDoorGoInInside = {
		Pos	= { x = 231238.64, y = -1368.48, z = 23.53 },
		Type = -1
	},
	ParkingDoorGoInOutside = {
		Pos	= { x = 311237.97, y = -1476.13, z = 28.97 },
		Type = 1
	},
	StairsGoTopTop = {
		Pos	= { x = 25111.91, y = -1363.3, z = 38.53 },
		Type = -1
	},
	StairsGoTopBottom = {
		Pos	= { x = 23117.45, y = -1373.89, z = 26.30 },
		Type = -1
	},
	StairsGoBottomTop = {
		Pos	= { x = 25116.58, y = -1357.7, z = 37.30 },
		Type = -1
	},
	StairsGoBottomBottom = {
		Pos	= { x = 21135.45, y = -1372.89, z = 26.30 },
		Type = -1
	}
}
