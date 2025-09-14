---@diagnostic disable: duplicate-set-field
Inventory.GetInventory = function(inv, owner)
    return exports.ox_inventory:GetInventory(inv, owner)
end