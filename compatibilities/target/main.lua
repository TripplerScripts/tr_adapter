---@diagnostic disable: duplicate-set-field
-- Target Engine - Provides fallback functions for target compatibility

-- Create global TargetEngine with fallback functions
TargetEngine = {}

-- AddBoxZone fallback
TargetEngine.AddBoxZone = function(name, center, length, width, options, targetoptions)
    Config.Log('No target resource available - AddBoxZone called', 'warn')
    return false
end

-- AddCircleZone fallback
TargetEngine.AddCircleZone = function(name, center, radius, options, targetoptions)
    Config.Log('No target resource available - AddCircleZone called', 'warn')
    return false
end

-- AddPolyZone fallback
TargetEngine.AddPolyZone = function(name, points, options, targetoptions)
    Config.Log('No target resource available - AddPolyZone called', 'warn')
    return false
end

-- AddTargetEntity fallback
TargetEngine.AddTargetEntity = function(entities, options)
    Config.Log('No target resource available - AddTargetEntity called', 'warn')
    return false
end

-- AddTargetModel fallback
TargetEngine.AddTargetModel = function(models, options)
    Config.Log('No target resource available - AddTargetModel called', 'warn')
    return false
end

-- RemoveZone fallback
TargetEngine.RemoveZone = function(name)
    Config.Log('No target resource available - RemoveZone called', 'warn')
    return false
end
