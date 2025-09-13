---@diagnostic disable: duplicate-set-field
-- qb-fuel client compatibilities for tr_compatibilities
-- Assigns qb-fuel specific functions to global FuelEngine

-- SetFuel function for qb-fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports['qb-fuel']:SetFuel(vehicle, fuel)
end

-- GetFuel function for qb-fuel
FuelEngine.GetFuel = function(vehicle)
    return exports['qb-fuel']:GetFuel(vehicle)
end

-- AddFuel function for qb-fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports['qb-fuel']:GetFuel(vehicle)
    return exports['qb-fuel']:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for qb-fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['qb-fuel']:GetFuel(vehicle)
    return exports['qb-fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
