---@diagnostic disable: duplicate-set-field
Dispatch.SendAlert = function(alertData)
    return exports['ps-dispatch']:SendAlert(alertData)
end

Dispatch.RemoveAlert = function(alertId)
    return exports['ps-dispatch']:RemoveAlert(alertId)
end
Dispatch.GetActiveAlerts = function()
    return exports['ps-dispatch']:GetActiveAlerts()
end
Dispatch.UpdateAlert = function(alertId, data)
    return exports['ps-dispatch']:UpdateAlert(alertId, data)
end