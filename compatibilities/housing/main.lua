---@diagnostic disable: duplicate-set-field
-- Housing Engine - Provides fallback functions for housing compatibility

-- Create global HousingEngine with fallback functions
HousingEngine = {}

-- GetPlayerHouses fallback
HousingEngine.GetPlayerHouses = function(source)
    Config.Log('No housing resource available - GetPlayerHouses called', 'warn')
    return {}
end

-- SetHouseOwner fallback
HousingEngine.SetHouseOwner = function(houseId, citizenid)
    Config.Log('No housing resource available - SetHouseOwner called', 'warn')
    return false
end

-- RemoveHouseOwner fallback
HousingEngine.RemoveHouseOwner = function(houseId)
    Config.Log('No housing resource available - RemoveHouseOwner called', 'warn')
    return false
end

-- GetHouseData fallback
HousingEngine.GetHouseData = function(houseId)
    Config.Log('No housing resource available - GetHouseData called', 'warn')
    return nil
end
