local ESX

cachedData = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

RegisterServerEvent("Societyweed-blackmarket:globalEvent")
AddEventHandler("Societyweed-blackmarket:globalEvent", function(options)
	ESX.Trace((options["event"] or "none") .. " triggered to all clients.")

	if options["data"]["saveData"] then
		cachedData["stockLeft"] = options["data"]["stockLeft"]
	end
	
    TriggerClientEvent("Societyweed-blackmarket:eventHandler", -1, options["event"] or "none", options["data"]["stockLeft"] or nil)
end)

ESX.RegisterServerCallback("Societyweed-blackmarket:purchaseItem", function(source, cb, data)
	
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

ESX.RegisterServerCallback("Societyweed-blackmarket:fetchStock", function(source, cb)
	if cachedData["stockLeft"] then
		cb(cachedData["stockLeft"])
	else
		cb(false)
	end
end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('bulletproof', 1)

	TriggerClientEvent('Societyweed-blackmarket:bpvest', source)
end)
