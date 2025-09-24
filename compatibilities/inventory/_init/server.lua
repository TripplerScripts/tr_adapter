---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory.Standard = {
  GetTargetItems = function()
    local data = {}

    return data
  end
}
Inventory = {
  ['ox_inventory'] = {
    ['GetTargetItems'] = {
      label = 'Search',
      args = {
        'inv', 'search', 'items', 'metadata'
      }
    },
  },
  ['qb-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {
        'source', 'item'
      }
    },
  },
  ['ps-inventory'] = {
    ['GetTargetItems'] = {
      label = 'GetItemsByName',
      args = {
        'source', 'item'
      }
    },
  }
}