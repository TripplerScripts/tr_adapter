---@diagnostic disable: duplicate-set-field
-- qb-housing client compatibilities for tr_compatibilities
-- Assigns qb-housing specific functions to global HousingEngine

-- GetPlayerHouses function for qb-housing
HousingEngine.GetPlayerHouses = function(source)
    return exports['qb-housing']:GetPlayerHouses(source)
end

-- SetHouseOwner function for qb-housing
HousingEngine.SetHouseOwner = function(houseId, citizenid)
    return exports['qb-housing']:SetHouseOwner(houseId, citizenid)
end

-- RemoveHouseOwner function for qb-housing
HousingEngine.RemoveHouseOwner = function(houseId)
    return exports['qb-housing']:RemoveHouseOwner(houseId)
end

-- GetHouseData function for qb-housing
HousingEngine.GetHouseData = function(houseId)
    return exports['qb-housing']:GetHouseData(houseId)
end
