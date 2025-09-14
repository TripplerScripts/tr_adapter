---@diagnostic disable: duplicate-set-field
Housing.GetPlayerHouses = function(source)
    return exports['ps-housing']:GetPlayerHouses(source)
end

Housing.SetHouseOwner = function(houseId, citizenid)
    return exports['ps-housing']:SetHouseOwner(houseId, citizenid)
end

Housing.RemoveHouseOwner = function(houseId)
    return exports['ps-housing']:RemoveHouseOwner(houseId)
end

Housing.GetHouseData = function(houseId)
    return exports['ps-housing']:GetHouseData(houseId)
end