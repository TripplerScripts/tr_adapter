---@diagnostic disable: duplicate-set-field
-- ox_inventory server compatibilities for tr_compatibilities
-- Assigns ox_inventory specific functions to global InventoryEngine

-- AddItem function for ox_inventory (server)
InventoryEngine.AddItem = function(source, item, count, metadata, slot)
    return exports.ox_inventory:AddItem(source, item, count, metadata, slot)
end

-- RemoveItem function for ox_inventory (server)
InventoryEngine.RemoveItem = function(source, item, count, metadata, slot)
    return exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
end

-- CanCarryItem function for ox_inventory (server)
InventoryEngine.CanCarryItem = function(source, item, count, metadata)
    return exports.ox_inventory:CanCarryItem(source, item, count, metadata)
end

-- GetInventory function for ox_inventory (server)
InventoryEngine.GetInventory = function(source)
    return exports.ox_inventory:GetInventory(source)
end
