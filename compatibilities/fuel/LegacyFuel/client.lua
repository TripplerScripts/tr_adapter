---@diagnostic disable: duplicate-set-field
-- LegacyFuel client compatibilities for tr_compatibilities
-- Assigns LegacyFuel specific functions to global FuelEngine

-- SetFuel function for LegacyFuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports.LegacyFuel:SetFuel(vehicle, fuel)
end

-- GetFuel function for LegacyFuel
FuelEngine.GetFuel = function(vehicle)
    return exports.LegacyFuel:GetFuel(vehicle)
end

-- AddFuel function for LegacyFuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports.LegacyFuel:GetFuel(vehicle)
    return exports.LegacyFuel:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for LegacyFuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.LegacyFuel:GetFuel(vehicle)
    return exports.LegacyFuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
