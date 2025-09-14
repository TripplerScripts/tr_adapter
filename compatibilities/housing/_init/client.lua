---@diagnostic disable: duplicate-set-field
Housing = {}

Housing.GetPlayerHouses = function(source)
    print('No housing resource available - GetPlayerHouses called', 'warn')
    return {}
end

Housing.SetHouseOwner = function(houseId, citizenid)
    print('No housing resource available - SetHouseOwner called', 'warn')
    return false
end

Housing.RemoveHouseOwner = function(houseId)
    print('No housing resource available - RemoveHouseOwner called', 'warn')
    return false
end

Housing.GetHouseData = function(houseId)
    print('No housing resource available - GetHouseData called', 'warn')
    return nil
end