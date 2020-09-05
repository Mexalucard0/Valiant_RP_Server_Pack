ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('valiant_club:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items   = xPlayer.inventory

	cb( { items = items, blackMoney = blackMoney } )
end)

ESX.RegisterServerCallback('valiant_club:getSocietyMoney', function(source, cb)
	TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
		cb(account.money)
	end)
end)

RegisterServerEvent('valiant_club:getStockItem')
AddEventHandler('valiant_club:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', Config.SocietyName, function(inventory)

	local item = inventory.getItem(itemName)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	if item.count >= count then
		if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			return
		else
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		end
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
	end

	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('valiant_club:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', Config.SocietyName, function(inventory)
	cb(inventory.items)
	end)

end)

RegisterServerEvent('valiant_club:putStockItems')
AddEventHandler('valiant_club:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', Config.SocietyName, function(inventory)

	local item = inventory.getItem(itemName)
	local playerItemCount = xPlayer.getInventoryItem(itemName).count

	if item.count >= 0 and count <= playerItemCount then
		xPlayer.removeInventoryItem(itemName, count)
		inventory.addItem(itemName, count)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
	end

	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('valiant_club:getVaultWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', Config.SocietyName, function(store)

			local weapons = store.get('weapons')

			if weapons == nil then
				weapons = {}
			end

			cb(weapons)

	end)

end)

ESX.RegisterServerCallback('valiant_club:addVaultWeapon', function(source, cb, weaponName, weaponAmmo)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeWeapon(weaponName)

	TriggerEvent('esx_datastore:getSharedDataStore', Config.SocietyName, function(store)

			local weapons = store.get('weapons')

			if weapons == nil then
				weapons = {}
			end

			local foundWeapon = false

			for i=1, #weapons, 1 do
				if weapons[i].name == weaponName then
					weapons[i].count = weapons[i].count + 1
					foundWeapon = true
				end
			end

			if not foundWeapon then
				table.insert(weapons, {
					name  = weaponName,
					ammo = weaponAmmo,
					count = 1
				})
			end

			store.set('weapons', weapons)

			cb()

	end)

end)

ESX.RegisterServerCallback('valiant_club:removeVaultWeapon', function(source, cb, weaponName, weaponAmmo)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, weaponAmmo)

	TriggerEvent('esx_datastore:getSharedDataStore', Config.SocietyName, function(store)

			local weapons = store.get('weapons')

			if weapons == nil then
				weapons = {}
			end

			local foundWeapon = false

			for i=1, #weapons, 1 do
				if weapons[i].name == weaponName then
					weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
					foundWeapon = true
				end
			end

			if not foundWeapon then
				table.insert(weapons, {
					name  = weaponName,
					ammo = weaponAmmo,
					count = 0
				})
			end

			store.set('weapons', weapons)

			cb()

	end)

end)

RegisterServerEvent('valiant_club:addVaultMoney')
AddEventHandler('valiant_club:addVaultMoney', function(item, count)

	local xPlayer = ESX.GetPlayerFromId(source)
	local playerAccountMoney = xPlayer.getAccount(item).money

	if playerAccountMoney >= count and count > 0 then

		TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
			xPlayer.removeAccountMoney(item, count)
			account.addMoney(count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', ESX.Math.GroupDigits(count)))
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('invalid_amount'))
	end

end)

RegisterServerEvent('valiant_club:getVaultMoney')
AddEventHandler('valiant_club:getVaultMoney', function(accountName, count)

	local xPlayer = ESX.GetPlayerFromId(source)
	count = ESX.Math.Round(tonumber(count))

	TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
		if count > 0 and account.money >= count then
			account.removeMoney(count)
			xPlayer.addAccountMoney(accountName, count)

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', ESX.Math.GroupDigits(count)))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end)

end)