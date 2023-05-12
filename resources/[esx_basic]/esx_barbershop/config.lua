Config = {}

Config.Price = 45

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 200, g = 100, b = 100}
Config.MarkerType   = 1

Config.Locale = 'pl'

Config.Zones = {}

Config.Shops = {
	{x = 1137.5928955078, y = 792.32208251953, z = 30.401243209839-1},  -- brooklyn
	{x = -652.19677734375, y = 1550.3078613281, z = 20.62791633606-1},  -- nj
	{x = 389.43240356445, y = -59.013828277588, z = 14.800810813904-1}, -- manhattan
	{x = -196.88441467285, y = 866.15692138672, z = 10.203999519348-1}, -- manhattan
	{x = 1218.6776123047, y = 310.52041625977, z = 24.121160507202-1},   -- brooklyn
	{x = 46.399406433105, y = 1900.8881835938, z = 20.415731430054-1}   -- manhattan
}

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Shops[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
