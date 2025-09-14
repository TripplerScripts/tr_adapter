---@diagnostic disable: duplicate-set-field
Input = {}

Input.ShowInput = function(data)
    print('No input resource available - ShowInput called', 'warn')
    return false
end