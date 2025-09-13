---@diagnostic disable: duplicate-set-field
-- qbx_core server compatibilities for tr_compatibilities
-- Assigns qbx_core specific functions to global CoreEngine

-- GetPlayer function for qbx_core (server)
CoreEngine.GetPlayer = function(source)
    return exports.qbx_core:GetPlayer(source)
end

-- GetPlayerByCitizenId function for qbx_core (server)
CoreEngine.GetPlayerByCitizenId = function(citizenid)
    return exports.qbx_core:GetPlayerByCitizenId(citizenid)
end
