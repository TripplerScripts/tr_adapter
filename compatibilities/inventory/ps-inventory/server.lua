--[[ ---@diagnostic disable: duplicate-set-field
---@version 1.1.0

Inventory.LoadInventory = function (source, citizenid)
  return exports['ps-inventory']:LoadInventory(source, citizenid)
end

Inventory.SaveInventory = function (source, offline)
  exports['ps-inventory']:SaveInventory(source, offline)
end

Inventory.GetTotalWeight = function (items)
  return exports['ps-inventory']:GetTotalWeight(items)
end

Inventory.GetSlotsByItem = function (items, itemName)
  return exports['ps-inventory']:GetSlotsByItem(items, itemName)
end

Inventory.GetFirstSlotByItem = function (items, itemName)
  return exports['ps-inventory']:GetFirstSlotByItem(items, itemName)
end

Inventory.AddItem = function (source, item, amount, slot, info, _, created)
  return exports['ps-inventory']:AddItem(source, item, amount, slot, info, _, created)
end

Inventory.RemoveItem = function (source, item, amount, slot)
  return exports['ps-inventory']:RemoveItem(source, item, amount, slot)
end

Inventory.GetItemBySlot = function (source, slot)
  return exports['ps-inventory']:GetItemBySlot(source, slot)
end

Inventory.GetItemByName = function (source, item)
  return exports['ps-inventory']:GetItemByName(source, item)
end

Inventory.GetItemsByName = function (source, item)
  return exports['ps-inventory']:GetItemsByName(source, item)
end

Inventory.ClearInventory = function (source, filterItems)
  exports['ps-inventory']:ClearInventory(source, filterItems)
end

Inventory.SetInventory = function (source, items)
  exports['ps-inventory']:SetInventory(source, items)
end

Inventory.SetItemData = function (source, itemName, key, val)
  return exports['ps-inventory']:SetItemData(source, itemName, key, val)
end

Inventory.HasItem = function (items, amount)
  return exports['ps-inventory']:HasItem(items, amount)
end

Inventory.CreateUsableItem = function (itemName, data)
  exports['ps-inventory']:CreateUsableItem(itemName, data)
end

Inventory.GetUsableItem = function (itemName)
  return exports['ps-inventory']:GetUsableItem(itemName)
end

Inventory.UseItem = function (itemName, ...)
  exports['ps-inventory']:UseItem(itemName, ...)
end

Inventory.OpenInventory = function (name, id, other, origin)
  exports['ps-inventory']:OpenInventory(name, id, other, origin)
end

Inventory.OpenInventoryById = function (source, targetId)
  exports['ps-inventory']:OpenInventoryById(source, targetId)
end

Inventory.addTrunkItems = function (plate, items)
  exports['ps-inventory']:addTrunkItems(plate, items)
end

Inventory.addGloveboxItems = function (plate, items)
  exports['ps-inventory']:addGloveboxItems(plate, items)
end

Inventory.CreateShop = function (shopData)
  exports['ps-inventory']:CreateShop(shopData)
end

Inventory.OpenShop = function (source, name)
  exports['ps-inventory']:OpenShop(source, name)
end ]]