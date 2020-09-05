Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},	

	-- To locker room & roof

	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Mosley's	
	{
		objHash = GetHashKey('mosley_garage_1'), --East Bay Garage Door
		objHeading = 140.00346374512,
		objCoords = vector3(-18.49977, -1674.182, 28.75392),
		textCoords = vector3(-18.49977, -1674.182, 0.75392),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 8.75
	},

	{
		objHash = GetHashKey('mosley_garage_1'), --North Bay Garage Door
		objHeading = 22.389287948608,
		objCoords = vector3(1.02154, -1675.23, 28.71855),
		textCoords = vector3(1.02154, -1675.23, 0.71855),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 8.75
	},

	{
		objHash = GetHashKey('nutt_mosley_backdoor1'), --North 3x5 door
		objHeading = 22.688411712646,
		objCoords = vector3(5.52079, -1673.308, 29.63902),
		textCoords = vector3(5.52079, -1673.308, 0.63902),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},

	{
		objHash = GetHashKey('nutt_mosley_officedoor'), --South office door
		objHeading = 49.609992980957,
		objCoords = vector3(-35.49297, -1666.214, 29.63059),
		textCoords = vector3(-35.49297, -1666.214, 0.63059),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},

	{
		objHash = GetHashKey('nutt_mosley_officedoor'), --West office door
		objHeading = 140.09057617188,
		objCoords = vector3(-22.66462, -1658.06, 29.61856),
		textCoords = vector3(-22.66462, -1658.06, 0.61856),
		authorizedJobs = {'cardealer'},
		locked = true,
		maxDistance = 1.75
	},

	{
		objHash = GetHashKey('nutt_mos_sr_garage_door'), --South Glass Bay door
		objHeading = 49.999977111816,
		objCoords = vector3(-30.91102, -1647.468, 28.56115),
		textCoords = vector3(-30.91102, -1647.468, 0.56115),
		authorizedJobs = {'cardealer'},
		locked = true,
		maxDistance = 8.75
	},

	{
		objHash = GetHashKey('nutt_mos_sr_garage_door'), --West Glass Bay door
		objHeading = 320.0,
		objCoords = vector3(-11.17308, -1646.961, 28.54418),
		textCoords = vector3(-11.17308, -1646.961, 0.54418),
		authorizedJobs = {'cardealer'},
		locked = true,
		maxDistance = 8.75
	},

	{
		objHash = GetHashKey('nutt_gate_1'), --West Fenced Sliding gate
		objHeading = 230.0,
		objCoords = vector3(-52.81902, -1673.778, 28.32462),
		textCoords = vector3(-52.81902, -1673.778, 0.32462),
		authorizedJobs = {'cardealer'},
		locked = true,
		maxDistance = 8.75
	},

	{
		objHash = GetHashKey('nutt_gate_2'), --West Fenced Sliding gate
		objHeading = 23.395977020264,
		objCoords = vector3(-37.37502, -1690.811, 28.30982),
		textCoords = vector3(-37.37502, -1690.811, 0.30982),
		authorizedJobs = {'cardealer'},
		locked = true,
		maxDistance = 8.75
	},
							
	-- V Taco's	
	{
		objHash = GetHashKey('taco_drzwi'),
		objHeading = 319.,
		objCoords = vector3(19.5267, -1599.981, 29.52338),
		textCoords = vector3(19.5267, -1599.981, 25.52338),
		authorizedJobs = {'vtaco'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = GetHashKey('taco_drzwi'),
		objHeading = 49.728401184082,
		objCoords = vector3(20.34999, -1603.969, 29.52338),
		textCoords = vector3(20.34999, -1603.969, 25.52338),
		authorizedJobs = {'vtaco'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = GetHashKey('taco_drzwi'),
		objHeading = 319.99096679688,
		objCoords = vector3(13.55205, -1605.699, 29.52338),
		textCoords = vector3(13.55205, -1605.699, 25.52338),
		authorizedJobs = {'vtaco'},
		locked = true,
		maxDistance = 1.25
	},
	
	{
		objHash = GetHashKey('taco_drzwi'),
		objHeading = 49.40015411377,
		objCoords = vector3(9.332205, -1599.938, 29.52338),
		textCoords = vector3(9.332205, -1599.938, 25.52338),
		authorizedJobs = {'vtaco'},
		locked = true,
		maxDistance = 1.25
	},
	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
	
	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

		-- Arc Angel
		--		Front Door
		{
			objHash = GetHashKey('v_ilev_mm_doorm_r'),
			objHeading = 290.0,
			objCoords = vector3(-816.168, 177.5109, 72.82738),
			textCoords = vector3(-816.168, 177.5109, 72.82738),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},
		--		Front Door2
		{
			objHash = GetHashKey('v_ilev_mm_doorm_l'),
			objHeading = 292.0,
			objCoords = vector3(-816.716, 179.098, 72.82738),
			textCoords = vector3(-816.716, 179.098, 72.82738),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},		
		--		Backdoor		
		{
			objHash = GetHashKey('prop_bh1_48_backdoor_r'),
			objHeading = 20.0,
			objCoords = vector3(-794.5051, 178.0124, 73.04045),
			textCoords = vector3(-794.5051, 178.0124, 73.04045),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},
		--		Backdoor2
		{
			objHash = GetHashKey('prop_bh1_48_backdoor_l'),
			objHeading = 22.0,
			objCoords = vector3(-796.5657, 177.2214, 73.04045),
			textCoords = vector3(-796.5657, 177.2214, 73.04045),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},		
		--		Backdoor3		
		{
			objHash = GetHashKey('prop_bh1_48_backdoor_r'),
			objHeading = 110.0,
			objCoords = vector3(-794.1853, 182.568, 73.04045),
			textCoords = vector3(-794.1853, 182.568, 73.04045),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},
		--		Backdoor4
		{
			objHash = GetHashKey('prop_bh1_48_backdoor_l'),
			objHeading = 112.0,
			objCoords = vector3(-793.3943, 180.5075, 73.04045),
			textCoords = vector3(-793.3943, 180.5075, 73.04045),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 1.25
		},
		--		Garage Roll up door
		{
			objHash = GetHashKey('prop_ld_garaged_01'),
			objHeading = 290.99432373047,
			objCoords = vector3(-815.2882, 185.9724, 73.03026),
			textCoords = vector3(-815.2882, 185.9724, 73.03026),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 09.50
		},
		--		Rolling gate front
		{
			objHash = GetHashKey('prop_lrggate_02_ld'),
			objHeading = 90.0,
			objCoords = vector3(-844.051, 155.9599, 66.02869),
			textCoords = vector3(-844.051, 155.9599, 66.02869),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 09.50
		},		
		--		Front Small gate
		{
			objHash = GetHashKey('prop_bh1_48_gate_1'),
			objHeading = 260.81433105469,
			objCoords = vector3(-848.9343, 179.3079, 70.0247),
			textCoords = vector3(-848.9343, 179.3079, 70.0247),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 01.25
		},
		--		Bedroom
		{
			objHash = GetHashKey('v_ilev_mm_doordaughter'),
			objHeading = 201.25755310059,
			objCoords = vector3(-802.7017, 176.1755, 76.89033),
			textCoords = vector3(-802.7017, 176.1755, 76.89033),
			authorizedJobs = {'ambulance'},
			locked = true,
			maxDistance = 01.25
		},		

		--		PDM
		{
			objHash = GetHashKey('v_ilev_fib_door1'),
			objHeading = 69.92985534668,
			objCoords = vector3(-31.72353, -1101.847, 26.57225),
			textCoords = vector3(-31.72353, -1101.847, 26.57225),
			authorizedJobs = {'cardealer'},
			locked = true,
			maxDistance = 01.25
		},
		--		Bennys
		{
			objHash = GetHashKey('hei_prop_station_gate'),
			objHeading = 90.499992370605,
			objCoords = vector3(-244.0589, -1302.753, 30.30171),
			textCoords = vector3(-244.0589, -1302.753, 30.30171),
			authorizedJobs = {'mechanic'},
			locked = true,
			maxDistance = 09.50
		},				
		--		Russian-Gunsmith
		{
			objHash = GetHashKey('prop_facgate_04_r'),
			objHeading = 265.52157592773,
			objCoords = vector3(794.8403, -2129.118, 29.99923),
			textCoords = vector3(794.8403, -2129.118, 29.99923),
			authorizedJobs = {'mechanicb'},
			locked = true,
			maxDistance = 09.50
		},

		{
			objHash = GetHashKey('prop_facgate_04_l'),
			objHeading = 264.27212524414,
			objCoords = vector3(795.7695, -2118.498, 29.99923),
			textCoords = vector3(795.7695, -2118.498, 29.99923),
			authorizedJobs = {'mechanicb'},
			locked = true,
			maxDistance = 09.50
		},	

		{
			objHash = GetHashKey('v_ilev_gc_door04'),
			objHeading = 360.0,
			objCoords = vector3(813.1779, -2148.27, 29.76892),
			textCoords = vector3(813.1779, -2148.27, 29.76892),
			authorizedJobs = {'mechanicb'},
			locked = true,
			maxDistance = 01.50
		},

		{
			objHash = GetHashKey('v_ilev_gc_door03'),
			objHeading = 179.99998474121,
			objCoords = vector3(810.5769, -2148.27, 29.76892),
			textCoords = vector3(810.5769, -2148.27, 29.76892),
			authorizedJobs = {'mechanicb'},
			locked = true,
			maxDistance = 01.50
		},
		--		Nighclub
		{
			objHash = GetHashKey('hei_heist_apart2_door'),
			objHeading = 267.27178955078,
			objCoords = vector3(-777.976, 322.9964, 212.147),
			textCoords = vector3(-777.976, 323.9964, 1.147),
			authorizedJobs = {'club'},
			locked = true,
			maxDistance = 01.50
		},				

		{
			objHash = GetHashKey('hei_heist_apart2_door'),
			objHeading = 269.99243164063,
			objCoords = vector3(-767.7999, 330.2081, 211.5462),
			textCoords = vector3(-767.7999, 330.2081, 1.5462),
			authorizedJobs = {'club'},
			locked = true,
			maxDistance = 01.50
		},

	--Prison
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1773.49, 2570.045, 46.07394),
		textCoords = vector3(1773.49, 2570.045, 40.07394),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 270.0,
		objCoords = vector3(1835.713, 2588.593, 46.03847),
		textCoords = vector3(1835.713, 2588.593, 42.03847),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('prop_fnclink_03gate5'),
		objHeading = 179.9965057373,
		objCoords = vector3(1798.09, 2591.687, 46.41784),
		textCoords = vector3(798.09, 2591.687, 40.41784),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
		
	{
		objHash = GetHashKey('prop_fnclink_03gate5'),
		objHeading = 180.0,
		objCoords = vector3(1797.761, 2596.565, 46.38731),
		textCoords = vector3(1797.761, 2596.565, 46.38731),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},
		
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 359.79824829102,
		objCoords = vector3(1831.894, 2592.079, 46.03739),
		textCoords = vector3(1831.894, 2592.079, 30.03739),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},		
			
		-- HH
		{
			objHash = GetHashKey('xm_prop_iaa_base_door_01'),
			objHeading = 180.0,
			objCoords = vector3(-2667.36, 1330.48, 147.44),
			textCoords = vector3(-2667.36, 1330.48, 147.44),
			authorizedJobs = {'hellhounds'},
			locked = true,
			maxDistance = 1.25
		},

		{
			objHash = GetHashKey('apa_p_mp_yacht_door_01'),
			objHeading = 90.0,
			objCoords = vector3(-2667.96, 1326.08, 147.44),
			textCoords = vector3(-2667.96, 1326.08, 147.44),
			authorizedJobs = {'hellhounds'},
			locked = true,
			maxDistance = 1.25
		},

		-- FW
		{
			objHash = GetHashKey('v_ilev_roc_door3'),
			objHeading = 95.0,
			objCoords = vector3(948.7757, -964.4454, 39.89674),
			textCoords = vector3(948.7757, -964.4454, 39.89674),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},	

		{
			objHash = GetHashKey('v_ilev_roc_door2'),
			objHeading = 182.0,
			objCoords = vector3(955.6113, -971.5325, 39.90111),
			textCoords = vector3(955.6113, -971.5325, 39.90111),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},

		{
			objHash = GetHashKey('v_ilev_spraydoor'),
			objHeading = 182.0,
			objCoords = vector3(1365.764, -713.4797, 67.85941),
			textCoords = vector3(1365.764, -713.4797, 67.85941),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},	
		
		{
			objHash = GetHashKey('v_ilev_gc_door03'),
			objHeading = 180.0,
			objCoords = vector3(842.7685, -1024.539, 28.34478),
			textCoords = vector3(842.7685, -1024.539, 28.34478),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},

		{
			objHash = GetHashKey('v_ilev_gc_door04'),
			objHeading = 360.0,
			objCoords = vector3(845.3694, -1024.539, 28.34478),
			textCoords = vector3(845.3694, -1024.539, 28.34478),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},

		{
			objHash = GetHashKey('v_ilev_bl_shutter2'),
			objHeading = 324.99993896484,
			objCoords = vector3(3620.843, 3751.527, 27.69208),
			textCoords = vector3(3620.843, 3751.527, 27.69208),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 9.25
		},
		
		{
			objHash = GetHashKey('v_ilev_bl_shutter2'),
			objHeading = 324.99993896484,
			objCoords = vector3(3627.713, 3746.716, 27.69009),
			textCoords = vector3(3627.713, 3746.716, 27.69009),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 9.25
		},
		
		{
			objHash = GetHashKey('hei_v_ilev_fh_heistdoor2'),
			objHeading = 297.44692993164,
			objCoords = vector3(-913.2027, -366.3348, 109.5541),
			textCoords = vector3(-913.2027, -366.3348, 109.5541),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},
		
		{
			objHash = GetHashKey('v_ilev_garageliftdoor'),
			objHeading = 27.446914672852,
			objCoords = vector3(-908.466, -371.608, 108.4368),
			textCoords = vector3(-908.466, -371.608, 109.4368),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 3.75
		},
		
		{
			objHash = GetHashKey('v_ilev_garageliftdoor'),
			objHeading = 207.44692993164,
			objCoords = vector3(-907.1304, -370.9166, 108.4368),
			textCoords = vector3(-907.1304, -370.9166, 109.4368),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 3.75
		},						
		
	-- WeedStore	
		{
			objHash = GetHashKey('v_ilev_fib_door3'),
			objHeading = 180.00003051758,
			objCoords = vector3(381.4216, -825.1628, 29.45322),
			textCoords = vector3(381.4216, -825.1628, 29.45322),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},
	
		{
			objHash = GetHashKey('v_ilev_cd_door3'),
			objHeading = 180.04678344727,
			objCoords = vector3(375.8304, -821.0286, 29.44885),
			textCoords = vector3(375.8304, -821.0286, 29.44885),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},
	
		{
			objHash = GetHashKey('v_ilev_cd_door3'),
			objHeading = 89.96378326416,
			objCoords = vector3(376.8353, -817.5457, 29.44885),
			textCoords = vector3(376.8353, -817.5457, 29.44885),
			authorizedJobs = {'society'},
			locked = true,
			maxDistance = 1.25
		},				
		
	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},
	-- MafiaRanch	
	{
		objHash = GetHashKey('v_ilev_ra_door1_l'),
		objHeading = 90.1982421875,
		objCoords = vector3(1409.292, 1144.054, 114.4869),
		textCoords = vector3(1409.292, 1145.254, 113.4869),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},

	{
		objHash = GetHashKey('v_ilev_ra_door1_r'),
		objHeading = 89.971549987793,
		objCoords = vector3(1409.292, 1146.254, 114.4869),
		textCoords = vector3(1409.292, 1145.254, 113.4869),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},

	{
		objHash = GetHashKey('v_ilev_ra_door1_l'),
		objHeading = 89.90055847168,
		objCoords = vector3(1409.292, 1146.254, 113.4869),
		textCoords = vector3(1409.292, 1146.254, 113.4869),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 0.50
	},
	
	{
		objHash = GetHashKey('v_ilev_ra_door1_r'),
		objHeading = 90.041976928711,
		objCoords = vector3(1409.292, 1148.454, 113.4869),
		textCoords = vector3(1409.292, 1148.454, 113.4869),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 0.50
	},
	
	{
		objHash = GetHashKey('v_ilev_ra_door1_l'),
		objHeading = 89.87718963623,
		objCoords = vector3(1409.292, 1148.454, 114.4869),
		textCoords = vector3(1409.292, 1149.654, 113.4869),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},
	
	{
		objHash = GetHashKey('v_ilev_ra_door1_r'),
		objHeading = 90.207611083984,
		objCoords = vector3(1409.292, 1150.654, 114.4869),
		textCoords = vector3(1409.292, 1149.654, 113.4869),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.75
	},
		
	{
		objHash = GetHashKey('v_ilev_ra_door1_r'),
		objHeading = 180.13838195801,
		objCoords = vector3(1398.289, 1128.314, 114.4836),
		textCoords = vector3(1399.289, 1128.314, 113.4836),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.25
	},
			
	{
		objHash = GetHashKey('v_ilev_ra_door1_l'),
		objHeading = 179.76622009277,
		objCoords = vector3(1400.489, 1128.314, 114.4836),
		textCoords = vector3(1399.289, 1128.314, 113.4836),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.25
	},
				
	{
		objHash = GetHashKey('v_ilev_ra_door1_r'),
		objHeading = 179.77252197266,
		objCoords = vector3(1400.488, 1128.314, 114.4836),
		textCoords = vector3(1401.488, 1128.314, 113.4836),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 0.50
	},
					
	{
		objHash = GetHashKey('v_ilev_ra_door1_l'),
		objHeading = 179.85919189453,
		objCoords = vector3(1402.688, 1128.314, 114.4836),
		textCoords = vector3(1401.488, 1128.314, 113.4836),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 0.50
	},
					
	{
		objHash = GetHashKey('v_ilev_ra_door4l'),
		objHeading = 270.17602539063,
		objCoords = vector3(1395.92, 1142.904, 114.7902),
		textCoords = vector3(1395.92, 1141.904, 113.7902),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 0.50
	},
					
	{
		objHash = GetHashKey('v_ilev_ra_door4r'),
		objHeading = 89.987258911133,
		objCoords = vector3(1395.92, 1140.705, 114.7902),
		textCoords = vector3(1395.92, 1141.904, 113.7902),
		authorizedJobs = {'society'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

		-- Prison
		{
			objHash = GetHashKey('v_ilev_ph_cellgate'),
			objHeading = 90.0,
			objCoords = vector3(1778.6, 2568.32, 45.92),
			textCoords = vector3(461.8, -993.3, 25.0),
			authorizedJobs = {'police'},
			locked = true,
			maxDistance = 2.25
		},

		-- Prison2
		{
			objHash = GetHashKey('v_ilev_ph_cellgate'),
			objHeading = 90.0,
			objCoords = vector3(1791.68, 2593.48, 45.8),
			textCoords = vector3(461.8, -993.3, 25.0),
			authorizedJobs = {'police'},
			locked = true,
			maxDistance = 2.25
		},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	}
},

---- Vespucci ------
{
	-- Entry Doors
	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1090.73, y = -809.11, z = 19.37},
		textCoords = {x = -1090.73, y = -809.11, z = 19.37},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1091.82, y = -809.96, z = 19.37},
		textCoords = {x = -1091.82, y = -809.96, z = 19.37},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1093.08, y = -810.99, z = 19.37},
		textCoords = {x = -1093.08, y = -810.99, z = 19.37},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1094.04, y = -811.62, z = 19.38},
		textCoords ={x = -1094.04, y = -811.62, z = 19.38},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1111.59, y = -848.48, z = 13.48},
		textCoords = {x = -1111.59, y = -848.48, z = 13.48},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1112.34, y = -847.49, z = 13.48},
		textCoords = {x = -1112.34, y = -847.49, z = 13.48},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1062.18, y = -827.17, z = 19.42},
		textCoords = {x = -1062.18, y = -827.17, z = 19.42},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1061.3, y = -828.33, z = 19.42},
		textCoords = {x = -1061.3, y = -828.33, z = 19.42},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1108.71, y = -842.41, z = 19.33},
		textCoords = {x = -1108.38, y = -842.59, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1107.65, y = -843.66, z = 19.33},
		textCoords = {x = -1107.65, y = -843.66, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1106.65, y = -844.97, z = 19.33},
		textCoords = {x = -1106.65, y = -844.97, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1105.99, y = -845.86, z = 19.33},
		textCoords = {x = -1105.99, y = -845.86, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1111.1, y = -824.85, z = 19.33},
		textCoords = {x = -1111.1, y = -824.85, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'vesp_glav_door',
		objCoords  = {x = -1112.24, y = -825.68, z = 19.33},
		textCoords = {x = -1112.24, y = -825.68, z = 19.33},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	-- Cells

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1072.98, y = -826.92, z = 5.48},
		textCoords = {x = -1072.98, y = -826.92, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1086.3, y = -827.3, z = 5.48},
		textCoords = {x = -1086.3, y = -827.3, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1089.33, y = -829.69, z = 5.48},
		textCoords = {x = -1089.33, y = -829.69, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1091.75, y = -826.35, z = 5.48},
		textCoords = {x = -1091.75, y = -826.35, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1088.67, y = -824.09, z = 5.48},
		textCoords = {x = -1088.67, y = -824.09, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1091.2, y = -820.97, z = 5.48},
		textCoords = {x = -1091.2, y = -820.97, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1094.11, y = -823.18, z = 5.48},
		textCoords = {x = -1094.11, y = -823.18, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1096.44, y = -820.11, z = 5.48},
		textCoords = {x = -1096.44, y = -820.11, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = -1087.04, y = -829.39, z = 5.48},
		textCoords = {x = -1087.04, y = -829.39, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Doors

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1092.92, y = -817.88, z = 5.48},
		textCoords = {x = -1092.92, y = -817.88, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1093.73, y = -816.76, z = 5.48},
		textCoords = {x = -1093.73, y = -816.76, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1078.04, y = -814.11, z = 5.48},
		textCoords = {x = -1078.04, y = -814.11, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1081.78, y = -816.79, z = 5.48},
		textCoords = {x = -1081.78, y = -816.79, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1075.08, y = -822.82, z = 5.48},
		textCoords = {x = -1075.08, y = -822.82, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1074.07, y = -822.02, z = 5.48},
		textCoords = {x = -1074.07, y = -822.02, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1091.98, y = -834.41, z = 5.48},
		textCoords = {x = -1091.98, y = -834.41, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},
	
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1091.19, y = -835.52, z = 5.48},
		textCoords = {x = -1091.19, y = -835.52, z = 5.48},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1089.98, y = -848.16, z = 4.88},
		textCoords = {x = -1089.98, y = -848.16, z = 4.88},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1090.67, y = -847.21, z = 4.88},
		textCoords = {x = -1090.67, y = -847.21, z = 4.88},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1057.18, y = -839.44, z = 5.14},
		textCoords = {x = -1057.18, y = -839.44, z = 5.14},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1058.25, y = -840.17, z = 5.14},
		textCoords = {x = -1058.25, y = -840.17, z = 5.14},
		authorizedJobs = { 'police' },
		locked = true
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = -1108.12, y = -842.08, z = 13.68},
		textCoords = {x = -1108.12, y = -842.08, z = 13.68},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Office Doors

	{
		objName = 'vesp_door1',
			objCoords  = {x = -1094.47, y = -844.87, z = 19.0},
			textCoords = {x = -1094.47, y = -844.87, z = 19.0},
			authorizedJobs = { 'police' },
			locked = true
	},

	{
		objName = 'vesp_door1',
			objCoords  = {x = -1094.99, y = -844.11, z = 19.0},
			textCoords = {x = -1094.99, y = -844.11, z = 19.0},
			authorizedJobs = { 'police' },
			locked = true
	},
	
	-- Hospital Wing

	{
		objName = 'v_ilev_cor_doorglassa',
			objCoords  = {x = 331.690, y = -1420.44, z = 32.6},
			textCoords = {x = 331.690, y = -1420.44, z = 32.6},
			authorizedJobs = { 'ambulance' },
			locked = true
	},

	{
		objName = 'v_ilev_cor_doorglassb',
			objCoords  = {x = 330.48, y = -1419.921, z = 32.6},
			textCoords = {x = 330.48, y = -1419.921, z = 32.6},
			authorizedJobs = { 'ambulance' },
			locked = true
	},

	{
		objName = 'v_ilev_fb_doorshortl',
			objCoords  = {x = 358.138, y = -1397.626, z = 32.6},
			textCoords = {x = 358.138, y = -1397.626, z = 32.6},
			authorizedJobs = { 'ambulance' },
			locked = true
	},

	{
		objName = 'v_ilev_fb_doorshortr',
			objCoords  = {x = 357.080, y = -1396.648, z = 32.6},
			textCoords = {x = 357.080, y = -1396.648, z = 32.6},
			authorizedJobs = { 'ambulance' },
			locked = true
	},

	{
		objName = 'v_ilev_gendoor02',
			objCoords  = {x = 376.134, y = -1425.530, z = 32.6},
			textCoords = {x = 376.134, y = -1425.530, z = 32.6},
			authorizedJobs = { 'ambulance' },
			locked = true
	},
	-- custom ward locks	
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(261.99899291992, 221.50576782227, 106.68346405029),
		textCoords = vector3(261.99899291992, 221.50576782227, 107.68346405029),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},		

}