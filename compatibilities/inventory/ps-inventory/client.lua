---@diagnostic disable: duplicate-set-field
---@version 1.1.0

Inventory.HasItem = function(items, amount)
  return exports['ps-inventory']:HasItem(items, amount)
end