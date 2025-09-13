---@diagnostic disable: duplicate-set-field
-- cdn-fuel client compatibilities for tr_compatibilities
-- Assigns cdn-fuel specific functions to global FuelEngine

-- SetFuel function for cdn-fuel
FuelEngine.SetFuel = function(vehicle, fuel)
    return exports['cdn-fuel']:SetFuel(vehicle, fuel)
end

-- GetFuel function for cdn-fuel
FuelEngine.GetFuel = function(vehicle)
    return exports['cdn-fuel']:GetFuel(vehicle)
end

-- AddFuel function for cdn-fuel
FuelEngine.AddFuel = function(vehicle, amount)
    local currentFuel = exports['cdn-fuel']:GetFuel(vehicle)
    return exports['cdn-fuel']:SetFuel(vehicle, currentFuel + amount)
end

-- RemoveFuel function for cdn-fuel
FuelEngine.RemoveFuel = function(vehicle, amount)
    local currentFuel = exports['cdn-fuel']:GetFuel(vehicle)
    return exports['cdn-fuel']:SetFuel(vehicle, math.max(0, currentFuel - amount))
end
