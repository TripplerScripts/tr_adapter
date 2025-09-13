---@diagnostic disable: duplicate-set-field
-- qb-ambulance client compatibilities for tr_compatibilities
-- Assigns qb-ambulance specific functions to global AmbulanceEngine

-- RevivePlayer function for qb-ambulance
AmbulanceEngine.RevivePlayer = function(source)
    return exports['qb-ambulance']:RevivePlayer(source)
end

-- KillPlayer function for qb-ambulance
AmbulanceEngine.KillPlayer = function(source)
    return exports['qb-ambulance']:KillPlayer(source)
end

-- SetPlayerHealth function for qb-ambulance
AmbulanceEngine.SetPlayerHealth = function(source, health)
    return exports['qb-ambulance']:SetPlayerHealth(source, health)
end

-- GetPlayerHealth function for qb-ambulance
AmbulanceEngine.GetPlayerHealth = function(source)
    return exports['qb-ambulance']:GetPlayerHealth(source)
end
