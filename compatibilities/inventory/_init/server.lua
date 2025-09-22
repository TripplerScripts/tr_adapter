---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['ox_inventory'] = {
    ['GetSlots'] = {
      label = 'GetSlot',
      args = {
        'inv', 'slotId'
      }
    },
    ['GetItems'] = {
      label = 'GetItem',
      args = {
        'inv', 'item', 'metadata', 'returnsCount'
      }
    },
  },
  ['qb-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemBySlot',
      args = {
        'source', 'slot'
      }
    },
    ['GetItems'] = {
      label = 'GetItemByName',
      args = {
        'source', 'item'
      }
    }
  },
  ['ps-inventory'] = {
    ['GetSlots'] = {
      label = 'GetItemBySlot',
      args = {
        'source', 'slot'
      }
    },
    ['GetItems'] = {
      label = 'GetItemByName',
      args = {
        'source', 'item'
      }
    }
  }
}