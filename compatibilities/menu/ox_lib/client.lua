---@diagnostic disable: duplicate-set-field
Menu.OpenMenu = function(data)
    return exports.ox_lib:registerContext(data)
end

Menu.CloseMenu = function()
    return exports.ox_lib:hideContext()
end

Menu.ShowHeader = function(data)
    return exports.ox_lib:showContext(data.id or 'default')
end