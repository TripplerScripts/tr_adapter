---@diagnostic disable: duplicate-set-field
-- Polyzone Engine - Provides fallback functions for polyzone compatibility

-- Create global PolyzoneEngine with fallback functions
PolyzoneEngine = {}

-- CreateZone fallback
PolyzoneEngine.CreateZone = function(name, points, options)
    Config.Log('No polyzone resource available - CreateZone called', 'warn')
    return false
end

-- RemoveZone fallback
PolyzoneEngine.RemoveZone = function(name)
    Config.Log('No polyzone resource available - RemoveZone called', 'warn')
    return false
end
