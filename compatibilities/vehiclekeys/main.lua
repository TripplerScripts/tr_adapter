---@diagnostic disable: duplicate-set-field
-- VehicleKeys Engine - Provides fallback functions for vehiclekeys compatibility

-- Create global VehicleKeysEngine with fallback functions
VehicleKeysEngine = {}

-- GiveKeys fallback
VehicleKeysEngine.GiveKeys = function(source, plate)
    Config.Log('No vehiclekeys resource available - GiveKeys called', 'warn')
    return false
end

-- RemoveKeys fallback
VehicleKeysEngine.RemoveKeys = function(source, plate)
    Config.Log('No vehiclekeys resource available - RemoveKeys called', 'warn')
    return false
end

-- HasKeys fallback
VehicleKeysEngine.HasKeys = function(source, plate)
    Config.Log('No vehiclekeys resource available - HasKeys called', 'warn')
    return false
end

-- GetVehicleKeys fallback
VehicleKeysEngine.GetVehicleKeys = function(source)
    Config.Log('No vehiclekeys resource available - GetVehicleKeys called', 'warn')
    return {}
end
