---@diagnostic disable: duplicate-set-field
-- RadialMenu Engine - Provides fallback functions for radialmenu compatibility

-- Create global RadialMenuEngine with fallback functions
RadialMenuEngine = {}

-- OpenMenu fallback
RadialMenuEngine.OpenMenu = function(data)
    Config.Log('No radialmenu resource available - OpenMenu called', 'warn')
    return false
end

-- CloseMenu fallback
RadialMenuEngine.CloseMenu = function()
    Config.Log('No radialmenu resource available - CloseMenu called', 'warn')
    return false
end
