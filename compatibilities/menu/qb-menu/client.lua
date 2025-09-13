---@diagnostic disable: duplicate-set-field
-- qb-menu client compatibilities for tr_compatibilities
-- Assigns qb-menu specific functions to global MenuEngine

-- OpenMenu function for qb-menu
MenuEngine.OpenMenu = function(data)
    return exports['qb-menu']:openMenu(data)
end

-- CloseMenu function for qb-menu
MenuEngine.CloseMenu = function()
    return exports['qb-menu']:closeMenu()
end

-- ShowHeader function for qb-menu
MenuEngine.ShowHeader = function(data)
    return exports['qb-menu']:showHeader(data)
end
