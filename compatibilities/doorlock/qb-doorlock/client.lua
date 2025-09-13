---@diagnostic disable: duplicate-set-field
-- qb-doorlock client compatibilities for tr_compatibilities
-- Assigns qb-doorlock specific functions to global DoorlockEngine

-- SetDoorState function for qb-doorlock
DoorlockEngine.SetDoorState = function(doorId, state)
    return exports['qb-doorlock']:SetDoorState(doorId, state)
end

-- GetDoorState function for qb-doorlock
DoorlockEngine.GetDoorState = function(doorId)
    return exports['qb-doorlock']:GetDoorState(doorId)
end

-- ToggleDoor function for qb-doorlock
DoorlockEngine.ToggleDoor = function(doorId)
    return exports['qb-doorlock']:ToggleDoor(doorId)
end
