---@diagnostic disable: duplicate-set-field
-- ox_inventory client compatibilities for tr_compatibilities
-- Assigns ox_inventory specific functions to global InventoryEngine

-- Search function for ox_inventory (client)
InventoryEngine.Search = function(source, item, metadata)
    return exports.ox_inventory:Search(source, item, metadata)
end

-- GetItem function for ox_inventory (client)
InventoryEngine.GetItem = function(source, item, metadata, returntable)
    return exports.ox_inventory:GetItem(source, item, metadata, returntable)
end

-- GetItems function for ox_inventory (client)
InventoryEngine.GetItems = function(source, items, metadata)
    return exports.ox_inventory:GetItems(source, items, metadata)
end
