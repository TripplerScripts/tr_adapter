---@diagnostic disable: duplicate-set-field
-- Menu Engine - Provides fallback functions for menu compatibility

-- Create global MenuEngine with fallback functions
MenuEngine = {}

-- OpenMenu fallback
MenuEngine.OpenMenu = function(data)
    Config.Log('No menu resource available - OpenMenu called', 'warn')
    return {}
end

-- CloseMenu fallback
MenuEngine.CloseMenu = function()
    Config.Log('No menu resource available - CloseMenu called', 'warn')
    return false
end

-- ShowHeader fallback
MenuEngine.ShowHeader = function(data)
    Config.Log('No menu resource available - ShowHeader called', 'warn')
    return {}
end
