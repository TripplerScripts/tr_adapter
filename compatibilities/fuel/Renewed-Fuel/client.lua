---@diagnostic disable: duplicate-set-field
-- Renewed-Fuel client compatibilities for tr_compatibilities
-- Assigns Renewed-Fuel specific functions to global FuelEngine

-- SetFuel function for Renewed-Fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports['Renewed-Fuel']:SetFuel(vehicle, fuel)
end

-- GetFuel function for Renewed-Fuel
FuelEngine.GetFuel = function(vehicle)
    return exports['Renewed-Fuel']:GetFuel(vehicle)
end

-- AddFuel function for Renewed-Fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports['Renewed-Fuel']:GetFuel(vehicle)
    return exports['Renewed-Fuel']:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for Renewed-Fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['Renewed-Fuel']:GetFuel(vehicle)
    return exports['Renewed-Fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
