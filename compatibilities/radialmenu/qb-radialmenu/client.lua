---@diagnostic disable: duplicate-set-field
-- qb-radialmenu client compatibilities for tr_compatibilities
-- Assigns qb-radialmenu specific functions to global RadialMenuEngine

-- OpenMenu function for qb-radialmenu
RadialMenuEngine.OpenMenu = function(data)
    return exports['qb-radialmenu']:OpenMenu(data)
end

-- CloseMenu function for qb-radialmenu
RadialMenuEngine.CloseMenu = function()
    return exports['qb-radialmenu']:CloseMenu()
end
