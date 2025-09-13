---@diagnostic disable: duplicate-set-field
-- qb-input client compatibilities for tr_compatibilities
-- Assigns qb-input specific functions to global InputEngine

-- ShowInput function for qb-input
InputEngine.ShowInput = function(data)
    return exports['qb-input']:ShowInput(data)
end
