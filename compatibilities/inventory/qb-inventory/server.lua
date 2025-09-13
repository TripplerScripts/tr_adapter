---@diagnostic disable: duplicate-set-field
-- qb-inventory server compatibilities for tr_compatibilities
-- Assigns qb-inventory specific functions to global InventoryEngine

-- AddItem function for qb-inventory (server)
InventoryEngine.AddItem = function(source, item, count, metadata, slot)
    return exports['qb-inventory']:AddItem(source, item, count, metadata, slot)
end

-- RemoveItem function for qb-inventory (server)
InventoryEngine.RemoveItem = function(source, item, count, metadata, slot)
    return exports['qb-inventory']:RemoveItem(source, item, count, metadata, slot)
end

-- CanCarryItem function for qb-inventory (server)
InventoryEngine.CanCarryItem = function(source, item, count, metadata)
    return exports['qb-inventory']:CanCarryItem(source, item, count, metadata)
end

-- GetInventory function for qb-inventory (server)
InventoryEngine.GetInventory = function(source)
    return exports['qb-inventory']:GetInventory(source)
end
