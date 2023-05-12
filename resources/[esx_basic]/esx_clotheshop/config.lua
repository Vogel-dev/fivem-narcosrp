Config = {}
Config.Locale = 'pl'

Config.Price = 100

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor  = {r = 200, g = 100, b = 100}
Config.MarkerType   = 1

Config.Zones = {}

Config.Shops = {
	{x=1118.51, y=53.7, z=14.85},
	{x=248.12, y=-175.22, z=13.86},
	{x=261.89, y=1295.06, z=13.76},
	{x=-47.2, y=1858.3,  z=24.6}
}

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Shops[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
