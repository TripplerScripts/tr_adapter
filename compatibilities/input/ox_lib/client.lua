---@diagnostic disable: duplicate-set-field
-- ox_lib input client compatibilities for tr_compatibilities
-- Assigns ox_lib specific functions to global InputEngine

-- ShowInput function for ox_lib (using inputDialog)
InputEngine.ShowInput = function(data)
    return exports.ox_lib:inputDialog(data.header or 'Input', data.rows or {})
end
