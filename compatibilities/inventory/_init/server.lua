---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory = {
  ['ox_inventory'] = {
    functions = {
      ['GetSlot'] = {
        label = 'GetSlot',
        args = {
          'inv', 'slotId'
        }
      },
    }
  },
  ['qb-inventory'] = {
    functions = {
      ['GetSlot'] = {
        label = 'GetItemBySlot',
        args = {
          'source', 'slot'
        }
      }
    }
  },
}