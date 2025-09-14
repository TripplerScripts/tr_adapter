---@diagnostic disable: duplicate-set-field
Fuel.SetFuel = function(vehicle, fuel)
    return exports['Renewed-Fuel']:SetFuel(vehicle, fuel)
end

Fuel.GetFuel = function(vehicle)
    return exports['Renewed-Fuel']:GetFuel(vehicle)
end

Fuel.AddFuel = function(vehicle, amount)
    local currentFuel = exports['Renewed-Fuel']:GetFuel(vehicle)
    return exports['Renewed-Fuel']:SetFuel(vehicle, currentFuel + amount)
end

Fuel.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['Renewed-Fuel']:GetFuel(vehicle)
    return exports['Renewed-Fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end