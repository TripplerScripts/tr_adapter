---@diagnostic disable: duplicate-set-field
Fuel.SetFuel = function(vehicle, fuel)
    return exports.LegacyFuel:SetFuel(vehicle, fuel)
end

Fuel.GetFuel = function(vehicle)
    return exports.LegacyFuel:GetFuel(vehicle)
end

Fuel.AddFuel = function(vehicle, amount)
    local currentFuel = exports.LegacyFuel:GetFuel(vehicle)
    return exports.LegacyFuel:SetFuel(vehicle, currentFuel + amount)
end

Fuel.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.LegacyFuel:GetFuel(vehicle)
    return exports.LegacyFuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end