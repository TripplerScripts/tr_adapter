---@diagnostic disable: duplicate-set-field
---@version 2.44.6

Inventory.GetCurrentWeapon = function(inv)
  return exports.ox_inventory:getCurrentWeapon(inv)
end

Inventory.SetStashTarget = function(id, owner)
  return exports.ox_inventory:setStashTarget(id, owner)
end

---@param inv string?
---@param data any?
---@return boolean?
Inventory.OpenInventory = function(inv, data)
  return exports.ox_inventory:openInventory(inv, data)
end

---@param data table
---@param cb fun(response: SlotWithItem | false)?
---@param noAnim? boolean
Inventory.UseItem = function(data, cb, noAnim)
  return exports.ox_inventory:useItem(data, cb, noAnim)
end

---@param slot number
---@return boolean?
Inventory.UseSlot = function(slot, noAnim)
  return exports.ox_inventory:useSlot(slot, noAnim)
end

Inventory.OpenNearbyInventory = function()
  return exports.ox_inventory:openNearbyInventory()
end

Inventory.CloseInventory = function(server)
  return exports.ox_inventory:closeInventory(server)
end

Inventory.GiveItemToTarget = function(serverId, slotId, count)
  return exports.ox_inventory:giveItemToTarget(serverId, slotId, count)
end

---@param search 'slots' | 1 | 'count' | 2
---@param item table | string
---@param metadata? table | string
Inventory.Search = function(search, item, metadata)
  return exports.ox_inventory:Search(search, item, metadata)
end

---@return ? PlayerData.inventory
Inventory.GetPlayerItems = function()
  return exports.ox_inventory:GetPlayerItems()
end

---@return ? PlayerData.weight
Inventory.GetPlayerWeight = function()
  return exports.ox_inventory:GetPlayerWeight()
end

---@return ? PlayerData.maxWeight
Inventory.GetPlayerMaxWeight = function()
  return exports.ox_inventory:GetPlayerMaxWeight()
end

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return SlotWithItem?
Inventory.GetSlotIdWithItem = function(itemName, metadata, strict)
  return exports.ox_inventory:GetSlotIdWithItem(itemName, metadata, strict)
end

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return SlotWithItem[]?
Inventory.GetSlotsWithItem = function()
  return exports.ox_inventory:GetSlotsWithItem(itemName, metadata, strict)
end

---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number
Inventory.GetItemCount = function(itemName, metadata, strict)
  return exports.ox_inventory:GetItemCount(itemName, metadata, strict)
end

--- use array of single key value pairs to dictate order
---@param metadata string | table<string, string> | table<string, string>[]
---@param value? string
Inventory.DisplayMetadata = function(metadata, value)
  return exports.ox_inventory:displayMetadata(metadata, value)
end

---@param _ table?
---@param name string?
---@return table?
Inventory.Items = function(_, name)
  return exports.ox_inventory:Items(_, name)
end

---@param _ table?
---@param name string?
---@return table?
Inventory.ItemList = function(_, name)
  return exports.ox_inventory:ItemList(_, name)
end

---@param data table
Inventory.Notify = function(data)
  return exports.ox_inventory:notify(data)
end

---@param value boolean
Inventory.SuppressItemNotifications = function(value)
  return exports.ox_inventory:suppressItemNotifications(value)
end

---@param state boolean
Inventory.WeaponWheel = function(state)
  return exports.ox_inventory:weaponWheel(state)
end

Inventory.Keyboard = function()
  return exports.ox_inventory:Keyboard()
end

Inventory.Progress = function(options, completed)
  return exports.ox_inventory:Progress(options, completed)
end

Inventory.CancelProgress = function()
  return exports.ox_inventory:CancelProgress()
end

Inventory.ProgressActive = function()
  return exports.ox_inventory:ProgressActive()
end