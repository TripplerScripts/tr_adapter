---@diagnostic disable: duplicate-set-field
-- Ambulance Engine - Provides fallback functions for ambulance compatibility

-- Create global AmbulanceEngine with fallback functions
AmbulanceEngine = {}

-- RevivePlayer fallback
AmbulanceEngine.RevivePlayer = function(source)
    Config.Log('No ambulance resource available - RevivePlayer called', 'warn')
    return false
end

-- KillPlayer fallback
AmbulanceEngine.KillPlayer = function(source)
    Config.Log('No ambulance resource available - KillPlayer called', 'warn')
    return false
end

-- SetPlayerHealth fallback
AmbulanceEngine.SetPlayerHealth = function(source, health)
    Config.Log('No ambulance resource available - SetPlayerHealth called', 'warn')
    return false
end

-- GetPlayerHealth fallback
AmbulanceEngine.GetPlayerHealth = function(source)
    Config.Log('No ambulance resource available - GetPlayerHealth called', 'warn')
    return 200
end
