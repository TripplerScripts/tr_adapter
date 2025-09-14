---@diagnostic disable: duplicate-set-field
Ambulance.RevivePlayer = function(source)
    return exports['qb-ambulance']:RevivePlayer(source)
end

Ambulance.KillPlayer = function(source)
    return exports['qb-ambulance']:KillPlayer(source)
end

Ambulance.SetPlayerHealth = function(source, health)
    return exports['qb-ambulance']:SetPlayerHealth(source, health)
end

Ambulance.GetPlayerHealth = function(source)
    return exports['qb-ambulance']:GetPlayerHealth(source)
end