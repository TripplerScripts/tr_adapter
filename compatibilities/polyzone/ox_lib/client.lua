---@diagnostic disable: duplicate-set-field
Polyzone.CreateZone = function(name, points, options)
    return exports.ox_lib:addPolyZone(name, points, options)
end

Polyzone.RemoveZone = function(name)
    return exports.ox_lib:removeZone(name)
end