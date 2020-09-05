ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Oxy Run
RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= Config.StartOxyPayment then
		xPlayer.removeMoney(Config.StartOxyPayment)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('notification', xPlayer, 'You don\'t have enough money to start an oxy run', 2)
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addInventoryItem(Config.BigRewarditem, 1)
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addMoney(Config.Payment / 2)
	xPlayer.addInventoryItem(Config.Item, Config.OxyAmount)
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addMoney(Config.Payment)
end)