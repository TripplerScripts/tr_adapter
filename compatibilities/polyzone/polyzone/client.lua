---@diagnostic disable: duplicate-set-field
-- polyzone client compatibilities for tr_compatibilities
-- Assigns polyzone specific functions to global PolyzoneEngine

-- CreateZone function for polyzone
PolyzoneEngine.CreateZone = function(name, points, options)
    return exports.polyzone:CreateZone(name, points, options)
end

-- RemoveZone function for polyzone
PolyzoneEngine.RemoveZone = function(name)
    return exports.polyzone:RemoveZone(name)
end
