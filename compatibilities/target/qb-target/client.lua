---@diagnostic disable: duplicate-set-field
-- qb-target client compatibilities for tr_compatibilities
-- Assigns qb-target specific functions to global TargetEngine

-- AddBoxZone function for qb-target
TargetEngine.AddBoxZone = function(name, center, length, width, options, targetoptions)
    return exports['qb-target']:AddBoxZone(name, center, length, width, options, targetoptions)
end

-- AddCircleZone function for qb-target
TargetEngine.AddCircleZone = function(name, center, radius, options, targetoptions)
    return exports['qb-target']:AddCircleZone(name, center, radius, options, targetoptions)
end

-- AddPolyZone function for qb-target
TargetEngine.AddPolyZone = function(name, points, options, targetoptions)
    return exports['qb-target']:AddPolyZone(name, points, options, targetoptions)
end

-- AddTargetEntity function for qb-target
TargetEngine.AddTargetEntity = function(entities, options)
    return exports['qb-target']:AddTargetEntity(entities, options)
end

-- AddTargetModel function for qb-target
TargetEngine.AddTargetModel = function(models, options)
    return exports['qb-target']:AddTargetModel(models, options)
end

-- RemoveZone function for qb-target
TargetEngine.RemoveZone = function(name)
    return exports['qb-target']:RemoveZone(name)
end
