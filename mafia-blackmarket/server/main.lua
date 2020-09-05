local ESX

cachedData = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent("mafia-blackmarket:globalEvent")
AddEventHandler("mafia-blackmarket:globalEvent", function(options)
	ESX.Trace((options["event"] or "none") .. " triggered to all clients.")

	if options["data"]["saveData"] then
		cachedData["stockLeft"] = options["data"]["stockLeft"]
	end
	
    TriggerClientEvent("mafia-blackmarket:eventHandler", -1, options["event"] or "none", options["data"]["stockLeft"] or nil)
end)

ESX.RegisterServerCallback("mafia-blackmarket:purchaseItem", function(source, cb, data)
	
	local player = ESX.GetPlayerFromId(source)
	local money = player.getMoney()

	if player then

		if money >= data["itemPrice"] then

			if data["sellableType"] then

				player.addInventoryItem(data["item"], 1)
				
				cb(true)

			else

				player.addWeapon(data["item"], 250)
				
				cb(true)
				
			end

			player.removeMoney(data["itemPrice"])

		else
			cb(false)
		end

	else

		cb(false)

	end		

end)

ESX.RegisterServerCallback("mafia-blackmarket:fetchStock", function(source, cb)
	if cachedData["stockLeft"] then
		cb(cachedData["stockLeft"])
	else
		cb(false)
	end
end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('bulletproof', 1)

	TriggerClientEvent('mafia-blackmarket:bpvest', source)
end)
