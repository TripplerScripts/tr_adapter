---@diagnostic disable: duplicate-set-field
-- bub-mdt client compatibilities for tr_compatibilities
-- Assigns bub-mdt specific functions to global DispatchEngine

-- SendAlert function for bub-mdt
DispatchEngine.SendAlert = function(alertData)
    return exports['bub-mdt']:SendAlert(alertData)
end

-- RemoveAlert function for bub-mdt
DispatchEngine.RemoveAlert = function(alertId)
    return exports['bub-mdt']:RemoveAlert(alertId)
end

-- GetActiveAlerts function for bub-mdt
DispatchEngine.GetActiveAlerts = function()
    return exports['bub-mdt']:GetActiveAlerts()
end

-- UpdateAlert function for bub-mdt
DispatchEngine.UpdateAlert = function(alertId, data)
    return exports['bub-mdt']:UpdateAlert(alertId, data)
end
