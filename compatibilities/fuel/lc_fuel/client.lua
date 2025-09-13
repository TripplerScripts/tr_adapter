---@diagnostic disable: duplicate-set-field
-- lc_fuel client compatibilities for tr_compatibilities
-- Assigns lc_fuel specific functions to global FuelEngine

-- SetFuel function for lc_fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports.lc_fuel:SetFuel(vehicle, fuel)
end

-- GetFuel function for lc_fuel
FuelEngine.GetFuel = function(vehicle)
    return exports.lc_fuel:GetFuel(vehicle)
end

-- AddFuel function for lc_fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports.lc_fuel:GetFuel(vehicle)
    return exports.lc_fuel:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for lc_fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.lc_fuel:GetFuel(vehicle)
    return exports.lc_fuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
