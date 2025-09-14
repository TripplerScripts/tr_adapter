---@diagnostic disable: duplicate-set-field
Input.ShowInput = function(data)
    return exports.ox_lib:inputDialog(data.header or 'Input', data.rows or {})
end