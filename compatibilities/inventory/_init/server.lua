---@diagnostic disable: duplicate-set-field
Inventory = {}

Inventory.Search = function(source, item, metadata)
    print('No inventory resource available - Search called', 'warn')
    return 0
end

Inventory.GetItem = function(source, item, metadata, returntable)
    print('No inventory resource available - GetItem called', 'warn')
    return nil
end

Inventory.GetItems = function(source, items, metadata)
    print('No inventory resource available - GetItems called', 'warn')
    return {}
end

Inventory.AddItem = function(source, item, count, metadata, slot)
    print('No inventory resource available - AddItem called', 'warn')
    return false
end

Inventory.RemoveItem = function(source, item, count, metadata, slot)
    print('No inventory resource available - RemoveItem called', 'warn')
    return false
end

Inventory.CanCarryItem = function(source, item, count, metadata)
    print('No inventory resource available - CanCarryItem called', 'warn')
    return false
end

Inventory.GetInventory = function(source)
    print('No inventory resource available - GetInventory called', 'warn')
    return {}
end