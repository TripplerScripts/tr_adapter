---@diagnostic disable: duplicate-set-field
RadialMenu.OpenMenu = function(data)
    return exports.ox_lib:radialMenu(data)
end

RadialMenu.CloseMenu = function()
    return exports.ox_lib:hideRadial()
end