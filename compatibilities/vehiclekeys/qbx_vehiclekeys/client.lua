---@diagnostic disable: duplicate-set-field
-- qbx_vehiclekeys client compatibilities for tr_compatibilities
-- Assigns qbx_vehiclekeys specific functions to global VehicleKeysEngine

-- GiveKeys function for qbx_vehiclekeys
VehicleKeysEngine.GiveKeys = function(source, plate)
    return exports.qbx_vehiclekeys:GiveKeys(source, plate)
end

-- RemoveKeys function for qbx_vehiclekeys
VehicleKeysEngine.RemoveKeys = function(source, plate)
    return exports.qbx_vehiclekeys:RemoveKeys(source, plate)
end

-- HasKeys function for qbx_vehiclekeys
VehicleKeysEngine.HasKeys = function(source, plate)
    return exports.qbx_vehiclekeys:HasKeys(source, plate)
end

-- GetVehicleKeys function for qbx_vehiclekeys
VehicleKeysEngine.GetVehicleKeys = function(source)
    return exports.qbx_vehiclekeys:GetVehicleKeys(source)
end
