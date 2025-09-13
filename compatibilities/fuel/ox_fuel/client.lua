---@diagnostic disable: duplicate-set-field
-- ox_fuel client compatibilities for tr_compatibilities
-- Assigns ox_fuel specific functions to global FuelEngine

-- SetFuel function for ox_fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports.ox_fuel:SetFuel(vehicle, fuel)
end

-- GetFuel function for ox_fuel
FuelEngine.GetFuel = function(vehicle)
    return exports.ox_fuel:GetFuel(vehicle)
end

-- AddFuel function for ox_fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports.ox_fuel:GetFuel(vehicle)
    return exports.ox_fuel:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for ox_fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports.ox_fuel:GetFuel(vehicle)
    return exports.ox_fuel:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
