---@diagnostic disable: duplicate-set-field
VehicleKeys.GiveKeys = function(source, plate)
    print('hello')
    return exports.qbx_vehiclekeys:GiveKeys(source, plate)
end

VehicleKeys.RemoveKeys = function(source, plate)
    return exports.qbx_vehiclekeys:RemoveKeys(source, plate)
end

VehicleKeys.HasKeys = function(source, plate)
    return exports.qbx_vehiclekeys:HasKeys(source, plate)
end

VehicleKeys.GetVehicleKeys = function(source)
    return exports.qbx_vehiclekeys:GetVehicleKeys(source)
end