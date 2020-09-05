local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local PlayerData = {}
local HasAlreadyEnteredMarker,isInShopMenu = false, false
local LastStation, LastPart, LastPartNum, CurrentAction, CurrentActionMsg
ESX = nil
_OutfitsLoaded = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.name == Config.GangName then
			_IsJobGang = true
		else
			_IsJobGang = false
		end
	end
end)

function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == Config.BossGradeName then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end

function OpenVaultMenu()


	local elements = {
		{label = _U('get_weapon'), value = 'get_weapon'},
		{label = _U('put_weapon'), value = 'put_weapon'},
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'},
		{label = 'Store Money',    value = 'put_money'},
		{label = 'Get Money',      value = 'get_money'},
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'vault',
	{
		title    = _U('vault'),
		align    = 'bottom-right',
		elements = elements,
	},
	function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		end

		if data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		end

		if data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		end

		if data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		end

		if data.current.value == 'put_money' then
			OpenPutMoneyMenu()
		end

		if data.current.value == 'get_money' then
			OpenGetMoneyMenu()
		end

	end,

	function(data, menu)

		menu.close()

		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end
	)

end

function OpenGetMoneyMenu()

	ESX.TriggerServerCallback('frenzy_mafia:getSocietyMoney', function(money)

		local elements = {}

		if money == nil then
			return
		end
		table.insert(elements, {
			label = 'Dirty Money $'..ESX.Math.GroupDigits(money),
			type = 'item_account',
			value = 'black_money'
		})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'money_menu',
		{
			title    = Config.GangName .. ' money',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_money_count',
			{
				title = _U('quantity')
			},
			function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					OpenGetMoneyMenu()

					TriggerServerEvent('frenzy_mafia:getVaultMoney', itemName, count)
				end

			end,
			function(data2, menu2)
				menu2.close()
			end
			)

		end,
		function(data, menu)
			menu.close()
		end
		)

	end)

end

function OpenPutMoneyMenu()

	ESX.TriggerServerCallback('frenzy_mafia:getPlayerInventory', function(inventory)
		local elements = {}
		local playerPed  = GetPlayerPed(-1)

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = 'Dirty Money $'..ESX.Math.GroupDigits(inventory.blackMoney),
				type = 'item_account',
				value = 'black_money'
			})
		end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_put_money',
		{
			title    = _U('put_money_menu'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
			local itemName = data.current.value
			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'stocks_menu_put_money_count',
				{
					title = _U('quantity')
				},
				function(data2, menu2)
				local count = tonumber(data2.value)
				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					OpenPutMoneyMenu()
					TriggerServerEvent('frenzy_mafia:addVaultMoney', itemName, count)
				end
				end,
				function(data2, menu2)
				menu2.close()
				end
			)
			end,
			function(data, menu)
			menu.close()
			end
		)
	end)
end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('frenzy_mafia:getVaultWeapons', function(weapons)

		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name) ..' '..weapons[i].ammo ..'x', value = weapons[i].name, ammo = weapons[i].ammo})
			end
		end

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_get_weapon',
		{
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			menu.close()

			ESX.TriggerServerCallback('frenzy_mafia:removeVaultWeapon', function()
			OpenGetWeaponMenu()
			end, data.current.value, data.current.ammo)

		end,
		function(data, menu)
			menu.close()
		end
		)

	end)

end

function OpenPutWeaponMenu()

	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do

		local weaponHash = GetHashKey(weaponList[i].name)
		local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)

		if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name, ammo = ammo})
		end

	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_put_weapon',
		{
			title    = _U('put_weapon_menu'),
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
		local weaponName =  data.current.value
		local weaponAmmo =  data.current.ammo
		menu.close()

		ESX.TriggerServerCallback('frenzy_mafia:addVaultWeapon', function()
			OpenPutWeaponMenu()
		end, weaponName, weaponAmmo)

		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenGetStocksMenu()

	ESX.TriggerServerCallback('frenzy_mafia:getStockItems', function(items)

		local elements = {}

		for i=1, #items, 1 do
			if items[i].count > 0 then
				table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
			end
		end

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = Config.GangName .. ' stock',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open(
			'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
			{
				title = _U('quantity')
			},
			function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
				ESX.ShowNotification(_U('invalid_quantity'))
				else
				menu2.close()
				menu.close()
				OpenGetStocksMenu()

				TriggerServerEvent('frenzy_mafia:getStockItem', itemName, count)
				end

			end,
			function(data2, menu2)
				menu2.close()
			end
			)

		end,
		function(data, menu)
			menu.close()
		end
		)

	end)

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('frenzy_mafia:getPlayerInventory', function(inventory)

		local elements = {}

		for i=1, #inventory.items, 1 do

			local item = inventory.items[i]

			if item.count > 0 then
			table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
			end

		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'stocks_menu',
			{
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements
			},
			function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
				{
				title = _U('quantity')
				},
				function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					OpenPutStocksMenu()

					TriggerServerEvent('frenzy_mafia:putStockItems', itemName, count)
				end

				end,
				function(data2, menu2)
				menu2.close()
				end
			)

			end,
			function(data, menu)
			menu.close()
			end
		)

	end)

end

AddEventHandler('frenzy_mafia:hasEnteredMarker', function(territory, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	elseif part == 'Vaults' then
        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {}
    end
end)

AddEventHandler('frenzy_mafia:hasExitedMarker', function(territory, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Create blips
-- Citizen.CreateThread(function()

-- 	for k,v in pairs(Config.Clubs) do
-- 		local blip = AddBlipForCoord(v.Blip.Coords)

-- 		SetBlipSprite (blip, v.Blip.Sprite)
-- 		SetBlipDisplay(blip, v.Blip.Display)
-- 		SetBlipScale  (blip, v.Blip.Scale)
-- 		SetBlipColour (blip, v.Blip.Colour)
-- 		SetBlipAsShortRange(blip, true)

-- 		BeginTextCommandSetBlipName('STRING')
-- 		AddTextComponentString(_U('map_blip'))
-- 		EndTextCommandSetBlipName(blip)
-- 	end

-- end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job and PlayerData.job.name == Config.GangName and PlayerData.job.grade > Config.GradeLvl then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentTerritory, currentPart, currentPartNum

			for k,v in pairs(Config.Clubs) do

				for i=1, #v.Cloakrooms, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentTerritory, currentPart, currentPartNum = true, k, 'Cloakroom', i
					end
				end

				for i=1, #v.Vaults, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Vaults[i], true)

					if distance < Config.DrawDistance then
						DrawMarker(27, v.Vaults[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.MarkerSize.x then
						isInMarker, currentTerritory, currentPart, currentPartNum = true, k, 'Vaults', i
					end
				end

				if Config.EnablePlayerManagement and PlayerData.job.grade_name == Config.BossGradeName then
					for i=1, #v.BossActions, 1 do
						local distance = GetDistanceBetweenCoords(coords, v.BossActions[i], true)

						if distance < Config.DrawDistance then
							DrawMarker(22, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
							letSleep = false
						end

						if distance < Config.MarkerSize.x then
							isInMarker, currentTerritory, currentPart, currentPartNum = true, k, 'BossActions', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentTerritory or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentTerritory or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('frenzy_mafia:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentTerritory
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('frenzy_mafia:hasEnteredMarker', currentTerritory, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('frenzy_mafia:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end

		else
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and PlayerData.job and PlayerData.job.name == Config.GangName and PlayerData.job.grade > Config.GradeLvl then

				if CurrentAction == 'menu_vault' then
					OpenVaultMenu()
				elseif CurrentAction == 'menu_boss_actions' and IsGradeBoss() then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', Config.GangName, function(data, menu)
						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false, withdraw = false, deposit = false, grades = false })
				end

				CurrentAction = nil
			end
		end -- CurrentAction end

	end
end)
