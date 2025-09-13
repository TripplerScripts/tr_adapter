---@diagnostic disable: duplicate-set-field
-- Dispatch Engine - Provides fallback functions for dispatch compatibility

-- Create global DispatchEngine with fallback functions
DispatchEngine = {}

-- SendAlert fallback
DispatchEngine.SendAlert = function(alertData)
    Config.Log('No dispatch resource available - SendAlert called', 'warn')
    return false
end

-- RemoveAlert fallback
DispatchEngine.RemoveAlert = function(alertId)
    Config.Log('No dispatch resource available - RemoveAlert called', 'warn')
    return false
end

-- GetActiveAlerts fallback
DispatchEngine.GetActiveAlerts = function()
    Config.Log('No dispatch resource available - GetActiveAlerts called', 'warn')
    return {}
end

-- UpdateAlert fallback
DispatchEngine.UpdateAlert = function(alertId, data)
    Config.Log('No dispatch resource available - UpdateAlert called', 'warn')
    return false
end
