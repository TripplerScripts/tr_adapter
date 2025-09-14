---@diagnostic disable: duplicate-set-field
Dispatch = {}

Dispatch.SendAlert = function(alertData)
    print('No dispatch resource available - SendAlert called', 'warn')
    return false
end

Dispatch.RemoveAlert = function(alertId)
    print('No dispatch resource available - RemoveAlert called', 'warn')
    return false
end

Dispatch.GetActiveAlerts = function()
    print('No dispatch resource available - GetActiveAlerts called', 'warn')
    return {}
end
Dispatch.UpdateAlert = function(alertId, data)
    print('No dispatch resource available - UpdateAlert called', 'warn')
    return false
end