server_callbacks = {}
register_callback = function(event,cb)
  server_callbacks[event] = cb
end

register_event = function(e,h,n)
  if n then RegisterNetEvent(e); end
  AddEventHandler(e,h)
end

calling_back = function(id,event,...)
  local _source = source
  while not server_callbacks[event] do Wait(0); end
  local ret = server_callbacks[event](_source,...)
  TriggerClientEvent(GetCurrentResourceName()..":Calledback",_source,id,ret)
end  

RegisterNetEvent(GetCurrentResourceName()..":Callback")
AddEventHandler(GetCurrentResourceName()..":Callback",calling_back)