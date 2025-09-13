---@diagnostic disable: duplicate-set-field
-- Fuel Engine - Provides fallback functions for fuel compatibility

-- Create global FuelEngine with fallback functions
FuelEngine = {}

-- SetFuel fallback
FuelEngine.SetFuel = function(vehicle, fuel)
    Config.Log('No fuel resource available - SetFuel called', 'warn')
    return false
end

-- GetFuel fallback
FuelEngine.GetFuel = function(vehicle)
    Config.Log('No fuel resource available - GetFuel called', 'warn')
    return 0
end

-- AddFuel fallback
FuelEngine.AddFuel = function(vehicle, amount)
    Config.Log('No fuel resource available - AddFuel called', 'warn')
    return false
end

-- RemoveFuel fallback
FuelEngine.RemoveFuel = function(vehicle, amount)
    Config.Log('No fuel resource available - RemoveFuel called', 'warn')
    return false
end
