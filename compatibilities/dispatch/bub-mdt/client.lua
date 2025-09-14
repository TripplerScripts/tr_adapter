---@diagnostic disable: duplicate-set-field
Dispatch.SendAlert = function(alertData)
    return exports['bub-mdt']:SendAlert(alertData)
end

Dispatch.RemoveAlert = function(alertId)
    return exports['bub-mdt']:RemoveAlert(alertId)
end
Dispatch.GetActiveAlerts = function()
    return exports['bub-mdt']:GetActiveAlerts()
end
Dispatch.UpdateAlert = function(alertId, data)
    return exports['bub-mdt']:UpdateAlert(alertId, data)
end