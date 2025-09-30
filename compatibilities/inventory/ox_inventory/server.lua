---@diagnostic disable: duplicate-set-field
---@version 2.44.6

---@param player table
---@param data table?
Inventory.ox_inventory.SetPlayerInventory = function(player, data)
  exports.ox_inventory:setPlayerInventory(player, data)
end

---@param playerId number
---@param invType string
---@param data string|number|table
Inventory.ox_inventory.ForceOpenInventory = function(playerId, invType, data)
  return exports.ox_inventory:forceOpenInventory(playerId, invType, data)
end

Inventory.ox_inventory.ConvertItems = function(playerId, items)
  return exports.ox_inventory:ConvertItems(playerId, items)
end

Inventory.ox_inventory.RegisterHook = function(event, cb, options)
  return exports.ox_inventory:registerHook(event, cb, options)
end

Inventory.ox_inventory.RemoveHooks = function(id)
  exports.ox_inventory:removeHooks(id)
end

---@param inv inventory
---@param owner? string | number
Inventory.ox_inventory.Inventory = function(inv, owner)
  return exports.ox_inventory:Inventory(inv, owner)
end

---@param inv inventory
---@param owner? string | number
Inventory.ox_inventory.GetInventory = function(inv, owner)
  return exports.ox_inventory:GetInventory(inv, owner)
end

---@param inv inventory
---@param owner? string | number
---@return table?
Inventory.ox_inventory.GetInventoryItems = function(inv, owner)
  return exports.ox_inventory:GetInventoryItems(inv, owner)
end

---@param inv inventory
---@param slotId number
---@return OxInventory?
Inventory.ox_inventory.GetContainerFromSlot = function(inv, slotId)
  return exports.ox_inventory:GetContainerFromSlot(inv, slotId)
end

---@param inv inventory
Inventory.ox_inventory.RemoveInventory = function(inv)
  exports.ox_inventory:RemoveInventory(inv)
end

---@param oldPlate string
---@param newPlate string
Inventory.ox_inventory.UpdateVehicle = function(oldPlate, newPlate)
  exports.ox_inventory:UpdateVehicle(oldPlate, newPlate)
end

---@param inv inventory
---@param item table | string
---@param metadata? any
---@param returnsCount? boolean
---@return table | number | nil
Inventory.ox_inventory.GetItem = function(inv, item, metadata, returnsCount)
  return exports.ox_inventory:GetItem(inv, item, metadata, returnsCount)
end

---@param fromInventory any
---@param toInventory any
---@param slot1 number
---@param slot2 number
Inventory.ox_inventory.SwapSlots = function(fromInventory, toInventory, slot1, slot2)
  return exports.ox_inventory:SwapSlots(fromInventory, toInventory, slot1, slot2)
end

---@param inv inventory
---@param item table | string
---@param count number
---@param metadata? table
---@return boolean? success, string|SlotWithItem|nil response
Inventory.ox_inventory.SetItem = function(inv, item, count, metadata)
  return exports.ox_inventory:SetItem(inv, item, count, metadata)
end

---@param inv inventory
Inventory.ox_inventory.GetCurrentWeapon = function(inv)
  return exports.ox_inventory:GetCurrentWeapon(inv)
end

---@param inv inventory
---@param slotId number
---@return table? item
Inventory.ox_inventory.GetSlot = {
  label = 'GetSlot',
  args = {
    { name = 'target' },
    { name = 'slotId' }
  },
  returns = {
    name = 'name',
    weight = 'weight',
    stack = 'unique'
  }
}

---@param inv inventory
---@param slotId number
---@param durability number
Inventory.ox_inventory.SetDurability = function(inv, slotId, durability)
  exports.ox_inventory:SetDurability(inv, slotId, durability)
end

---@param inv inventory
---@param slotId number
---@param metadata { [string]: any }
Inventory.ox_inventory.SetMetadata = function(inv, slotId, metadata)
  exports.ox_inventory:SetMetadata(inv, slotId, metadata)
end

---@param inv inventory
---@param slots number
Inventory.ox_inventory.SetSlotCount = function(inv, slots)
  exports.ox_inventory:SetSlotCount(inv, slots)
end

---@param inv inventory
---@param maxWeight number
Inventory.ox_inventory.SetMaxWeight = function(inv, maxWeight)
  exports.ox_inventory:SetMaxWeight(inv, maxWeight)
end

---@param inv inventory
---@param item table | string
---@param count number
---@param metadata? table | string
---@param slot? number
---@param cb? fun(success?: boolean, response: string|SlotWithItem|nil)
---@return boolean? success, string|SlotWithItem|nil response
Inventory.ox_inventory.AddItem = function(inv, item, count, metadata, slot, cb)
  return exports.ox_inventory:AddItem(inv, item, count, metadata, slot, cb)
end

---@param inv inventory
---@param search string|number slots|1, count|2
---@param items table | string
---@param metadata? table | string
Inventory.ox_inventory.Search = {
  label = 'Search',
  args = {
    { name = 'target' },
    { name = 'type', defaultValue = 1 },
    { name = 'items' },
    { name = 'metadata' }
  },
  returns = {
    name = 'name',
    weight = 'weight',
    label = 'label',
    slot = 'slot',
    metadata = 'info',
    count = 'amount',
    close = 'shouldClose',
    stack = 'unique'
  }
}

---@param inv inventory
---@param item table | string
---@param metadata? table
---@param strict? boolean
Inventory.ox_inventory.GetItemSlots = function(inv, item, metadata, strict)
  return exports.ox_inventory:GetItemSlots(inv, item, metadata, strict)
end

---@param inv inventory
---@param item table | string
---@param count integer
---@param metadata? table | string
---@param slot? number
---@param ignoreTotal? boolean
---@param strict? boolean
---@return boolean? success, string? response
Inventory.ox_inventory.RemoveItem = function(inv, item, count, metadata, slot, ignoreTotal, strict)
  return exports.ox_inventory:RemoveItem(inv, item, count, metadata, slot, ignoreTotal, strict)
end

---@param inv inventory
---@param item table | string
---@param count number
---@param metadata? table | string
Inventory.ox_inventory.CanCarryItem = function(inv, item, count, metadata)
  return exports.ox_inventory:CanCarryItem(inv, item, count, metadata)
end

---@param inv inventory
---@param item table | string
Inventory.ox_inventory.CanCarryAmount = function(inv, item)
  return exports.ox_inventory:CanCarryAmount(inv, item)
end

---@param inv inventory
---@param weight number
Inventory.ox_inventory.CanCarryWeight = function(inv, weight)
  return exports.ox_inventory:CanCarryWeight(inv, weight)
end

---@param inv inventory
---@param firstItem string
---@param firstItemCount number
---@param testItem string
---@param testItemCount number
Inventory.ox_inventory.CanSwapItem = function(inv, firstItem, firstItemCount, testItem, testItemCount)
  return exports.ox_inventory:CanSwapItem(inv, firstItem, firstItemCount, testItem, testItemCount)
end

Inventory.ox_inventory.CustomDrop = function(prefix, items, coords, slots, maxWeight, instance, model)
  return exports.ox_inventory:CustomDrop(prefix, items, coords, slots, maxWeight, instance, model)
end

Inventory.ox_inventory.CreateDropFromPlayer = function(playerId)
  return exports.ox_inventory:CreateDropFromPlayer(playerId)
end

Inventory.ox_inventory.ConfiscateInventory = function(source)
  exports.ox_inventory:ConfiscateInventory(source)
end

Inventory.ox_inventory.ReturnInventory = function(source)
  exports.ox_inventory:ReturnInventory(source)
end

---@param inv inventory
---@param keep? string | string[] an item or list of items to ignore while clearing items
Inventory.ox_inventory.ClearInventory = function(inv, keep)
  exports.ox_inventory:ClearInventory(inv, keep)
end

---@param inv inventory
---@return integer?
Inventory.ox_inventory.GetEmptySlot = function(inv)
  return exports.ox_inventory:GetEmptySlot(inv)
end

---@param inv inventory
---@param itemName string
---@param metadata any
Inventory.ox_inventory.GetSlotForItem = function(inv, itemName, metadata)
  return exports.ox_inventory:GetSlotForItem(inv, itemName, metadata)
end

---@param inv inventory
---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number?
Inventory.ox_inventory.GetSlotIdWithItem = function(inv, itemName, metadata, strict)
  return exports.ox_inventory:GetSlotIdWithItem(inv, itemName, metadata, strict)
end

---@param inv inventory
---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return SlotWithItem[]?
Inventory.ox_inventory.GetSlotsWithItem = function(inv, itemName, metadata, strict)
  return exports.ox_inventory:GetSlotsWithItem(inv, itemName, metadata, strict)
end

---@param inv inventory
---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number[]?
Inventory.ox_inventory.GetSlotIdsWithItem = function(inv, itemName, metadata, strict)
  return exports.ox_inventory:GetSlotIdsWithItem(inv, itemName, metadata, strict)
end

---@param inv inventory
---@param itemName string
---@param metadata? any
---@param strict? boolean Strictly match metadata properties, otherwise use partial matching.
---@return number
Inventory.ox_inventory.GetItemCount = function(inv, itemName, metadata, strict)
  return exports.ox_inventory:GetItemCount(inv, itemName, metadata, strict)
end

---@param name string stash identifier when loading from the database
---@param label string display name when inventory is open
---@param slots number
---@param maxWeight number
---@param owner? string|number|boolean
---@param groups? table<string, number>
---@param coords? vector3|table<vector3>
Inventory.ox_inventory.RegisterStash = function(name, label, slots, maxWeight, owner, groups, coords)
  exports.ox_inventory:RegisterStash(name, label, slots, maxWeight, owner, groups, coords)
end

---@param properties TemporaryStashProperties
Inventory.ox_inventory.CreateTemporaryStash = function(properties)
  exports.ox_inventory:CreateTemporaryStash(properties)
end


Inventory.ox_inventory.InspectInventory = function(playerId, invId)
  exports.ox_inventory:InspectInventory(playerId, invId)
end

---@param _ table?
---@param name string?
---@return table?
Inventory.ox_inventory.Items = function(_, name)
  return exports.ox_inventory:Items(_, name)
end

---@param _ table?
---@param name string?
---@return table?
Inventory.ox_inventory.ItemList = function(_, name)
  return exports.ox_inventory:ItemList(_, name)
end

---@param source number
---@param amount number
Inventory.ox_inventory.AddCash = function(source, amount)
  exports.ox_inventory:addCash(source, amount)
end

---@param source number
---@param amount number
Inventory.ox_inventory.RemoveCash = function(source, amount)
  exports.ox_inventory:removeCash(source, amount)
end

---@param source number
---@return number
Inventory.ox_inventory.GetCash = function(source)
  return exports.ox_inventory:getCash(source)
end

---@param source number
---@return table?
Inventory.ox_inventory.GetCards = function(source)
  return exports.ox_inventory:getCards(source)
end

---@param source number
---@param card table
Inventory.ox_inventory.GiveCard = function(source, card)
  exports.ox_inventory:giveCard(source, card)
end

---@param shopType string
---@param shopDetails OxShop
Inventory.ox_inventory.RegisterShop = function(shopType, shopDetails)
  exports.ox_inventory:RegisterShop(shopType, shopDetails)
end