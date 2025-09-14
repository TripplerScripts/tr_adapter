---@diagnostic disable: duplicate-set-field
Inventory.Search = function(source, item, metadata)
    return exports.ox_inventory:Search(source, item, metadata)
end

Inventory.GetItem = function(source, item, metadata, returntable)
    return exports.ox_inventory:GetItem(source, item, metadata, returntable)
end

Inventory.GetItems = function(source, items, metadata)
    return exports.ox_inventory:GetItems(source, items, metadata)
end