---@diagnostic disable: duplicate-set-field
Inventory = {}

Inventory = {
  __index = {
    GetTargetItems = function(called, handler, ...)
      local item = {}
      
      local exportLabel = Inventory[handler].GetTargetItems.label
      local map = MapArguments({...}, Inventory[called].GetTargetItems.args, Inventory[handler].GetTargetItems.args)
      export = exports[handler][exportLabel](_, table.unpack(map))[1]

      if not export then
        print({type = 'error', message = ('calling the handler returned %s'):format(export:upper())})
        return {}
      end

      local convertion = {
        weight = export.weight,
        label = export.label,
        slot = export.slot,
        name = export.name,
        metadata = export.info,
        count = export.amount,
        close = export.shouldClose,
        stack = export.unique,
        info = export.metadata,
        amount = export.count,
        shouldClose = export.close,
        unique = export.stack,
        useable = export.useable,
        image = export.image,
        description = export.description,
        type = export.type,
      }
      --Inventory scripts exception
      --[[ start ]]
      if called == 'ox_inventory' then
        if {...}[2] == 1 then
          item = Inventory[called].GetTargetItems.returns['1']
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(convertion) do
              if missingArg == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        elseif {...}[2] == 2 then
          item = Inventory[called].GetTargetItems.returns['2']
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
        ['1'] = {
          name = 'name',
          weight = 'weight',
          label = 'label',
          slot = 'slot',
          metadata = 'info',
          count = 'amount',
          close = 'shouldClose',
          stack = 'unique'
        },
        ['2'] = {
          count = 'amount'
        }
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
}