---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['__index'] = {
    GetTargetItems = function(...)
      local data = {...}
      return data
    end
  },
  ['ox_inventory'] = {
    ['GetTargetItems'] = {
      label = 'Search',
      returns = ''
    },
  },
  ['qb-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
    },
  },
  ['ps-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
    },
  }
}