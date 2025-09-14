---@diagnostic disable: duplicate-set-field
Ambulance = {}

Ambulance.RevivePlayer = function(source)
    print('No ambulance resource available - RevivePlayer called', 'warn')
    return false
end

Ambulance.KillPlayer = function(source)
    print('No ambulance resource available - KillPlayer called', 'warn')
    return false
end

Ambulance.SetPlayerHealth = function(source, health)
    print('No ambulance resource available - SetPlayerHealth called', 'warn')
    return false
end

Ambulance.GetPlayerHealth = function(source)
    print('No ambulance resource available - GetPlayerHealth called', 'warn')
    return 200
end