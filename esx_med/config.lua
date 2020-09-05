Config = {}
Config.Locale = 'en'

Config.Price = 5000

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.5}
Config.MarkerColor  = {r = 230, g = 22, b = 22}
Config.MarkerType   = 27

Config.Zones = {}

Config.Hosp = {
	{x = -258.76, y = 6308.76, z = 32.2},
}

for i=1, #Config.Hosp, 1 do
	Config.Zones['Private Doc_' .. i] = {
		Pos   = Config.Hosp[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
