Config = {}

Config.Locale = "en" --en, tw

-- The unit is milliseconds
Config.SpawnWaitMin = 10000
Config.SpawnWaitMax = 30000

Config.DigTime = 5000

Config.Digs = {
	{
		-- If you want to use random item please follow this example:
		--digItem = {{"clam", 1, "蛤蠣"}, {"stone", 1, "石頭"}, ...},
		
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -2165.57, y = -462.55, z = 2.38, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -2104.4, y = -497.32, z = 3.64, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -2049.2, y = -570.6, z = 4.8, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -1982.0, y = -659.04, z = 3.32, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -1890.12, y = -777.88, z = 3.24, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -1814.0, y = -882.44, z = 3.24, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{	
		digItem = {{"plastic", 1, "plastic"}, {"glassbottle", 1, "glassbottle"}, ...}, needTool = "shovel", toolLabel = "shovel",
		x = -1723.68, y = -1018.12, z = 4.2, areaRange = 9, maxSpawn = 15, markerColor = {255, 179, 102},
		breakToolPercent = 1, blips = false, blipName = "Beach Cleanup"
	},

	{
		digItem = {{"emptybrass", 3, "emptybrass"}, {"gunpowder", 3, "gunpowder"}, ...}, needTool = "shovel", toolLabel = "shovel",		
		x = 2604.84, y = 4440.52, z = 40.31, areaRange = 35, maxSpawn = 30, markerColor = {255, 140, 26}, 
		breakToolPercent = 1, blips = true, blipName = "Old Battle Fields"
	},

	{
		digItem = {{"quarterwater", 1, "quarterwater"}}, needTool = "plastic", toolLabel = "plastic",	
		x = -477.0, y = 2909.48, z = 13.24, areaRange = 15, maxSpawn = 30, markerColor = {255, 140, 26}, 
		breakToolPercent = 1, blips = true, blipName = "Fresh Water Creek"
	},	

	{
		digItem = {{"zinc", 1, "zinc"}}, needTool = "shovel", toolLabel = "shovel",
		x = 2037.7, y = 4907.65, z = 41.86, areaRange = 35, maxSpawn = 30, markerColor = {0, 255, 0},
		breakToolPercent = 1, blips = true, blipName = "Zinc Fields"
	},
	
	{
		digItem = {{"cotton", 1, "cotton"}}, needTool = "gloves", toolLabel = "gloves",
		x = 2235.42, y = 5077.58, z = 47.78, areaRange = 35, maxSpawn = 30, markerColor = {255, 255, 255},  
		breakToolPercent = 1, blips = true, blipName = "Cotton Fields"
	}	
}