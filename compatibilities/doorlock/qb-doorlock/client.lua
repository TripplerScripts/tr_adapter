---@diagnostic disable: duplicate-set-field
Doorlock.SetDoorState = function(doorId, state)
    return exports['qb-doorlock']:SetDoorState(doorId, state)
end

Doorlock.GetDoorState = function(doorId)
    return exports['qb-doorlock']:GetDoorState(doorId)
end

Doorlock.ToggleDoor = function(doorId)
    return exports['qb-doorlock']:ToggleDoor(doorId)
end