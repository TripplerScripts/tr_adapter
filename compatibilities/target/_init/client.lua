---@diagnostic disable: duplicate-set-field
Target = {}

Target.AddBoxZone = function(name, center, length, width, options, targetoptions)
    print('No target resource available - AddBoxZone called', 'warn')
    return false
end

Target.AddCircleZone = function(name, center, radius, options, targetoptions)
    print('No target resource available - AddCircleZone called', 'warn')
    return false
end

Target.AddPolyZone = function(name, points, options, targetoptions)
    print('No target resource available - AddPolyZone called', 'warn')
    return false
end

Target.AddTargetEntity = function(entities, options)
    print('No target resource available - AddTargetEntity called', 'warn')
    return false
end

Target.AddTargetModel = function(models, options)
    print('No target resource available - AddTargetModel called', 'warn')
    return false
end

Target.RemoveZone = function(name)
    print('No target resource available - RemoveZone called', 'warn')
    return false
end