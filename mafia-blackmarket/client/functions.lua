GlobalFunction = function(event, data)
    local options = {
        event = event,
        data = data
    }

    TriggerServerEvent("pluto-blackmarket:globalEvent", options)
end

OpenBuyMenu = function()
	local menuElements = {}

	for itemId, itemData in ipairs(Config.SellableItems) do
		table.insert(menuElements, {
			["label"] = itemData["label"].. " - $" ..itemData["price"].." | "..cachedData["stockLeft"][itemId].." left",
			["realLabel"] = itemData["label"],
			["itemPrice"] = itemData["price"],
			["itemId"] = itemId,
			["item"] = itemData["item"],
			["sellableType"] = itemData["isItem"],
			["amountLeft"] = cachedData["stockLeft"][itemId],
			["action"] = "buy"
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craft_menu',
	{
		["title"]    = 'Craft Menu',
		["align"]    = 'center',
		["elements"] = menuElements,
	},
	function(menuData, menuHandle)
		if menuData["current"]["action"] == "buy" then
			if menuData["current"]["amountLeft"] > 0 then
				ESX.TriggerServerCallback("pluto-blackmarket:purchaseItem", function(purchased)
					DrawAutoSpinner("Proccesing payment...")

					if purchased then
						cachedData["stockLeft"][menuData["current"]["itemId"]] = cachedData["stockLeft"][menuData["current"]["itemId"]] - 1
						DrawAutoSpinner("Purchase successful.", 2500)
						GlobalFunction("cacheStock", {
							["saveData"] = true,
							["stockLeft"] = cachedData["stockLeft"]
						})
					else

						DrawAutoSpinner("Payment failed, please try again.")

					end
				end, menuData["current"])
			else
				ESX.ShowNotification("There are no " ..menuData["current"]["realLabel"] .." left")
			end
			menuHandle.close()
		end
	end,
	function(menuData, menuHandle)
		menuHandle.close()
	end)
end

FetchStock = function()
	ESX.TriggerServerCallback("pluto-blackmarket:fetchStock", function(data)
		if data then
			cachedData["stockLeft"] = data
		else
			for itemId, itemData in ipairs(Config.SellableItems) do

				cachedData["stockLeft"][itemId] = itemData["amount"]
				print("inserted " ..itemId.."-"..itemData["amount"])
			end
		end
	end)
end

DrawBusySpinner = function(text)
	SetLoadingPromptTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	ShowLoadingPrompt(3)
end

DrawAutoSpinner = function(text, timeout)
	if not text then return end
	 
	DrawBusySpinner(text)

	Citizen.Wait(timeout or 2500)

	RemoveLoadingPrompt()
end

DrawScriptMarker = function(markerData)
	DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0, (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0, markerData["sizeX"] or 1.0, markerData["sizeY"] or 1.0, markerData["sizeZ"] or 1.0, markerData["r"] or 1.0, markerData["g"] or 1.0, markerData["b"] or 1.0, 100, markerData["bob"] and true or false, true, 2, false, false, false, false)
end