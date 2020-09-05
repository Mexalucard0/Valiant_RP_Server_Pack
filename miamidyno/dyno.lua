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

ESX = nil

Citizen.CreateThread(function()
        while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(0)
        end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

                        if CanDyno() then
                        for k, v in pairs(Config.Locations) do
                        if Vdist2(GetEntityCoords(PlayerPedId()), v) < 1.5 then
                                ESX.ShowHelpNotification(Config.Locale['press_e'])
                        end

                                if Vdist2(GetEntityCoords(PlayerPedId()), v) < 1.5 then
                                        if IsControlJustPressed(1, 38) then
                                                local pedVehicle = GetVehiclePedIsIn(ped)
                                                --local test2 = GetModSlotName(pedVehicle, 11)
                                                --ESX.ShowNotification(test2)
                                                ESX.ShowHelpNotification(Config.Locale['hold_burn'])
                                                CarDynoTime(Config.Locale['dyno'])
                                                Citizen.Wait(10000)
                                                local ped = GetPlayerPed(-1)
                                                local pedVehicle = GetVehiclePedIsIn(ped)
                                                local vehiclemodel = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                            local currentMods = ESX.Game.GetVehicleProperties(pedVehicle)
                            local RPM = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                                local eng = currentMods.modEngine
                                                local trns = currentMods.modTransmission
                                                local turb = currentMods.modTurbo

                                                if IsPedInAnyVehicle(ped) then
                                                  if RPM > 0.6 and RPM < 1.2 and Vdist2(GetEntityCoords(PlayerPedId()), v) < 1.5 and IsVehicleInBurnout(pedVehicle) then
                                                          Citizen.Wait(0)
                                                          else
                                                          ESX.ShowHelpNotification(Config.Locale['dyno_failed'])
                                                          Citizen.Wait(2000)
                                                          end
                                                          if RPM > 0.6 and RPM < 1.2 and Vdist2(GetEntityCoords(PlayerPedId()), v) < 1.5 and IsVehicleInBurnout(pedVehicle) then
                                                          ESX.ShowHelpNotification(Config.Locale['realease'])
                                                          Citizen.Wait(3000)
                                                          ESX.ShowHelpNotification(Config.Locale['dyno_suc'])
                                                          Citizen.Wait(1000)
                                                          for i=1, #Config.Cars, 1 do
                                                                  if GetHashKey(Config.Cars[i].veh) == vehiclemodel then

                                                                                local hp = Config.Cars[i].hp
                                                                                if eng == -1 then
                                                                                        local hp = hp + Config.Eng.Lvl1 --+engine up amount
                                                                                        if trns == -1 then
                                                                                                local hp = hp + Config.Trns.Lvl1--+trans up amount
                                                                                        elseif trns == 0 then
                                                                                                local hp = hp + Config.Trns.Lvl2--+trans up amount
                                                                                        elseif trns == 1 then
                                                                                                local hp = hp + Config.Trns.Lvl3--+trans up amount
                                                                                        elseif trns == 2 then
                                                                                                local hp = hp + Config.Trns.Lvl4--+trans up amount
                                                                                        elseif trns == 3 then
                                                                                                local hp = hp + Config.Trns.Lvl5--+trans up amount
                                                                                        end
                                                                                        if IsToggleModOn(pedVehicle, 18) then
                                                                                                local hp = hp + Config.Turbo--+trans up amount
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        else
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        end
                                                                                elseif eng == 0 then
                                                                                        local hp = hp + Config.Eng.Lvl2 --+engine up amount
                                                                                        if trns == -1 then
                                                                                                local hp = hp + Config.Trns.Lvl1--+trans up amount
                                                                                        elseif trns == 0 then
                                                                                                local hp = hp + Config.Trns.Lvl2--+trans up amount
                                                                                        elseif trns == 1 then
                                                                                                local hp = hp + Config.Trns.Lvl3--+trans up amount
                                                                                        elseif trns == 2 then
                                                                                                local hp = hp + Config.Trns.Lvl4--+trans up amount
                                                                                        elseif trns == 3 then
                                                                                                local hp = hp + Config.Trns.Lvl5--+trans up amount
                                                                                        end
                                                                                        if IsToggleModOn(pedVehicle, 18) then
                                                                                                local hp = hp + Config.Turbo--+trans up amount
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        else
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        end
                                                                                elseif eng == 1 then
                                                                                        local hp = hp + Config.Eng.Lvl3 --+engine up amount
                                                                                        if trns == -1 then
                                                                                                local hp = hp + Config.Trns.Lvl1--+trans up amount
                                                                                        elseif trns == 0 then
                                                                                                local hp = hp + Config.Trns.Lvl2--+trans up amount
                                                                                        elseif trns == 1 then
                                                                                                local hp = hp + Config.Trns.Lvl3--+trans up amount
                                                                                        elseif trns == 2 then
                                                                                                local hp = hp + Config.Trns.Lvl4--+trans up amount
                                                                                        elseif trns == 3 then
                                                                                                local hp = hp + Config.Trns.Lvl5--+trans up amount
                                                                                        end
                                                                                        if IsToggleModOn(pedVehicle, 18) then
                                                                                                local hp = hp + Config.Turbo--+trans up amount
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        else
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        end
                                                                                elseif eng == 2 then
                                                                                        local hp = hp + Config.Eng.Lvl4 --+engine up amount
                                                                                        if trns == -1 then
                                                                                                local hp = hp + Config.Trns.Lvl1--+trans up amount
                                                                                        elseif trns == 0 then
                                                                                                local hp = hp + Config.Trns.Lvl2--+trans up amount
                                                                                        elseif trns == 1 then
                                                                                                local hp = hp + Config.Trns.Lvl3--+trans up amount
                                                                                        elseif trns == 2 then
                                                                                                local hp = hp + Config.Trns.Lvl4--+trans up amount
                                                                                        elseif trns == 3 then
                                                                                                local hp = hp + Config.Trns.Lvl5--+trans up amount
                                                                                        end
                                                                                        if IsToggleModOn(pedVehicle, 18) then
                                                                                                local hp = hp + Config.Turbo--+trans up amount
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        else
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        end
                                                                                else if eng == 3 then
                                                                                        local hp = hp + Config.Eng.Lvl5 --+engine up amount
                                                                                        if trns == -1 then
                                                                                                local hp = hp + Config.Trns.Lvl1--+trans up amount
                                                                                        elseif trns == 0 then
                                                                                                local hp = hp + Config.Trns.Lvl2--+trans up amount
                                                                                        elseif trns == 1 then
                                                                                                local hp = hp + Config.Trns.Lvl3--+trans up amount
                                                                                        elseif trns == 2 then
                                                                                                local hp = hp + Config.Trns.Lvl4--+trans up amount
                                                                                        elseif trns == 3 then
                                                                                                local hp = hp + Config.Trns.Lvl5--+trans up amount
                                                                                        end
                                                                                        if IsToggleModOn(pedVehicle, 18) then
                                                                                                local hp = hp + Config.Turbo--+trans up amount
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        else
                                                                                                ESX.ShowNotification(Config.Locale['car_has'] ..hp.. Config.Locale['hp'])
                                                                                        end
                                                                                end
                                                                         end
                                                                 end
                                                        end
                                                end
                                        end
                                 end
                         end
                        end
                end
        end
end)


function CarDynoTime(message)
    exports['progressBars']:startUI(10000, message)
end

function CanDyno()
        local playerPed = PlayerPedId()

        if IsPedSittingInAnyVehicle(playerPed) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)

                if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        return true
                end
        end

        return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
                if Config.marker then
                for k, v in pairs(Config.Locations) do
            DrawMarker(25, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 0, 250, 150, 100, 0, 2, 0, 0)
                end
                end
    end
end)