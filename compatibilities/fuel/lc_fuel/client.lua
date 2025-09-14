---@diagnostic disable: duplicate-set-field
Fuel.SetFuel = function(vehicle, fuel)
    return exports.lc_fuel:SetFuel(vehicle, fuel)
end

Fuel.GetFuel = function(vehicle)
    return exports.lc_fuel:GetFuel(vehicle)
end

Fuel.AddFuel = function(vehicle, amount)
    local currentFuel = exports.lc_fuel:GetFuel(vehicle)
    return exports.lc_fuel:SetFuel(vehicle, currentFuel + amount)
end

Fuel.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.lc_fuel:GetFuel(vehicle)
    return exports.lc_fuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end