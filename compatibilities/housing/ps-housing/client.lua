---@diagnostic disable: duplicate-set-field
-- ps-housing client compatibilities for tr_compatibilities
-- Assigns ps-housing specific functions to global HousingEngine

-- GetPlayerHouses function for ps-housing
HousingEngine.GetPlayerHouses = function(source)
    return exports['ps-housing']:GetPlayerHouses(source)
end

-- SetHouseOwner function for ps-housing
HousingEngine.SetHouseOwner = function(houseId, citizenid)
    return exports['ps-housing']:SetHouseOwner(houseId, citizenid)
end

-- RemoveHouseOwner function for ps-housing
HousingEngine.RemoveHouseOwner = function(houseId)
    return exports['ps-housing']:RemoveHouseOwner(houseId)
end

-- GetHouseData function for ps-housing
HousingEngine.GetHouseData = function(houseId)
    return exports['ps-housing']:GetHouseData(houseId)
end
