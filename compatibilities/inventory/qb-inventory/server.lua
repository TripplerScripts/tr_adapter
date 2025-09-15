---@diagnostic disable: duplicate-set-field
Inventory.GetInventory = function()
    return exports['qb-inventory']:TestInventory()
end
print(true)
UniqueFunctions = {
    'QBUniqueFunction_A',
    'QBUniqueFunction_B',
}