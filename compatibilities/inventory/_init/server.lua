---@diagnostic disable: duplicate-set-field
Inventory = {}

Inventory = {
  __index = {
    GetTargetItems = function(called, handler, ...)
      -- a normal and usual steps
      --[[ start ]]
      local item = {}
      local param = {...}

      local exportLabel = Inventory[handler].GetTargetItems.label
      local map = MapArguments(param, Inventory[called].GetTargetItems.args, Inventory[handler].GetTargetItems.args)
      local export = exports[handler][exportLabel](_, table.unpack(map))[1]
      local convertion = BuildConversionTable(export, Inventory)
      --[[ end ]]

      --Inventory scripts exception
      --[[ start ]]
      
      if called == 'ox_inventory' then
        if param[2] == 1 then
          item = Inventory[called].GetTargetItems.returns
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(convertion) do
              if missingArg == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        elseif param[2] == 2 then
          item = Inventory[called].GetTargetItems.returns.count
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(convertion) do
              if missingValue == shopArg then
                item = shopValue
                break
              end
            end
          end
        end
      elseif called == 'qb-inventory' or called == 'ps-inventory' then
        item = Inventory[called].GetTargetItems.returns
        for missingArg, missingValue in pairs(item) do
          if missingValue == 'image' then
            item[missingArg] = (convertion.name or 'item') .. '.png'
          else
            for shopArg, shopValue in pairs(convertion) do
              if missingArg == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        end
      end
      --[[ end ]]

      return item
    end
  },
  -- unique script's functions and declaration
  --[[ start ]]
  ['ox_inventory'] = {
    GetTargetItems = {
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
    },
  },
  
  ['qb-inventory'] = {
    GetTargetItems = {
      label = 'GetItemsByName',
      args = {
        { name = 'target' },
        { name = 'items' }
      },
      returns = {
        label = 'label',
        weight = 'weight',
        slot = 'slot',
        name = 'name',
        amount = 'count',
        info = 'metadata',
        shouldClose = 'close',
        unique = 'stack',
        type = 'item',
        useable = true,
        image = 'image',
        description = '',
      }
    },
  },
  
  ['ps-inventory'] = {
    GetTargetItems = {
      label = 'GetItemsByName',
      args = {
        { name = 'target' },
        { name = 'items' }
      },
      returns = {
        label = 'label',
        weight = 'weight',
        slot = 'slot',
        name = 'name',
        amount = 'count',
        info = 'metadata',
        shouldClose = 'close',
        unique = 'stack',
        type = 'item',
        useable = true,
        image = 'image',
        description = '',
      }
    },
  }
  --[[ end ]]
}