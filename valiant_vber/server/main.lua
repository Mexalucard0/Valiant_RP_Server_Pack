ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vber', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vber', _U('vber_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'vber', 'vber', 'society_vber', 'society_vber', 'society_vber', {type = 'public'})

RegisterServerEvent('valiant_vber:success')
AddEventHandler('valiant_vber:success', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'vber' then
		print(('valiant_vber: %s attempted to trigger success!'):format(xPlayer.identifier))
		return
	end

	math.randomseed(os.time())

	local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max)
	local societyAccount

	if xPlayer.job.grade >= 3 then
		total = total * 2
	end

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vber', function(account)
		societyAccount = account
	end)

	if societyAccount then
		local playerMoney  = ESX.Math.Round(total / 100 * 30)
		local societyMoney = ESX.Math.Round(total / 100 * 70)

		xPlayer.addMoney(playerMoney)
		societyAccount.addMoney(societyMoney)

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned', societyMoney, playerMoney))
	else
		xPlayer.addMoney(total)
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned', total))
	end

end)

RegisterServerEvent('valiant_vber:getStockItem')
AddEventHandler('valiant_vber:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'vber' then
		print(('valiant_vber: %s attempted to trigger getStockItem!'):format(xPlayer.identifier))
		return
	end
	
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vber', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('valiant_vber:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vber', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('valiant_vber:putStockItems')
AddEventHandler('valiant_vber:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'vber' then
		print(('valiant_vber: %s attempted to trigger putStockItems!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vber', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)

end)

ESX.RegisterServerCallback('valiant_vber:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)
