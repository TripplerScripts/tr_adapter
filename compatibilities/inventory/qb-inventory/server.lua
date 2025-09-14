---@diagnostic disable: duplicate-set-field
Inventory.AddItem = function(source, item, count, metadata, slot)
    return exports['qb-inventory']:AddItem(source, item, count, metadata, slot)
end

Inventory.RemoveItem = function(source, item, count, metadata, slot)
    return exports['qb-inventory']:RemoveItem(source, item, count, metadata, slot)
end

Inventory.CanCarryItem = function(source, item, count, metadata)
    return exports['qb-inventory']:CanCarryItem(source, item, count, metadata)
end

Inventory.GetInventory = function(source)
    return exports['qb-inventory']:GetInventory(source)
end