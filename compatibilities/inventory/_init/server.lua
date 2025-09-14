---@diagnostic disable: duplicate-set-field
Inventory = {}

Inventory.GetInventory = function()
    print('No inventory resource available - GetInventory called', 'warn')
    return {}
end

AddEventHandler('__cfx_export_qb-inventory_GetInventory', function(setCB)
    setCB(function()
        return 1
    end)
end)