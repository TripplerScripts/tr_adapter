---@diagnostic disable: duplicate-set-field
-- Renewed-Vehiclekeys client compatibilities for tr_compatibilities
-- Assigns Renewed-Vehiclekeys specific functions to global VehicleKeysEngine

-- GiveKeys function for Renewed-Vehiclekeys
VehicleKeysEngine.GiveKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:GiveKeys(source, plate)
end

-- RemoveKeys function for Renewed-Vehiclekeys
VehicleKeysEngine.RemoveKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:RemoveKeys(source, plate)
end

-- HasKeys function for Renewed-Vehiclekeys
VehicleKeysEngine.HasKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:HasKeys(source, plate)
end

-- GetVehicleKeys function for Renewed-Vehiclekeys
VehicleKeysEngine.GetVehicleKeys = function(source)
    return exports['Renewed-Vehiclekeys']:GetVehicleKeys(source)
end
