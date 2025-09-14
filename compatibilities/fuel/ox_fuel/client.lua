---@diagnostic disable: duplicate-set-field
Fuel.SetFuel = function(vehicle, fuel)
    return exports.ox_fuel:SetFuel(vehicle, fuel)
end

Fuel.GetFuel = function(vehicle)
    return exports.ox_fuel:GetFuel(vehicle)
end

Fuel.AddFuel = function(vehicle, amount)
    local currentFuel = exports.ox_fuel:GetFuel(vehicle)
    return exports.ox_fuel:SetFuel(vehicle, currentFuel + amount)
end

Fuel.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.ox_fuel:GetFuel(vehicle)
    return exports.ox_fuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end