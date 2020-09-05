trailer_lookup = {}
for k,v in pairs(cfg.trailer_models) do trailer_lookup[GetHashKey(v.model)] = v; end
job_lookup = {}
for k,v in pairs(cfg.control_jobs) do job_lookup[v] = true; end

get_framework = function()  
  TriggerEvent("esx:getSharedObject",function(obj)
    ESX = obj
    while not ESX.IsPlayerLoaded() do Wait(0); end
    player_job = ESX.GetPlayerData().job.name
    update()
  end)
end

init = function()
  if cfg.show_blips then
    for k,v in pairs(cfg.garage_locations) do
      create_blip(v,cfg.blip_sprite,cfg.blip_color,cfg.blip_text,cfg.blip_scale,cfg.blip_display,cfg.blip_short,false)
    end
  end
  get_framework()
end

update = function()
  while true do    
    local wait_time = 200
    local ply_ped = GetPlayerPed(-1)
    local ply_pos = GetEntityCoords(ply_ped)
    local in_veh  = IsPedInAnyVehicle(ply_ped)
    local closest_garage,garage_dist = get_closest_garage()

    if garage_dist < 20.0 and cfg.show_marker then
      DrawMarker(cfg.marker_sprite, closest_garage.x,closest_garage.y,closest_garage.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 3.0,3.0,3.0, cfg.marker_color.r,cfg.marker_color.g,cfg.marker_color.b,cfg.marker_color.a, false,1, 2, false)
      wait_time = 0
    end

    if not cfg.job_only or cfg.job_only and player_job and job_lookup[player_job] then 
      if in_veh then
        local veh = GetVehiclePedIsUsing(ply_ped)
        local ent_hit,model = do_raycast(veh,true)
        if ent_hit then
          help_notification("~INPUT_PICKUP~ Attach Vehicle")
          if IsControlJustPressed(0,38) then
            attach_to_trailer(ent_hit,veh,trailer_lookup[model].bone,trailer_lookup[model].max,trailer_lookup[model].heading_offset)
          end
          wait_time = 0
        end
      else
        local ent_hit,model = do_raycast(-1)
        if ent_hit then
          if garage_dist < 3.0 then
            help_notification("~INPUT_PICKUP~ Store Trailer")
            if IsControlJustPressed(0,38) then
              store_trailer(ent_hit)
            end
          else
            if trailer_lookup[model].door then 
              help_notification("~INPUT_PICKUP~ Detach Vehicles\n~INPUT_DETONATE~ Ramp")
            else
              help_notification("~INPUT_PICKUP~ Detach Vehicles")
            end

            if IsControlJustPressed(0,47) and trailer_lookup[model].door then 
              swing_door(ent_hit,model) 
            elseif IsControlJustPressed(0,38) then
              detach_vehicles(ent_hit)
            end  
            wait_time = 0          
          end
        else
          if garage_dist < 3.0 and not in_menu then
            help_notification("~INPUT_PICKUP~ Get Trailers")
            if IsControlJustPressed(0,38) then
              in_menu = true
              local elements = {}
              local player_trailers = callback("Trailers:GetPlayerTrailers")
              if type(player_trailers) == "table" and table_count(player_trailers) > 0 then
                for k,v in pairs(player_trailers) do
                  table.insert(elements,{
                    label = "["..v.trailer.plate.."] "..get_vehicle_label(v.trailer.model),
                    plate = v.trailer.plate
                  }) 
                end
              else
                table.insert(elements,{label = "No trailers to display."})
              end
              ESX.UI.Menu.Open('default', GetCurrentResourceName(), "garage_menu",{
                  title    = "Garage",
                  align    = 'left',
                  elements = elements,
                }, 
                function(data,menu)
                  if data.current.plate then
                    get_trailer(data.current.plate,closest_garage)
                  end
                  ESX.UI.Menu.CloseAll()
                end,
                function(data,menu)
                  menu.close()
                end,
                function(data,menu)
                end,
                function(data,menu)
                  in_menu = false
                end
              )
            end
          end
        end
      end
    end
    Wait(wait_time)
  end
end

attach_to_trailer = function(trailer,vehicle,bone,max,heading_offset)
  if cfg.debug then show_notification("~y~Attempting to attach vehicle.~s~"); end
  local props = ESX.Game.GetVehicleProperties(trailer)
  local return_data = callback("Trailers:GetAttachedVehicles",props.plate)
  local attached_vehicles = return_data.vehicles
  if max and attached_vehicles and #attached_vehicles >= max then
    show_notification("~r~This trailer is already full.~s~")
    return
  end

  local veh_pos = GetEntityCoords(vehicle)
  TaskEveryoneLeaveVehicle(vehicle)
  TaskLeaveVehicle(GetPlayerPed(-1),vehicle,16)

  local offset = GetOffsetFromEntityGivenWorldCoords(trailer,veh_pos.x,veh_pos.y,veh_pos.z)
  local my_rot = GetEntityRotation(vehicle,2)
  local other_rot = GetWorldRotationOfEntityBone(trailer,GetEntityBoneIndexByName(trailer, bone))  

  SetEntityAsMissionEntity(vehicle,true,true)
  SetEntityAsMissionEntity(trailer,true,true)     

  local has,parent = GetVehicleTrailerVehicle(trailer)
  if has and parent then
    get_network_control(parent)
  end
  get_network_control(vehicle)
  get_network_control(trailer)       

  AttachEntityToEntity(vehicle, trailer, GetEntityBoneIndexByName(trailer, bone), offset.x, offset.y, offset.z, 0.0,0.0,my_rot.z - other_rot.z + heading_offset, true, true, false, 1, 1, 1)

  local vehicle_offsets = {position = {x =offset.x, y =offset.y, z =offset.z}, heading = my_rot.z - other_rot.z + heading_offset}

  local trailer_props = ESX.Game.GetVehicleProperties(trailer)
  local vehicle_props = ESX.Game.GetVehicleProperties(vehicle)
  local vehicle_net_id = NetworkGetNetworkIdFromEntity(vehicle)

  TriggerServerEvent("Trailers:AttachedVehicle",trailer_props.plate,vehicle_net_id,vehicle_props,vehicle_offsets)
  show_notification("~g~Vehicle attached successfully.~s~")
end

detach_vehicles = function(trailer)
  if cfg.debug then show_notification("~y~Retrieving attached vehicles list."); end

  local scaleform = get_scaleform()
  local trailer_net_id = NetworkGetNetworkIdFromEntity(trailer)
  local trailer_props = ESX.Game.GetVehicleProperties(trailer)
  local return_data = callback("Trailers:GetAttachedVehicles",trailer_props.plate)

  if not return_data.owner and not job_lookup[player_job] then
    show_notification("You can't use this trailer.")
    return
  end

  local attached_vehicles = return_data.vehicles
  if attached_vehicles and #attached_vehicles > 0 then
    local target_index = 1
    while true do
      local target_vehicle = NetworkGetEntityFromNetworkId(attached_vehicles[target_index].vehicle_net_id)
      local dim_min,dim_max = GetModelDimensions(GetEntityModel(target_vehicle))
      local pos = GetEntityCoords(target_vehicle)

      DrawMarker(0, pos.x,pos.y,pos.z + ( math.max(math.abs(dim_max.z),math.abs(dim_min.z)) * 1.5), 0.0,0.0,0.0, 0.0,0.0,0.0, 0.2,0.2,0.2, cfg.marker_color.r,cfg.marker_color.g,cfg.marker_color.b,cfg.marker_color.a, true,true, 2, false)
      DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)

      if IsControlJustPressed(0,175) then
        target_index = target_index + 1
        if target_index > #attached_vehicles then
          target_index = 1
        end
      elseif IsControlJustPressed(0,174) then
        target_index = target_index - 1
        if target_index < 1 then
          target_index = #attached_vehicles
        end
      elseif IsDisabledControlJustPressed(0,191) then
        local target_pos = GetEntityCoords(target_vehicle)

        get_network_control(target_vehicle)
        DetachEntity(target_vehicle)
        TriggerServerEvent("Trailers:DetachedVehicle",trailer_props.plate,attached_vehicles[target_index])
        SetEntityCoordsNoOffset(target_vehicle,target_pos.x,target_pos.y,target_pos.z+0.2)
        Wait(100)

        release_network_control(target_vehicle)
        show_notification("~g~Vehicle detached.~r~")
        detach_vehicles(trailer)
        return
      elseif IsControlJustPressed(0,194) then
        return
      end
      Wait(0)
    end
  else
    show_notification("~r~Nothing is attached to this trailer.~s~")
  end
end

swing_door = function(ent_hit,model)
  local has,parent = GetVehicleTrailerVehicle(ent_hit)
  if has and parent then
    get_network_control(parent)
  end
  get_network_control(ent_hit)  

  if GetVehicleDoorAngleRatio(ent_hit,trailer_lookup[model].door) > 0.1 then
    SetVehicleDoorShut(ent_hit,trailer_lookup[model].door,trailer_lookup[model].instant_open)
    release_network_control(ent_hit)
    local net_id = NetworkGetNetworkIdFromEntity(ent_hit)
    TriggerServerEvent("Trailers:RaiseRamp",net_id,trailer_lookup[model].door,trailer_lookup[model].instant_open)
    show_notification("~g~Raising ramp.")
  else              
    SetVehicleDoorOpen(ent_hit,trailer_lookup[model].door,trailer_lookup[model].instant_open,trailer_lookup[model].instant_open)
    release_network_control(ent_hit)
    local net_id = NetworkGetNetworkIdFromEntity(ent_hit)
    TriggerServerEvent("Trailers:LowerRamp",net_id,trailer_lookup[model].door,trailer_lookup[model].instant_open)
    show_notification("~g~Lowering ramp.")
  end
end

store_trailer = function(ent_hit)
  local ent_hit,model = do_raycast(-1)
  local trailer_props = ESX.Game.GetVehicleProperties(ent_hit)
  last_trailer_plate = trailer_props.plate

  local can_store = callback("Trailers:TryStoreTrailer",trailer_props)

  if can_store then
    SetEntityAsMissionEntity(ent_hit,true,true)
    DetachEntity(ent_hit)
    DeleteEntity(ent_hit)
    show_notification("~g~Trailer stored.~s~")
  else
    show_notification("~r~Can't store this trailer.~s~")
  end
end

get_trailer = function(plate,pos)
  local trailer_data = callback("Trailers:GetStoredTrailer",plate)
  local model = trailer_data.trailer.model
  RequestModel(model)
  while not HasModelLoaded(model) do Wait(0); end

  local ply_ped = GetPlayerPed(-1)
  local ply_pos = GetEntityCoords(ply_ped)
  local trailer = CreateVehicle(model,pos.x,pos.y,pos.z,pos.w,true,true)
  SetEntityAsMissionEntity(trailer,true,true)

  if trailer_lookup[model].enter_on_spawn then
    TaskWarpPedIntoVehicle(ply_ped,trailer,trailer_lookup[model].enter_seat,16)
  end

  ESX.Game.SetVehicleProperties(trailer,trailer_data.trailer)

  SetModelAsNoLongerNeeded(model)

  for k,v in pairs(trailer_data.attached) do
    local veh_model = v.vehicle_props.model
    RequestModel(veh_model)
    while not HasModelLoaded(veh_model) do Wait(0); end

    local vehicle = CreateVehicle(veh_model,ply_pos.x,ply_pos.y,ply_pos.z + 5.0,0.0,true,true)
    while not DoesEntityExist(vehicle) do Wait(0); end

    ESX.Game.SetVehicleProperties(vehicle,v.vehicle_props)

    SetModelAsNoLongerNeeded(veh_model)

    local bone = trailer_lookup[model].bone
    local offset = v.vehicle_offsets
    AttachEntityToEntity(vehicle, trailer, GetEntityBoneIndexByName(trailer, bone), offset.position.x, offset.position.y, offset.position.z, 0.0,0.0,offset.heading, true, true, false, 1, 1, 1)

    TriggerServerEvent("Trailers:SetNetworkId",trailer_data.trailer.plate,v.vehicle_props.plate,NetworkGetNetworkIdFromEntity(vehicle))
  end
end

raise_ramp = function(net_id,door_id,instant)
  local ent_hit = NetworkGetEntityFromNetworkId(net_id)
  if DoesEntityExist(ent_hit) then
    local pos = GetEntityCoords(ent_hit)
    if pos.x ~= 0.0 and pos.y ~= 0.0 and pos.z ~= 0.0 then
      SetVehicleDoorShut(ent_hit,door_id,instant)
    end
  end
end

lower_ramp = function(net_id,door_id,instant)
  local ent_hit = NetworkGetEntityFromNetworkId(net_id)
  if DoesEntityExist(ent_hit) then
    local pos = GetEntityCoords(ent_hit)
    if pos.x ~= 0.0 and pos.y ~= 0.0 and pos.z ~= 0.0 then
      SetVehicleDoorOpen(ent_hit,door_id,instant,instant)
    end
  end
end

RegisterNetEvent("Trailers:RaiseRamp")
AddEventHandler("Trailers:RaiseRamp",raise_ramp)

RegisterNetEvent("Trailers:LowerRamp")
AddEventHandler("Trailers:LowerRamp",lower_ramp)

Citizen.CreateThread(init)
