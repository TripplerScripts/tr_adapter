---@diagnostic disable: duplicate-set-field

Doorlock.UseClosestDoor = function()
  exports.ox_doorlock:useClosestDoor()
end

Doorlock.GetClosestDoor = function()
  return exports.ox_doorlock:getClosestDoor()
end

Doorlock.GetClosestDoorId = function()
  return exports.ox_doorlock:getClosestDoorId()
end

Doorlock.GetDoorIdFromEntity = function(entity)
  return exports.ox_doorlock:getDoorIdFromEntity(entity)
end

Doorlock.PickClosestDoor = function()
  exports.ox_doorlock:pickClosestDoor()
end