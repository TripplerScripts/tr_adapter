---@diagnostic disable: duplicate-set-field
Inventory = {}

local function mapArguments(inputArgs, fromArgsConfig, toArgsConfig)
  local mappedArgs = {}
  
  local fromLookup = {}
  for i, argConfig in ipairs(fromArgsConfig) do
      fromLookup[argConfig.name] = i
  end
  
  for i, argConfig in ipairs(toArgsConfig) do
      local argName = argConfig.name
      local defaultValue = argConfig.defaultValue
      
      if fromLookup[argName] and inputArgs[fromLookup[argName]] ~= nil then
          mappedArgs[i] = inputArgs[fromLookup[argName]]
      elseif defaultValue ~= nil then
          mappedArgs[i] = defaultValue
      end
  end
  
  return mappedArgs
end

Inventory = {
  __index = {
    GetTargetItems = function(called, handler, ...)
      local args = {...}
      local item = {}
      
      local exportLabel = Inventory[handler].GetTargetItems.label
      local map = mapArguments(args, Inventory[called].GetTargetItems.args, Inventory[handler].GetTargetItems.args)
      
      export = handler == 'ox_inventory' and exports[handler][exportLabel](_, table.unpack(map))[1] or exports[handler][exportLabel](_, table.unpack(map))
      
      if not export then
        print({type = 'error', message = ('calling the handler returned %s'):format(export:upper())})
        return {}
      end

      local shop = {
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
      
      if called == 'ox_inventory' then
        if args[2] == 1 then
          item = Inventory[called].GetTargetItems.returns['1']
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(shop) do
              if missingValue == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        elseif args[2] == 2 then
          item = Inventory[called].GetTargetItems.returns['2']
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(shop) do
              if missingValue == shopArg then
                item = shopValue
              end
            end
          end
        end
      elseif called == 'qb-inventory' or called == 'ps-inventory' then
        item = Inventory[called].GetTargetItems.returns
        for missingArg, missingValue in pairs(item) do
          if missingValue == 'image' then
            item[missingArg] = (shop.name or 'item') .. '.png'
          else
            for shopArg, shopValue in pairs(shop) do
              if missingArg == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        end
      end

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