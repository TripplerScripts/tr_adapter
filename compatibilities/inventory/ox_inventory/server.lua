---@diagnostic disable: duplicate-set-field
Inventory.AddItem = function(source, item, count, metadata, slot)
    return exports.ox_inventory:AddItem(source, item, count, metadata, slot)
end

Inventory.RemoveItem = function(source, item, count, metadata, slot)
    return exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
end

Inventory.CanCarryItem = function(source, item, count, metadata)
    return exports.ox_inventory:CanCarryItem(source, item, count, metadata)
end

Inventory.GetInventory = function(source)
    return exports.ox_inventory:GetInventory(source)
end