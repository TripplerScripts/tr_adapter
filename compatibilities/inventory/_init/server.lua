---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory.GetPlayer = function()
  print('No inventory resource available - GetPlayer called', 'warn')
  return {}
end
---@alias expectedReturn string[] | table<string, string>
local backwardsCompatibility = {
  ['qb-inventory'] = {
    GetPlayer = {
      label = 'GetPlayerData',
      expectedReturn = { 'undefined', 'undefined', 'undefined' },
      smartMapping = function()
        return {
          Inventory.GetPlayer().citizenId,
          Inventory.GetPlayer().charInfo.firstName,
          Inventory.GetPlayer().charInfo.lastName
        }
      end
    },
  },
  ['ox_inventory'] = {
    GetPlayer = {
      label = 'PlayerInfo',
      expectedReturn = {
        citizenId = 'undefined',
        charinfo = {
          firstName = 'undefined',
          lastName  = 'undefined',
        }
      },
      smartMapping = function()
        return {
          citizenId = function() return Inventory.GetPlayer().citizenId end,
          charinfo = function() return Inventory.GetPlayer().charInfo end,
        }
      end
    },
  },
}

-- calling qb-inventory not like calling ps-inventory so we need to use the backward compatibility table, return values are different
function InitScripts()
  for resourceName, aliases in pairs(backwardsCompatibility) do
    for i = 1, #ScriptsToSupport do
      if resourceName == ScriptsToSupport[i].name then
        if not AvailableScripts[resourceName] then
          for functionName, func in pairs(Inventory) do
            local exportName = aliases[functionName].label or functionName
            AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, exportName), function(setCB)
              setCB(func) -- this is only calling one functions which is not the case for ps-inventory or qb-inventory, this will return the expected values for ox_inventory which it'll not server ps, qb or whatever
            end)
          end
        end
        break
      end
    end
  end
end
