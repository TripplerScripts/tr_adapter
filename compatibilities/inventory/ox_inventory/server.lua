---@diagnostic disable: duplicate-set-field
Inventory.GetPlayer = function()
    return exports.ox_inventory:PlayerInfo()
end