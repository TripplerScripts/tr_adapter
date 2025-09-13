---@diagnostic disable: duplicate-set-field
-- ox_lib polyzone client compatibilities for tr_compatibilities
-- Assigns ox_lib specific functions to global PolyzoneEngine

-- CreateZone function for ox_lib (using addPolyZone)
PolyzoneEngine.CreateZone = function(name, points, options)
    return exports.ox_lib:addPolyZone(name, points, options)
end

-- RemoveZone function for ox_lib (using removeZone)
PolyzoneEngine.RemoveZone = function(name)
    return exports.ox_lib:removeZone(name)
end
