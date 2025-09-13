---@diagnostic disable: duplicate-set-field
-- ox_target client compatibilities for tr_compatibilities
-- Assigns ox_target specific functions to global TargetEngine

-- AddBoxZone function for ox_target
TargetEngine.AddBoxZone = function(name, center, length, width, options, targetoptions)
    return exports.ox_target:addBoxZone(name, center, length, width, options, targetoptions)
end

-- AddCircleZone function for ox_target
TargetEngine.AddCircleZone = function(name, center, radius, options, targetoptions)
    return exports.ox_target:addSphereZone(name, center, radius, options, targetoptions)
end

-- AddPolyZone function for ox_target
TargetEngine.AddPolyZone = function(name, points, options, targetoptions)
    return exports.ox_target:addPolyZone(name, points, options, targetoptions)
end

-- AddTargetEntity function for ox_target
TargetEngine.AddTargetEntity = function(entities, options)
    return exports.ox_target:addLocalEntity(entities, options)
end

-- AddTargetModel function for ox_target
TargetEngine.AddTargetModel = function(models, options)
    return exports.ox_target:addModel(models, options)
end

-- RemoveZone function for ox_target
TargetEngine.RemoveZone = function(name)
    return exports.ox_target:removeZone(name)
end
