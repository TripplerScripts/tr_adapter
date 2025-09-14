---@diagnostic disable: duplicate-set-field
VehicleKeys.GiveKeys = function(source, plate)
    return exports['qb-vehiclekeys']:GiveKeys(source, plate)
end

VehicleKeys.RemoveKeys = function(source, plate)
    return exports['qb-vehiclekeys']:RemoveKeys(source, plate)
end

VehicleKeys.HasKeys = function(source, plate)
    return exports['qb-vehiclekeys']:HasKeys(source, plate)
end

VehicleKeys.GetVehicleKeys = function(source)
    return exports['qb-vehiclekeys']:GetVehicleKeys(source)
end