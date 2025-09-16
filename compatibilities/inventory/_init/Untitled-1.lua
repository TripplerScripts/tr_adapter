---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory.GetInventory = function()
  print('No inventory resource available - GetInventory called', 'warn')
  return {}
end

Inventory.LoadInventory = function()
  print('No inventory resource available - LoadInventory called', 'warn')
  return {}
end

local differentAliasses = {
  ['qb-inventory'] = {
    GetInventory = {
      label = 'GetQBInventory',
      returned = {
        values = {
          name = 'string',
          items = 'table',
          amount = 'number',
        }
      }
    },
    -- LoadInventory = 'LoadInventory', same name so not needed
  },
  ['ps-inventory'] = {
    GetInventory = 'GetPSInventory',
    LoadInventory = 'LoadPSInventory',
  },
  ['ox_inventory'] = {
    -- GetInventory = 'GetInventory', same name so not needed
    LoadInventory = 'LoadOXInventory',
  },
}
function InitScripts()
  for resourceName, aliases in pairs(differentAliasses) do
    for functionName, func in pairs(Inventory) do
      local exportName = aliases[functionName] or functionName
      AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, exportName), function(setCB)
        setCB(func)
      end)
    end
  end
end