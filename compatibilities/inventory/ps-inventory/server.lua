---@diagnostic disable: duplicate-set-field
Inventory.GetInventory = function()
  return exports['ps-inventory']:TestInventory()
end