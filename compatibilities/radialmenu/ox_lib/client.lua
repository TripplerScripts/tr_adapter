---@diagnostic disable: duplicate-set-field
-- ox_lib radialmenu client compatibilities for tr_compatibilities
-- Assigns ox_lib specific functions to global RadialMenuEngine

-- OpenMenu function for ox_lib (using radialMenu)
RadialMenuEngine.OpenMenu = function(data)
    return exports.ox_lib:radialMenu(data)
end

-- CloseMenu function for ox_lib (using hideRadial)
RadialMenuEngine.CloseMenu = function()
    return exports.ox_lib:hideRadial()
end
