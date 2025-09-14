---@diagnostic disable: duplicate-set-field
Menu = {}

Menu.OpenMenu = function(data)
    print('No menu resource available - OpenMenu called', 'warn')
    return {}
end

Menu.CloseMenu = function()
    print('No menu resource available - CloseMenu called', 'warn')
    return false
end

Menu.ShowHeader = function(data)
    print('No menu resource available - ShowHeader called', 'warn')
    return {}
end