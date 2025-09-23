---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['ox_inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemCount',
      args = {
        'item', 'target', 'metadata', 'strict'
      }
    },
  },
  ['qb-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemCount',
      args = {
        'target', 'item'
      }
    },
  },
  ['ps-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemCount',
      args = {
        'target', 'item'
      }
    },
  }
}