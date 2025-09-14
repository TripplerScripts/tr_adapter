---@diagnostic disable: duplicate-set-field
Fuel = {}

Fuel.SetFuel = function(vehicle, fuel)
    print('No fuel resource available - SetFuel called', 'warn')
    return false
end

Fuel.GetFuel = function(vehicle)
    print('No fuel resource available - GetFuel called', 'warn')
    return 0
end

Fuel.AddFuel = function(vehicle, amount)
    print('No fuel resource available - AddFuel called', 'warn')
    return false
end

Fuel.RemoveFuel = function(vehicle, amount)
    print('No fuel resource available - RemoveFuel called', 'warn')
    return false
end