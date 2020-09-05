--Resource created for: ValiantCRP discord https://discord.gg/cNps4Uf
--Wollffus

--ESX INIT--

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--EVENTS--

RegisterServerEvent('taco:pourboire') --Pay on delivery of a taco + possible tip
AddEventHandler('taco:pourboire', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(pourboire)
end)

RegisterServerEvent("taco:paiefinale") --"Bonus" pay at the end of service
AddEventHandler("taco:paiefinale", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local flouzefin = math.random(10, 100)

	xPlayer.addMoney(flouzefin)

	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Voici votre petit bonus final : " .. flouzefin .. "$",
		type = "success",
		queue = "global",
		timeout = 4000,
		layout = "bottomRight"
	})
end)

RegisterServerEvent("taco:itemadd") --Temporary addition of the item "taco"
AddEventHandler("taco:itemadd", function(nbtaco)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem('taco', tonumber(nbtaco))
end)

RegisterServerEvent("taco:itemrm") --Rm of item "taco"
AddEventHandler("taco:itemrm", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('taco', 1)
end)

RegisterServerEvent("taco:deleteAllPizz") --i%bH7yR4WHHG "taco"
AddEventHandler("taco:deleteAllPizz", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	local taconbr = xPlayer.getInventoryItem('taco').count
	
	xPlayer.removeInventoryItem('taco', taconbr)
end)
