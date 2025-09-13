---@diagnostic disable: duplicate-set-field
-- Input Engine - Provides fallback functions for input compatibility

-- Create global InputEngine with fallback functions
InputEngine = {}

-- ShowInput fallback
InputEngine.ShowInput = function(data)
    Config.Log('No input resource available - ShowInput called', 'warn')
    return false
end
