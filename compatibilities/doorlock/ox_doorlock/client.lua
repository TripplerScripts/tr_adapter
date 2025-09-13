---@diagnostic disable: duplicate-set-field
-- ox_doorlock client compatibilities for tr_compatibilities
-- Assigns ox_doorlock specific functions to global DoorlockEngine

-- SetDoorState function for ox_doorlock
DoorlockEngine.SetDoorState = function(doorId, state)
    return exports.ox_doorlock:setDoorState(doorId, state)
end

-- GetDoorState function for ox_doorlock
DoorlockEngine.GetDoorState = function(doorId)
    return exports.ox_doorlock:getDoorState(doorId)
end

-- ToggleDoor function for ox_doorlock
DoorlockEngine.ToggleDoor = function(doorId)
    return exports.ox_doorlock:toggleDoor(doorId)
end
