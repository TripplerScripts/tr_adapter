---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['__index'] = {
    GetTargetItems = function(called, handler, ...)
      local args = {...}
      local item = {}
      local exportLabel = Inventory[handler]['GetTargetItems']['label']
      
      -- Map args based on handler's args structure
      local handlerArgs = Inventory[handler]['GetTargetItems']['args']
      local calledArgs = Inventory[called]['GetTargetItems']['args']
      local mappedArgs = {}
      
      -- Map arguments from called format to handler format
      for i, handlerArgName in ipairs(handlerArgs) do
        for j, calledArgName in ipairs(calledArgs) do
          if handlerArgName == calledArgName then
            mappedArgs[i] = args[j]
            break
          end
        end
        -- If no mapping found, use positional fallback
        if not mappedArgs[i] then
          mappedArgs[i] = args[i]
        end
      end
      
      local export = exports[handler][exportLabel](exports[handler], table.unpack(mappedArgs))
      local shop = {
        --both
        ['weight'] = export and export.weight or 'NIL WEIGHT',
        ['label'] = export and export.label or 'NIL LABEL',
        ['slot'] = export and export.slot or 'NIL SLOT',
        ['name'] = export and export.name or 'NIL NAME',
        --ox
        ['metadata'] = export and export.info or 'NIL INFO',
        ['count'] = export and export.amount or 'NIL AMOUNT',
        ['close'] = export and export.shouldClose or 'NIL CLOSE',
        ['stack'] = 'NIL STACK',
        --qb
        ['amount'] = export and export.count or 'NIL COUNT',
        ['type'] = 'item',
        ['useable'] = 'NIL USEABLE',
        ['info'] = export and export.metadata or 'NIL METADATA',
        ['image'] = 'NIL IMAGE',
        ['description'] = 'NIL DESCRIPTION',
        ['shouldClose'] = export and export.close or 'NIL CLOSE',
        ['unique'] = export and export.stack or 'NIL STACK'
      }
      
      if handler == 'ox_inventory' then
        if args[2] == 1 then
          item = {}
          local expectedFields = Inventory['ox_inventory']['GetTargetItems']['returns']['1']
          for _, fieldName in ipairs(expectedFields) do
            item[fieldName] = shop[fieldName]
          end
        elseif args[2] == 2 then
          -- Return number for type 2
          local expectedReturn = Inventory['ox_inventory']['GetTargetItems']['returns']['2'][1]
          if expectedReturn == 'number' then
            item = shop['count'] or {}
          end
        end
      elseif handler == 'qb-inventory' or handler == 'ps-inventory' then
        item = {}
        local expectedFields = Inventory[handler]['GetTargetItems']['returns']
        for _, fieldName in ipairs(expectedFields) do
          item[fieldName] = shop[fieldName]
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
          'metadata',
          'name',
          'weight',
          'label',
          'count',
          'close',
          'slot',
          'stack'
        },
        ['2'] = {
          'number'
        }
      }
    },
  },
  ['qb-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {'target', 'items'},
      returns = {
        'amount',
        'type',
        'useable',
        'info',
        'weight',
        'image',
        'description',
        'shouldClose',
        'label',
        'slot',
        'name',
        'unique'
      }
    },
  },
  ['ps-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {'target', 'items'},
      returns = {
        'amount',
        'type',
        'useable',
        'info',
        'weight',
        'image',
        'description',
        'shouldClose',
        'label',
        'slot',
        'name',
        'unique'
      }
    },
  }
}