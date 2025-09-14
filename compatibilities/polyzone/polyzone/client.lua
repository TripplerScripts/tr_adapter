---@diagnostic disable: duplicate-set-field
Polyzone.CreateZone = function(name, points, options)
    return exports.polyzone:CreateZone(name, points, options)
end

Polyzone.RemoveZone = function(name)
    return exports.polyzone:RemoveZone(name)
end