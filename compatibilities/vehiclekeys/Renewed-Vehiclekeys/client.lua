---@diagnostic disable: duplicate-set-field
VehicleKeys.GiveKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:GiveKeys(source, plate)
end

VehicleKeys.RemoveKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:RemoveKeys(source, plate)
end

VehicleKeys.HasKeys = function(source, plate)
    return exports['Renewed-Vehiclekeys']:HasKeys(source, plate)
end

VehicleKeys.GetVehicleKeys = function(source)
    return exports['Renewed-Vehiclekeys']:GetVehicleKeys(source)
end