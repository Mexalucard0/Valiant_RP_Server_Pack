Config                            = {}

Config.DrawDistance               = 7.5
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 0, g = 255, b = 0 }

Config.EnablePlayerManagement     = true

Config.Locale                     = 'en'
Config.GangName 				  = 'vtaco'
Config.BossGradeName 			  = 'boss'
Config.SocietyName				  = 'society_Vtaco'
Config.GradeLvl					  = 0 --

Config.Clubs = {

	BM = {

		Blip = {
			Coords  = vector3(8.56,-1604.28,29.36),
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
			vector3(20.12, -1602.0, 28.38)
		},

		BossActions = {
			vector3(8.28, -1607.4, 29.36)
		},

	}

}

Config.Uniforms = {
	Washer_outfit = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 56,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 63,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 61,   ['shoes_2'] = 4,
			['chain_1'] = 0,  ['chain_2'] = 0
		}
	}
}