---@diagnostic disable: duplicate-set-field
-- Inventory Engine - Provides fallback functions for inventory compatibility

-- Create global InventoryEngine with fallback functions
InventoryEngine = {}

-- Client-side functions
InventoryEngine.Search = function(source, item, metadata)
    Config.Log('No inventory resource available - Search called', 'warn')
    return 0
end

InventoryEngine.GetItem = function(source, item, metadata, returntable)
    Config.Log('No inventory resource available - GetItem called', 'warn')
    return nil
end

InventoryEngine.GetItems = function(source, items, metadata)
    Config.Log('No inventory resource available - GetItems called', 'warn')
    return {}
end

-- Server-side functions
InventoryEngine.AddItem = function(source, item, count, metadata, slot)
    Config.Log('No inventory resource available - AddItem called', 'warn')
    return false
end

InventoryEngine.RemoveItem = function(source, item, count, metadata, slot)
    Config.Log('No inventory resource available - RemoveItem called', 'warn')
    return false
end

InventoryEngine.CanCarryItem = function(source, item, count, metadata)
    Config.Log('No inventory resource available - CanCarryItem called', 'warn')
    return false
end

InventoryEngine.GetInventory = function(source)
    Config.Log('No inventory resource available - GetInventory called', 'warn')
    return {}
end
