---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['ox_inventory'] = {
    ['GetCountOfItem'] = {
      label = 'GetItemCount',
      args = {
        'inv', 'itemName', 'metadata', 'strict'
      }
    },
  },
  ['qb-inventory'] = {
    ['GetCountOfItem'] = {
      label = 'GetItemCount',
      args = {
        'source', 'items'
      }
    },
  },
  ['ps-inventory'] = {
    ['GetCountOfItem'] = {
      label = 'GetItemCount',
      args = {
        'source', 'items'
      }
    },
  }
}