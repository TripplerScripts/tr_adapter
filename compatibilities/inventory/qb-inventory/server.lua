---@diagnostic disable: duplicate-set-field
---@version 2.0.0

Inventory.LoadInventory = function (source, citizenid)
  return exports['qb-inventory']:LoadInventory(source, citizenid)
end

Inventory.SaveInventory = function (source, offline)
  return exports['qb-inventory']:SaveInventory(source, offline)
end

--- @param identifier string The identifier of the player or inventory.
--- @param items table The items to set in the inventory.
--- @param reason string The reason for setting the items.
Inventory.SetInventory = function (identifier, items, reason)
  return exports['qb-inventory']:SetInventory(identifier, items, reason)
end

--- @param source number The player's server ID.
--- @param itemName string The name of the item.
--- @param key string The key to set the value for.
--- @param val any The value to set for the key.
--- @param slot number (optional) The slot number of the item. If not provided, it will search by name.
--- @return boolean|nil - Returns true if the value was set successfully, false otherwise.
Inventory.SetItemData = function (source, itemName, key, val, slot)
  return exports['qb-inventory']:SetItemData(source, itemName, key, val, slot)
end

Inventory.UseItem = function (itemName, ...)
  return exports['qb-inventory']:UseItem(itemName, ...)
end

--- @param items table The table containing the items.
--- @param itemName string The name of the item to search for.
--- @return table A table containing the slots where the item was found.
Inventory.GetSlotsByItem = function (items, itemName)
  return exports['qb-inventory']:GetSlotsByItem(items, itemName)
end

--- @param items table The table of items to search through.
--- @param itemName string The name of the item to search for.
--- @return number|nil - The slot number of the first matching item, or nil if no match is found.
Inventory.GetFirstSlotByItem = function (items, itemName)
  return exports['qb-inventory']:GetFirstSlotByItem(items, itemName)
end

--- @param source number The player's server ID.
--- @param slot number The slot number of the item.
--- @return table|nil - item data if found, or nil if not found.
Inventory.GetItemBySlot = function (source, slot)
  return exports['qb-inventory']:GetItemBySlot(source, slot)
end

Inventory.GetTotalWeight = function (items)
  return exports['qb-inventory']:GetTotalWeight(items)
end

--- @param source number - The player's server ID.
--- @param item string - The name of the item to retrieve.
--- @return table|nil - item data if found, nil otherwise.
Inventory.GetItemByName = function (source, item)
  return exports['qb-inventory']:GetItemByName(source, item)
end

--- @param source number The player's server ID.
--- @param item string The name of the item to search for.
--- @return table|nil - containing the items with the specified name.
Inventory.GetItemsByName = function (source, item)
  return exports['qb-inventory']:GetItemsByName(source, item)
end

--- @param identifier number|string The player's identifier or the identifier of an inventory or drop.
--- @return number, number - The total count of used slots and the total count of free slots. If no inventory is found, returns 0 and the maximum slots.
Inventory.GetSlots = function (identifier)
  return exports['qb-inventory']:GetSlots(identifier)
end

--- @param source number The player's source ID.
--- @param items table|string The items to count. Can be either a table of item names or a single item name.
--- @return number|nil - The total count of the specified items.
Inventory.GetItemCount = function (source, items)
  return exports['qb-inventory']:GetItemCount(source, items)
end

--- @param identifier string The identifier of the player or inventory.
--- @param item string The item name.
--- @param amount number The amount of the item.
--- @return boolean - Returns true if the item can be added, false otherwise.
--- @return string|nil - Returns a string indicating the reason why the item cannot be added (e.g., 'weight' or 'slots'), or nil if it can be added.
Inventory.CanAddItem = function (identifier, item, amount)
  return exports['qb-inventory']:CanAddItem(identifier, item, amount)
end

--- @param source number The player's server ID.
--- @return number - Returns the free weight of the players inventory. Error will return 0
Inventory.GetFreeWeight = function (source)
  return exports['qb-inventory']:GetFreeWeight(source)
end

Inventory.ClearInventory = function (source, filterItems)
  return exports['qb-inventory']:ClearInventory(source, filterItems)
end

--- @param items string|table - The item(s) to check for. Can be a table of items or a single item as a string.
--- @param amount number [optional] - The minimum amount required for each item. If not provided, any amount greater than 0 will be considered.
--- @return boolean - Returns true if the player has the item(s) with the specified amount, false otherwise.
Inventory.HasItem = function (items, amount)
  return exports['qb-inventory']:HasItem(items, amount)
end

Inventory.CloseInventory = function (source, identifier)
  return exports['qb-inventory']:CloseInventory(source, identifier)
end

--- @param source number - The player's server ID.
--- @param targetId number - The ID of the player whose inventory will be opened.
Inventory.OpenInventoryById = function (source, targetId)
  return exports['qb-inventory']:OpenInventoryById(source, targetId)
end

--- @param identifier string
Inventory.ClearStash = function (identifier)
  return exports['qb-inventory']:ClearStash(identifier)
end

--- @param shopData table The data of the shop to create.
Inventory.CreateShop = function (shopData)
  return exports['qb-inventory']:CreateShop(shopData)
end

--- @param source number The player's server ID.
--- @param name string The identifier of the inventory to open.
Inventory.OpenShop = function (source, name)
  return exports['qb-inventory']:OpenShop(source, name)
end

--- @param source number The player's server ID.
--- @param identifier string|nil The identifier of the inventory to open.
--- @param data table|nil Additional data for initializing the inventory.
Inventory.OpenInventory = function (source, identifier, data)
  return exports['qb-inventory']:OpenInventory(source, identifier, data)
end

--- @param identifier string The identifier of the inventory to create.
--- @param data table Additional data for initializing the inventory.
Inventory.CreateInventory = function (identifier, data)
  return exports['qb-inventory']:CreateInventory(identifier, data)
end

--- @param identifier string The identifier of the inventory to retrieve.
--- @return table|nil - The inventory object if found, nil otherwise.
Inventory.GetInventory = function (identifier)
  return exports['qb-inventory']:GetInventory(identifier)
end

--- @param identifier string The identifier of the inventory to remove.
Inventory.RemoveInventory = function (identifier)
  return exports['qb-inventory']:RemoveInventory(identifier)
end

--- @param identifier string The identifier of the player or inventory.
--- @param item string The name of the item to add.
--- @param amount number The amount of the item to add.
--- @param slot number (optional) The slot to add the item to. If not provided, it will find the first available slot.
--- @param info table (optional) Additional information about the item.
--- @param reason string (optional) The reason for adding the item.
--- @return boolean Returns true if the item was successfully added, false otherwise.
Inventory.AddItem = function (identifier, item, amount, slot, info, reason)
  return exports['qb-inventory']:AddItem(identifier, item, amount, slot, info, reason)
end

--- @param identifier string - The identifier of the player.
--- @param item string - The name of the item to remove.
--- @param amount number - The amount of the item to remove.
--- @param slot number - The slot number of the item in the inventory. If not provided, it will find the first slot with the item.
--- @param reason string - The reason for removing the item. Defaults to 'No reason specified' if not provided.
--- @return boolean - Returns true if the item was successfully removed, false otherwise.
Inventory.RemoveItem = function (identifier, item, amount, slot, reason)
  return exports['qb-inventory']:RemoveItem(identifier, item, amount, slot, reason)
end