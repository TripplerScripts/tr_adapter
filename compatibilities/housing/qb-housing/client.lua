---@diagnostic disable: duplicate-set-field
Housing.GetPlayerHouses = function(source)
    return exports['qb-housing']:GetPlayerHouses(source)
end

Housing.SetHouseOwner = function(houseId, citizenid)
    return exports['qb-housing']:SetHouseOwner(houseId, citizenid)
end

Housing.RemoveHouseOwner = function(houseId)
    return exports['qb-housing']:RemoveHouseOwner(houseId)
end

Housing.GetHouseData = function(houseId)
    return exports['qb-housing']:GetHouseData(houseId)
end