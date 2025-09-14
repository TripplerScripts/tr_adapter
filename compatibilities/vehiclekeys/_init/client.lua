---@diagnostic disable: duplicate-set-field
VehicleKeys = {}

VehicleKeys.GiveKeys = function(source, plate)
    print('No vehiclekeys resource available - GiveKeys called', 'warn')
    return false
end

VehicleKeys.RemoveKeys = function(source, plate)
    print('No vehiclekeys resource available - RemoveKeys called', 'warn')
    return false
end

VehicleKeys.HasKeys = function(source, plate)
    print('No vehiclekeys resource available - HasKeys called', 'warn')
    return false
end

VehicleKeys.GetVehicleKeys = function(source)
    print('No vehiclekeys resource available - GetVehicleKeys called', 'warn')
    return {}
end