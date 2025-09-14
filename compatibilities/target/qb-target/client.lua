---@diagnostic disable: duplicate-set-field
Target.AddBoxZone = function(name, center, length, width, options, targetoptions)
    return exports['qb-target']:AddBoxZone(name, center, length, width, options, targetoptions)
end

Target.AddCircleZone = function(name, center, radius, options, targetoptions)
    return exports['qb-target']:AddCircleZone(name, center, radius, options, targetoptions)
end

Target.AddPolyZone = function(name, points, options, targetoptions)
    return exports['qb-target']:AddPolyZone(name, points, options, targetoptions)
end

Target.AddTargetEntity = function(entities, options)
    return exports['qb-target']:AddTargetEntity(entities, options)
end

Target.AddTargetModel = function(models, options)
    return exports['qb-target']:AddTargetModel(models, options)
end

Target.RemoveZone = function(name)
    return exports['qb-target']:RemoveZone(name)
end