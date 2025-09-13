---@diagnostic disable: duplicate-set-field
-- ox_lib menu client compatibilities for tr_compatibilities
-- Assigns ox_lib specific functions to global MenuEngine

-- OpenMenu function for ox_lib (using registerContext)
MenuEngine.OpenMenu = function(data)
    return exports.ox_lib:registerContext(data)
end

-- CloseMenu function for ox_lib (using hideContext)
MenuEngine.CloseMenu = function()
    return exports.ox_lib:hideContext()
end

-- ShowHeader function for ox_lib (using showContext)
MenuEngine.ShowHeader = function(data)
    return exports.ox_lib:showContext(data.id or 'default')
end
