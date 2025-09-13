---@diagnostic disable: duplicate-set-field
-- qbx_core client compatibilities for tr_compatibilities
-- Assigns qbx_core specific functions to global CoreEngine

-- GetCoreObject function for qbx_core
CoreEngine.GetCoreObject = function()
    return exports.qbx_core:GetCoreObject()
end

-- GetPlayerData function for qbx_core
CoreEngine.GetPlayerData = function()
    return exports.qbx_core:GetPlayerData()
end
