local _server_callbacks = {}
local _cb_id = 0

table_count = function(t) local c = 0 for k,v in pairs(t) do c = c + 1; end return c; end

-- lazy man
register_event = function(e,h,n)
  if n then RegisterNetEvent(e); end
  AddEventHandler(e,h)
end

-- notifications
show_notification = function(msg)
  SetNotificationTextEntry('STRING')
  AddTextComponentSubstringPlayerName(msg)
  DrawNotification(true, true)
end

help_notification = function(msg)
  BeginTextCommandDisplayHelp('STRING')
  AddTextComponentSubstringPlayerName(msg)
  EndTextCommandDisplayHelp(0,false,true,-1)
end

-- network control
get_network_control = function(entity)
  if not NetworkHasControlOfEntity(entity) then
    if cfg.debug then show_notification("~y~Requesting control of entity. Please wait.~s~"); end
    local start = GetGameTimer()
    while not NetworkHasControlOfEntity(entity) and GetGameTimer() - start < 1000 do NetworkRequestControlOfEntity(entity); Wait(0); end
  end
end

release_network_control = function(entity)
  SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity),true)
end

-- get closest garage
get_closest_garage = function()
  local ply_ped = GetPlayerPed(-1)
  local ply_pos = GetEntityCoords(ply_ped)
  local closest,closest_dist
  for k,v in pairs(cfg.garage_locations) do
    local dist = Vdist(ply_pos,v.xyz)
    if not closest_dist or dist < closest_dist then
      closest = v
      closest_dist = dist
    end
  end
  return closest,(closest_dist or 9999)
end

-- raycast
do_raycast = function(ignore,down)
  local ply_ped = GetPlayerPed(-1)
  local ply_pos = GetEntityCoords(ply_ped)
  local ply_fwd = GetEntityForwardVector(ply_ped)
  local up = vector3(0.0,0.0,1.0)

  local from = ply_pos + (up*2)
  local to   = ply_pos - (up*2)

  local res,hit,end_pos,surface_norm,ent_hit
  for i=0,cfg.max_raycast_length,1 do
    local ray = StartShapeTestRay(from.x + (ply_fwd.x*i),from.y + (ply_fwd.y*i),from.z + (ply_fwd.z*i),to.x + (ply_fwd.x*i),to.y + (ply_fwd.y*i),to.z + (ply_fwd.z*i),2,ignore, 0);
    res,hit,end_pos,surface_norm,ent_hit = GetShapeTestResult(ray); 
    if ent_hit and ent_hit ~= 0 and ent_hit ~= -1 then
      local type = GetEntityType(ent_hit)
      if type ~= 0 then
        local model = GetEntityModel(ent_hit)
        if trailer_lookup[model] then 
          return ent_hit,model
        end
      end
    end
  end
  return false
end

create_blip = function(pos,sprite,color,text,scale,display,shortRange,highDetail)
  local blip = AddBlipForCoord(pos.x,pos.y,pos.z)
  SetBlipSprite               (blip, (sprite or 1))
  SetBlipColour               (blip, (color or 4))
  SetBlipScale                (blip, (scale or 1.0))
  SetBlipDisplay              (blip, (display or 3))
  SetBlipAsShortRange         (blip, (shortRange or false))
  SetBlipHighDetail           (blip, (highDetail or true))
  BeginTextCommandSetBlipName ("STRING")
  AddTextComponentString      ((text or "Blip "..tostring(blip)))
  EndTextCommandSetBlipName   (blip)
  return blip
end

-- callbacks
callback = function(event,...)
  local myId = _cb_id  
  _server_callbacks[myId] = false
  _cb_id = _cb_id + 1
  TriggerServerEvent(GetCurrentResourceName()..":Callback",myId,event,...)

  local start = GetGameTimer()
  while not (_server_callbacks[myId]) and (GetGameTimer() - start < 30000) do Wait(0); end

  if not _server_callbacks[myId] then 
    return false
  else 
    return table.unpack(_server_callbacks[myId])
  end
end

called_back = function(id,...)
  _server_callbacks[id] = {...}
end

-- set job
set_job = function(job)
  player_job = job.name
end

-- scaleform utilities
get_scaleform = function()
  local scaleform = RequestScaleformMovie('instructional_buttons')
  while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end

  PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
  PopScaleformMovieFunctionVoid()
 
  PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
  PushScaleformMovieFunctionParameterInt(200)
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(0)
  instructional_button(GetControlInstructionalButton(0, 175, true))
  instructional_button_message("Next")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(1)
  instructional_button(GetControlInstructionalButton(0, 174, true))
  instructional_button_message("Prev")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(2)
  instructional_button(GetControlInstructionalButton(0, 191, true))
  instructional_button_message("Detach")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(3)
  instructional_button(GetControlInstructionalButton(0, 194, true))
  instructional_button_message("Cancel")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(80)
  PopScaleformMovieFunctionVoid()

  return scaleform
end

instructional_button = function(ControlButton)
  N_0xe83a3e3557a56640(ControlButton)
end

instructional_button_message = function(text)
  BeginTextCommandScaleformString("STRING")
  AddTextComponentScaleform(text)
  EndTextCommandScaleformString()
end

get_vehicle_label = function(model)
  return (GetLabelText(GetDisplayNameFromVehicleModel(model)))
end

-- event registry
register_event("esx:setJob",set_job,1)
register_event(GetCurrentResourceName()..":Calledback",called_back,1)