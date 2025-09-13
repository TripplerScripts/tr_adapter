---@diagnostic disable: duplicate-set-field
-- Core Engine - Provides fallback functions for core resource compatibility

-- Create global CoreEngine with fallback functions
CoreEngine = {}

-- GetCoreObject fallback
CoreEngine.GetCoreObject = function()
    Config.Log('No core resource available - GetCoreObject called', 'warn')
    return nil
end

-- GetPlayerData fallback
CoreEngine.GetPlayerData = function()
    Config.Log('No core resource available - GetPlayerData called', 'warn')
    return {}
end

-- GetPlayer fallback (server)
CoreEngine.GetPlayer = function(source)
    Config.Log('No core resource available - GetPlayer called', 'warn')
    return nil
end

-- GetPlayerByCitizenId fallback (server)
CoreEngine.GetPlayerByCitizenId = function(citizenid)
    Config.Log('No core resource available - GetPlayerByCitizenId called', 'warn')
    return nil
end
