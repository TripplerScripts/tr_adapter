---@diagnostic disable: duplicate-set-field
-- qb-vehiclekeys client compatibilities for tr_compatibilities
-- Assigns qb-vehiclekeys specific functions to global VehicleKeysEngine

-- GiveKeys function for qb-vehiclekeys
VehicleKeysEngine.GiveKeys = function(source, plate)
    return exports['qb-vehiclekeys']:GiveKeys(source, plate)
end

-- RemoveKeys function for qb-vehiclekeys
VehicleKeysEngine.RemoveKeys = function(source, plate)
    return exports['qb-vehiclekeys']:RemoveKeys(source, plate)
end

-- HasKeys function for qb-vehiclekeys
VehicleKeysEngine.HasKeys = function(source, plate)
    return exports['qb-vehiclekeys']:HasKeys(source, plate)
end

-- GetVehicleKeys function for qb-vehiclekeys
VehicleKeysEngine.GetVehicleKeys = function(source)
    return exports['qb-vehiclekeys']:GetVehicleKeys(source)
end
