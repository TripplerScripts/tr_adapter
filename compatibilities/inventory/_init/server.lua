---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['__index'] = {
    GetTargetItems = function(...)
      local args = {...}
      print(json.encode(args, { indent = true }))
      local ox = exports['ox_inventory']:Search(...)
      local qb = exports['qb-inventory']:GetItemsByName(...)
      local item = {
       --[[  --both
        weight = ox.weight or qb.weight,
        label = ox.label or qb.label,
        slot = ox.slot or qb.slot,
        name = ox.name or qb.name,
        --ox
        metadata = ox.metadata or {},
        count = ox.count or 0,
        close = ox.close or false,
        stack = ox.stack or false,
        --qb
        amount = qb.amount or 0,
        type = qb.type or '',
        useable = qb.useable or false,
        info = qb.info or {},
        image = qb.image or '',
        description = qb.description or '',
        shouldClose = qb.shouldClose or false,
        unique = qb.unique or false ]]
      }

      return item
    end
  },
  ['ox_inventory'] = {
    ['GetTargetItems'] = {
      label = 'Search',
      returns = {
        ['1'] = {
          metadata = 'table',
          name = 'string',
          weight = 'number',
          label = 'string',
          count = 'number',
          close = 'boolean',
          slot = 'number',
          stack = 'boolean'
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
      returns = {
        amount = 'number',
        type = 'string',
        useable = 'boolean',
        info = 'table',
        weight = 'number',
        image = 'string',
        description = 'string',
        shouldClose = 'boolean',
        label = 'string',
        slot = 'number',
        name = 'string',
        unique = 'boolean'
      }
    },
  },
  ['ps-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      returns = {
        amount = 'number',
        type = 'string',
        useable = 'boolean',
        info = 'table',
        weight = 'number',
        image = 'string',
        description = 'string',
        shouldClose = 'boolean',
        label = 'string',
        slot = 'number',
        name = 'string',
        unique = 'boolean'
      }
    },
  }
}