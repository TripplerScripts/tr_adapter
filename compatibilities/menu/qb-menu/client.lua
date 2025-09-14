---@diagnostic disable: duplicate-set-field
Menu.OpenMenu = function(data)
    return exports['qb-menu']:openMenu(data)
end

Menu.CloseMenu = function()
    return exports['qb-menu']:closeMenu()
end

Menu.ShowHeader = function(data)
    return exports['qb-menu']:showHeader(data)
end