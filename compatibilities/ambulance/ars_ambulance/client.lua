---@diagnostic disable: duplicate-set-field
-- ars_ambulance client compatibilities for tr_compatibilities
-- Assigns ars_ambulance specific functions to global AmbulanceEngine

-- RevivePlayer function for ars_ambulance
AmbulanceEngine.RevivePlayer = function(source)
    return exports.ars_ambulance:RevivePlayer(source)
end

-- KillPlayer function for ars_ambulance
AmbulanceEngine.KillPlayer = function(source)
    return exports.ars_ambulance:KillPlayer(source)
end

-- SetPlayerHealth function for ars_ambulance
AmbulanceEngine.SetPlayerHealth = function(source, health)
    return exports.ars_ambulance:SetPlayerHealth(source, health)
end

-- GetPlayerHealth function for ars_ambulance
AmbulanceEngine.GetPlayerHealth = function(source)
    return exports.ars_ambulance:GetPlayerHealth(source)
end
