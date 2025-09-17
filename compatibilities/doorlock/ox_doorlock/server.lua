---@diagnostic disable: duplicate-set-field

Doorlock.GetDoor = function(door)
  return exports.ox_doorlock:getDoor(door)
end

Doorlock.GetAllDoors = function()
  return exports.ox_doorlock:getAllDoors()
end

Doorlock.GetDoorFromName = function(name)
  return exports.ox_doorlock:getDoorFromName(name)
end

Doorlock.EditDoor = function(id, data)
  exports.ox_doorlock:editDoor(id, data)
end

Doorlock.SetDoorState = function(id, state, lockpick)
  return exports.ox_doorlock:setDoorState(id, state, lockpick)
end