---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['GLOBAL'] = {
    ['GetSlots'] = {
      args = {
        'player', 'slot'
      }
    },
    ['GetItems'] = {
      args = {
        'player', 'item', 'metadata', 'return'
      }
    }
  },
  ['ox_inventory'] = {
    ['GetSlots'] = {
      label = 'GetSlot',
      args = {
        'target', 'slot'
      }
    },
    ['GetItems'] = {
      label = 'GetItem',
      args = {
        'target', 'item', 'metadata', 'returnsCount'
      }
    },
  },
  ['qb-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemBySlot',
      args = {
        'target', 'slot'
      }
    },
    ['GetItems'] = {
      label = 'GetItemByName',
      args = {
        'target', 'item'
      }
    }
  },
  ['ps-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemBySlot',
      args = {
        'slot', 'target'
      }
    },
    ['GetItems'] = {
      label = 'GetItemByName',
      args = {
        'item', 'target'
      }
    }
  }
}