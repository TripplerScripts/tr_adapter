---@diagnostic disable: duplicate-set-field
Fuel.SetFuel = function(vehicle, fuel)
    return exports['ps-fuel']:SetFuel(vehicle, fuel)
end

Fuel.GetFuel = function(vehicle)
    return exports['ps-fuel']:GetFuel(vehicle)
end

Fuel.AddFuel = function(vehicle, amount)
    local currentFuel = exports['ps-fuel']:GetFuel(vehicle)
    return exports['ps-fuel']:SetFuel(vehicle, currentFuel + amount)
end

Fuel.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['ps-fuel']:GetFuel(vehicle)
    return exports['ps-fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end