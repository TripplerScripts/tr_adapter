---@diagnostic disable: duplicate-set-field
Doorlock.SetDoorState = function(doorId, state)
    return exports.ox_doorlock:setDoorState(doorId, state)
end
Doorlock.GetDoorState = function(doorId)
    return exports.ox_doorlock:getDoorState(doorId)
end
Doorlock.ToggleDoor = function(doorId)
    return exports.ox_doorlock:toggleDoor(doorId)
end