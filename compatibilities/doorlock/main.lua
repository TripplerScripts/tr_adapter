---@diagnostic disable: duplicate-set-field
-- Doorlock Engine - Provides fallback functions for doorlock compatibility

-- Create global DoorlockEngine with fallback functions
DoorlockEngine = {}

-- SetDoorState fallback
DoorlockEngine.SetDoorState = function(doorId, state)
    Config.Log('No doorlock resource available - SetDoorState called', 'warn')
    return false
end

-- GetDoorState fallback
DoorlockEngine.GetDoorState = function(doorId)
    Config.Log('No doorlock resource available - GetDoorState called', 'warn')
    return nil
end

-- ToggleDoor fallback
DoorlockEngine.ToggleDoor = function(doorId)
    Config.Log('No doorlock resource available - ToggleDoor called', 'warn')
    return false
end
