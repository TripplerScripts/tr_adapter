---@diagnostic disable: duplicate-set-field
Inventory.Search = function(source, item, metadata)
    return exports['qb-inventory']:Search(source, item, metadata)
end

Inventory.GetItem = function(source, item, metadata, returntable)
    return exports['qb-inventory']:GetItem(source, item, metadata, returntable)
end

Inventory.GetItems = function(source, items, metadata)
    return exports['qb-inventory']:GetItems(source, items, metadata)
end