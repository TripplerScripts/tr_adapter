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




--[[
we can expect a lot of bug with this adapter such as side effects
we label and provide our compatibilities based on the functionality of the function
functionX {
  labels = _SAME_ | _DIFFERENT_,
  params = {
    methods = _SAME_ | _DIFFERENT_,   -- how params are passed (by name, by index, etc.)
    values  = _SAME_ | _DIFFERENT_,   -- actual values passed
    count   = _SAME_ | _DIFFERENT_,   -- number of params
    types   = _SAME_ | _DIFFERENT_,   -- type differences (number, string, table, etc.)
    order   = _SAME_ | _DIFFERENT_,   -- param order
  },
  returnals = {
    methods = _SAME_ | _DIFFERENT_,   -- how results are returned (direct, table, multiple values)
    values  = _SAME_ | _DIFFERENT_,   -- actual returned values
    count   = _SAME_ | _DIFFERENT_,   -- number of return values
    types   = _SAME_ | _DIFFERENT_,   -- type differences
    order   = _SAME_ | _DIFFERENT_,   -- order of multi-returns
  },
  errorHandling = _SAME_ | _DIFFERENT_, -- returns nil vs throws error
}
  
 ]]




 

function InitScripts()
  for resourceName, aliases in pairs(AvailableScripts) do
    for functionName, func in pairs(Fuel) do
      print(resourceName, aliases)
      print(functionName)
      local exportName = aliases[functionName] or functionName
      --[[ AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, exportName), function(setCB)
        setCB(func)
      end) ]]
    end
  end
end