---@diagnostic disable: duplicate-set-field
-- qb-inventory client compatibilities for tr_compatibilities
-- Assigns qb-inventory specific functions to global InventoryEngine

-- Search function for qb-inventory (client)
InventoryEngine.Search = function(source, item, metadata)
    return exports['qb-inventory']:Search(source, item, metadata)
end

-- GetItem function for qb-inventory (client)
InventoryEngine.GetItem = function(source, item, metadata, returntable)
    return exports['qb-inventory']:GetItem(source, item, metadata, returntable)
end

-- GetItems function for qb-inventory (client)
InventoryEngine.GetItems = function(source, items, metadata)
    return exports['qb-inventory']:GetItems(source, items, metadata)
end
