---@diagnostic disable: duplicate-set-field

Doorlock.GetClosestDoor = function()
  return exports['qb-doorlock']:GetClosestDoor()
end

Doorlock.GetNearbyDoors = function()
  return exports['qb-doorlock']:GetNearbyDoors()
end

Doorlock.GetDoorList = function(entity)
  return exports['qb-doorlock']:GetDoorList(entity)
end

Doorlock.GetDoorStates = function()
  return exports['qb-doorlock']:GetDoorStates()
end