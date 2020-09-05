ESX = nil

cachedData = {
	["stockLeft"] = {}
}

Citizen.CreateThread(function()
	
	while not ESX do

		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end

	if ESX.IsPlayerLoaded() then

		Wait(500)

		FetchStock()

	end

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData

	Wait(500)

	FetchStock()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

RegisterNetEvent("arcangel-blackmarket:eventHandler")
AddEventHandler("arcangel-blackmarket:eventHandler", function(response, eventData)
	if response == "cacheStock" then
		cachedData["stockLeft"] = eventData
		print("save?")
	else	
 		print("Wrong event handler: " .. response)
	end
end)

RegisterCommand("armor", function()
	SetPedArmour(PlayerPedId(), 0)
end)

RegisterNetEvent("arcangel-blackmarket:bpvest")
AddEventHandler("arcangel-blackmarket:bpvest", function()
	cachedData["bpvest"] = true
	SetPedArmour(PlayerPedId(), 100)

	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothes = {
			['bproof_1'] = 12,
			['bproof_2'] = 0
		}

		TriggerEvent('skinchanger:loadClothes', skin, clothes)
	end)

	Citizen.CreateThread(function()
		while cachedData["bpvest"] do

			Wait(500)
			if GetPedArmour(PlayerPedId()) <= 0 then

				cachedData["bpvest"] = false
				
			end
		end

		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothes = {
				['bproof_1'] = 0,
				['bproof_2'] = 0
			}
	
			TriggerEvent('skinchanger:loadClothes', skin, clothes)
		end)
	
	end)
end)

Citizen.CreateThread(function()

	Wait(100)
	
	while true do 

		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = #(pedCoords - Config.Location)

		if dstCheck <= Config.DisplayMarkerDistance then

			sleepThread = 5

			if dstCheck <= 1.2 then

				if IsControlJustReleased(0, 38) then

					OpenBuyMenu()

				end
				
				ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to open shop.")

			end

			DrawScriptMarker({
				["type"] = 6,
				["pos"] = Config.Location - vector3(0.0, 0.0, 0.975),
				["r"] = 55,
				["g"] = 100,
				["b"] = 200,
				["sizeX"] = 0.8,
				["sizeY"] = 0.8,
				["sizeZ"] = 0.8,
			})
		end
		Citizen.Wait(sleepThread)
	end
end)