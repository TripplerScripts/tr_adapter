---@diagnostic disable: duplicate-set-field
Inventory = {}
local function mapArguments(inputArgs, fromArgsConfig, toArgsConfig)
  local mappedArgs = {}
  
  -- Map each argument from 'to' config to 'from' config
  for i, toArgName in ipairs(toArgsConfig) do
      local found = false
      -- Find matching argument in 'from' config
      for j, fromArgName in ipairs(fromArgsConfig) do
          if toArgName == fromArgName then
              mappedArgs[i] = inputArgs[j]
              found = true
              break
          end
      end
      -- If no match found, use positional fallback
      if not found then
          mappedArgs[i] = inputArgs[i]
      end
  end
  
  return mappedArgs
end
Inventory = {
  ['__index'] = {
    GetTargetItems = function(called, handler, ...)
      local args = {...}
      local item = {}
      local exportLabel = Inventory[handler]['GetTargetItems']['label']
      local map = mapArguments({...}, Inventory[called]['GetTargetItems']['args'], Inventory[handler]['GetTargetItems']['args'])
      local export = exports[handler][exportLabel](exports[handler], table.unpack(map))[1]
      local shop = {
        --both
        ['weight'] = export.weight,
        ['label'] = export.label,
        ['slot'] = export.slot,
        ['name'] = export.name,
        --ox
        ['metadata'] = export.metadata,
        ['count'] = export.count,
        ['close'] = export.close,
        ['stack'] = export.stack,
        --qb
        ['info'] = export.info,
        ['amount'] = export.amount,
        ['shouldClose'] = export.shouldClose,
        ['unique'] = export.unique,
        
        ['useable'] = export.useable,
        ['image'] = export.image,
        ['description'] = export.description,
        ['type'] = export.type,
      }
      if called == 'ox_inventory' then
        if args[2] == 1 then
          item = Inventory['ox_inventory']['GetTargetItems']['returns']['1']
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(shop) do
              if missingValue == shopArg then
                item[missingArg] = shopValue
              end
            end
          end
        elseif args[2] == 2 then
          item = Inventory['ox_inventory']['GetTargetItems']['returns']['2']
          for missingArg, missingValue in pairs(item) do
            for shopArg, shopValue in pairs(shop) do
              if missingValue == shopArg then
                item = shopValue
              end
            end
          end
        end
      elseif called == 'qb-inventory' or called == 'ps-inventory' then
        item = {}
        for missingArg, missingValue in pairs(item) do
          for shopArg, shopValue in pairs(shop) do
            if missingValue == shopArg then
              item[missingArg] = shopValue
            end
          end
        end
      end

      return item
    end
  },
  ['ox_inventory'] = {
    ['GetTargetItems'] = {
      label = 'Search',
      args = {'target', 'type', 'items', 'metadata'},
      returns = {
        ['1'] = {
          ['name'] = 'name',
          ['weight'] = 'weight',
          ['label'] = 'label',
          ['slot'] = 'slot',
          ['metadata'] = 'info',
          ['count'] = 'amount',
          ['close'] = 'shouldClose',
          ['stack'] = 'unique'
        },
        ['2'] = {
          ['count'] = 'amount'
        }
      }
    },
  },
  ['qb-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {'target', 'items'},
      returns = {
        ['label'] = 'label',
        ['weight'] = 'weight',
        ['slot'] = 'slot',
        ['name'] = 'name',
        ['amount'] = 'count',
        ['info'] = 'metadata',
        ['shouldClose'] = 'close',
        ['unique'] = 'stack',
        ['type'] = 'DEFAULT',
        ['useable'] = 'DEFAULT',
        ['image'] = 'DEFAULT',
        ['description'] = 'DEFAULT',
      }
    },
  },
  ['ps-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {'target', 'items'},
      returns = {
        ['label'] = 'label',
        ['weight'] = 'weight',
        ['slot'] = 'slot',
        ['name'] = 'name',
        ['amount'] = 'count',
        ['info'] = 'metadata',
        ['shouldClose'] = 'close',
        ['unique'] = 'stack',
        ['type'] = 'DEFAULT',
        ['useable'] = 'DEFAULT',
        ['image'] = 'DEFAULT',
        ['description'] = 'DEFAULT',
      }
    },
  }
}