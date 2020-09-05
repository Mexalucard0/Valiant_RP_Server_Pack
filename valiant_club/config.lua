Config                            = {}

Config.DrawDistance               = 7.5
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 0, g = 255, b = 0 }

Config.EnablePlayerManagement     = true

Config.Locale                     = 'en'
Config.GangName 				  = 'Club'
Config.BossGradeName 			  = 'boss'
Config.SocietyName				  = 'society_Club'
Config.GradeLvl					  = 0 --

Config.Clubs = {

	BM = {

		Blip = {
			Coords  = vector3(-1387.72,-588.92,30.32),
			Sprite  = 93,
			Display = 4,
			Scale   =  .75,
			Colour  = 48
		},

		Cloakrooms = {
			--vector3(1009.01,-3170.49,-38.89)
			vector3(1009.01,-3170.49,-180.00)
		},

		Vaults = {
			vector3(1393.79, 1146.17, 114.33)
		},

		BossActions = {
			vector3(1393.05, 1134.61, 114.33)
		},

	}

}

Config.Uniforms = {
	barman_outfit = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 40,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 28,   ['pants_2'] = 2,
			['shoes_1'] = 38,   ['shoes_2'] = 4,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 8,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 44,   ['pants_2'] = 4,
			['shoes_1'] = 0,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 2
		}
	},
	dancer_outfit_1 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 61,   ['pants_2'] = 9,
			['shoes_1'] = 16,   ['shoes_2'] = 9,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 22,   ['pants_2'] = 0,
			['shoes_1'] = 18,   ['shoes_2'] = 0,
			['chain_1'] = 61,   ['chain_2'] = 1
		}
	},
	dancer_outfit_2 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 62,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 4,    ['pants_2'] = 0,
			['shoes_1'] = 34,   ['shoes_2'] = 0,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 20,   ['pants_2'] = 2,
			['shoes_1'] = 18,   ['shoes_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
	dancer_outfit_3 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 4,    ['pants_2'] = 0,
			['shoes_1'] = 34,   ['shoes_2'] = 0,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 22,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 19,   ['pants_2'] = 1,
			['shoes_1'] = 19,   ['shoes_2'] = 3,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
	dancer_outfit_4 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 61,   ['pants_2'] = 5,
			['shoes_1'] = 34,   ['shoes_2'] = 0,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 82,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 63,   ['pants_2'] = 11,
			['shoes_1'] = 41,   ['shoes_2'] = 11,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
	dancer_outfit_5 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 21,   ['pants_2'] = 0,
			['shoes_1'] = 34,   ['shoes_2'] = 0,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 63,   ['pants_2'] = 2,
			['shoes_1'] = 41,   ['shoes_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
	dancer_outfit_6 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 81,   ['pants_2'] = 0,
			['shoes_1'] = 34,   ['shoes_2'] = 0,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 63,   ['pants_2'] = 10,
			['shoes_1'] = 41,   ['shoes_2'] = 10,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
	dancer_outfit_7 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 15,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 40,
			['pants_1'] = 61,   ['pants_2'] = 9,
			['shoes_1'] = 16,   ['shoes_2'] = 9,
			['chain_1'] = 118,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 111,  ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 63,   ['pants_2'] = 6,
			['shoes_1'] = 41,   ['shoes_2'] = 6,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	}
}