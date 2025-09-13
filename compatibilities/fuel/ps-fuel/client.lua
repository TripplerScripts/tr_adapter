---@diagnostic disable: duplicate-set-field
-- ps-fuel client compatibilities for tr_compatibilities
-- Assigns ps-fuel specific functions to global FuelEngine

-- SetFuel function for ps-fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports['ps-fuel']:SetFuel(vehicle, fuel)
end

-- GetFuel function for ps-fuel
FuelEngine.GetFuel = function(vehicle)
    return exports['ps-fuel']:GetFuel(vehicle)
end

-- AddFuel function for ps-fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports['ps-fuel']:GetFuel(vehicle)
    return exports['ps-fuel']:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for ps-fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['ps-fuel']:GetFuel(vehicle)
    return exports['ps-fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
