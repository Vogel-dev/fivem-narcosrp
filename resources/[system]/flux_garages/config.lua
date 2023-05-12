Config                      = {}
Config.DrawDistance         = 50.0
Config.MarkerType           = 1
Config.MarkerSize           = {x = 3.5, y = 3.5, z = 0.5}
Config.MarkerColor          = {r = 200, g = 100, b = 100}
Config.MinimumHealth 		= 850.0
Config.ImpoundPrice			= 500
Config.MaxSubs				= 2

Config.Locale = 'pl'

Config.Garages = {
	-- BLIP
	{
		Marker  = vector3(1994.64, 893.21, 24.44),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-253.93, 1290.39, 8.68),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-235.71, 936.36, 9.05),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-101.44, 707.57, 13.75),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(331.19, 1542.85, 13.56),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-35.45, -103.59, 3.79),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-1382.01, 1317.24, 28.73),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(1154.5694580078,1093.7237548828,21.328458786011),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(705.67749023438,2229.3544921875,14.804809570313),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(1491.228515625,2207.0676269531,15.669849395752),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(707.60565185547,694.81036376953,7.746524810791),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-178.94622802734,424.2844543457,10.178815841675),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(332.18069458008,161.23611450195,13.610766410828),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(1362.4195556641,93.530784606934,18.685403823853-1),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-838.11529541016,-88.332275390625,2.8471429347992-1),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-69.942817687988,2044.4499511719,20.264841079712-1),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(-760.80358886719,1908.5491943359,25.684967041016-1),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vector3(377.4280090332,1088.9205322266,14.564374923706-1),
		Blip	= true,
		Visible = {}
	},
	-- NO BLIP
	{
		Marker 	= vector3(-243.55088806152,2020.7225341797,18.711753845215-1), -- Manhattan - West Harlem
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(1208.9979248047,164.64245605469,19.23642539978-1), -- Brooklyn - Dyker Heights
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(1392.470703125,386.1103515625,35.767211914063-1), -- Brooklyn - Borough Park
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(-73.895401000977,1686.3358154297,15.045446395874-1), -- Manhattan - Harlem
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(344.23132324219,1160.2543945313,14.621237754822-1), -- Manhattan - Lenox Hill
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(241.58143615723,-206.38032531738,9.4002742767334-1), -- Manhattan - Lower Manhattan
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(-1060.4377441406,1575.8405761719,19.414211273193-1), -- New Jersey - The Heights
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(-1319.0290527344,867.61572265625,23.356670379639-1), -- New Jersey - Greenville
		Blip	= false,
		Visible = {}
	},
	{
		Marker  = vector3(1906.7751464844,1098.5032958984,29.233871459961-1), -- Queens - Richmond Hill
		Blip	= false,
		Visible = {}
	},
	-- JOBS
	{
		Marker  = vector3(912.27, -952.84, 38.6),
		Blip	= false,
		Visible = {'mecano', 'offmecano'}
	},
}

Config.Impound = {
	vector3(855.95,1962.30,10.91),
	--vector3(241.61, -792.85, 30.47)
}

Config.PoliceImpound = {
	vector3(485.35, -1096.99, 28.3)
	--vector3(244.35, -790.37, 30.48)
}

Config.SetSubowner = {
	vector3(-531.76, -192.48, 37.32)
	--vector3(245.78, -786.33, 30.52)
}