---@diagnostic disable: duplicate-set-field
-- ps-dispatch client compatibilities for tr_compatibilities
-- Assigns ps-dispatch specific functions to global DispatchEngine

-- SendAlert function for ps-dispatch
DispatchEngine.SendAlert = function(alertData)
    return exports['ps-dispatch']:SendAlert(alertData)
end

-- RemoveAlert function for ps-dispatch
DispatchEngine.RemoveAlert = function(alertId)
    return exports['ps-dispatch']:RemoveAlert(alertId)
end

-- GetActiveAlerts function for ps-dispatch
DispatchEngine.GetActiveAlerts = function()
    return exports['ps-dispatch']:GetActiveAlerts()
end

-- UpdateAlert function for ps-dispatch
DispatchEngine.UpdateAlert = function(alertId, data)
    return exports['ps-dispatch']:UpdateAlert(alertId, data)
end
