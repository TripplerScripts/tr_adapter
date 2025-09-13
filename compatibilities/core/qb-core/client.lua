---@diagnostic disable: duplicate-set-field
-- qb-core client compatibilities for tr_compatibilities
-- Assigns qb-core specific functions to global CoreEngine

-- GetCoreObject function for qb-core
CoreEngine.GetCoreObject = function()
    return exports['qb-core']:GetCoreObject()
end

-- GetPlayerData function for qb-core
CoreEngine.GetPlayerData = function()
    return exports['qb-core']:GetPlayerData()
end
