---@diagnostic disable: duplicate-set-field
Ambulance.RevivePlayer = function(source)
    return exports.ars_ambulance:RevivePlayer(source)
end

Ambulance.KillPlayer = function(source)
    return exports.ars_ambulance:KillPlayer(source)
end

Ambulance.SetPlayerHealth = function(source, health)
    return exports.ars_ambulance:SetPlayerHealth(source, health)
end

Ambulance.GetPlayerHealth = function(source)
    return exports.ars_ambulance:GetPlayerHealth(source)
end