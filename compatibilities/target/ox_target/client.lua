---@diagnostic disable: duplicate-set-field
Target.AddBoxZone = function(name, center, length, width, options, targetoptions)
    return exports.ox_target:addBoxZone(name, center, length, width, options, targetoptions)
end

Target.AddCircleZone = function(name, center, radius, options, targetoptions)
    return exports.ox_target:addSphereZone(name, center, radius, options, targetoptions)
end

Target.AddPolyZone = function(name, points, options, targetoptions)
    return exports.ox_target:addPolyZone(name, points, options, targetoptions)
end

Target.AddTargetEntity = function(entities, options)
    return exports.ox_target:addLocalEntity(entities, options)
end

Target.AddTargetModel = function(models, options)
    return exports.ox_target:addModel(models, options)
end

Target.RemoveZone = function(name)
    return exports.ox_target:removeZone(name)
end