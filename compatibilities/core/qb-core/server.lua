---@diagnostic disable: duplicate-set-field
-- qb-core server compatibilities for tr_compatibilities
-- Assigns qb-core specific functions to global CoreEngine

-- GetPlayer function for qb-core (server)
CoreEngine.GetPlayer = function(source)
    return exports['qb-core']:GetPlayer(source)
end

-- GetPlayerByCitizenId function for qb-core (server)
CoreEngine.GetPlayerByCitizenId = function(citizenid)
    return exports['qb-core']:GetPlayerByCitizenId(citizenid)
end
