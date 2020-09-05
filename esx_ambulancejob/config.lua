Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 400  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(341.0, -1397.3, 32.5), heading = 48.5 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(310.12, -568.28, 43.28),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(270.5, -1363.0, 23.5)
		},

		Pharmacies = {
			vector3(310.12, -568.28, 43.28)
		},

		Vehicles = {
			{
				Spawner = vector3(311.28, -594.36, 43.28),
				InsideShop = vector3(-1655.28, -3165.28, 14.0),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(319.72, -552.76, 28.76), heading = 227.6, radius = 4.0 },
					{ coords = vector3(327.76, -543.44, 28.76), heading = 227.6, radius = 4.0 },
					{ coords = vector3(332.24, -554.84, 28.76), heading = 227.6, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.12, -593.76, 74.16),
				InsideShop = vector3(-1647.68, -3143.84, 14.0),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(349.72, -594.76, 74.16), heading = 142.7, radius = 10.0 },
					{ coords = vector3(351.52, -582.8, 74.16), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Rig', price = 10},
		{ model = 'ambulance2', label = 'Rig2', price = 10},
		{ model = 'emscar', label = 'EMS Car', price = 10},
		{ model = 'emscar2', label = 'EMS Car2', price = 10},
		{ model = 'emssuv', label = 'EMS SUV', price = 10},	
		{ model = 'emsvan', label = 'EMS Van', price = 10}	
	},

	doctor = {
		{ model = 'ambulance', label = 'Rig', price = 10},
		{ model = 'ambulance2', label = 'Rig2', price = 10},
		{ model = 'emscar', label = 'EMS Car', price = 10},
		{ model = 'emscar2', label = 'EMS Car2', price = 10},
		{ model = 'emssuv', label = 'EMS SUV', price = 10},	
		{ model = 'emsvan', label = 'EMS Van', price = 10}	
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Rig', price = 10},
		{ model = 'lspdcharger18', label = '2018 Charger', price = 10},
		{ model = 'ambulance2', label = 'Rig2', price = 10},
		{ model = 'emscar', label = 'EMS Car', price = 10},
		{ model = 'emscar2', label = 'EMS Car2', price = 10},
		{ model = 'emssuv', label = 'EMS SUV', price = 10},	
		{ model = 'emsvan', label = 'EMS Van', price = 10}	
	},

	boss = {
		{ model = 'ambulance', label = 'Rig', price = 10},
		{ model = 'lspdcharger18', label = '2018 Charger', price = 10},
		{ model = 'ambulance2', label = 'Rig2', price = 10},
		{ model = 'emscar', label = 'EMS Car', price = 10},
		{ model = 'emscar2', label = 'EMS Car2', price = 10},
		{ model = 'emssuv', label = 'EMS SUV', price = 10},	
		{ model = 'emsvan', label = 'EMS Van', price = 10}							
	}
	
}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10 },
		{ model = 'Maverick', label = 'Maverick', price = 10 },		
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 10 }
	},

	chief_doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10 },
		{ model = 'Maverick', label = 'Maverick', price = 10 },		
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 10 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10 },
		{ model = 'Maverick', label = 'Maverick', price = 10 },		
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 10 }
	}

}
