---@diagnostic disable: duplicate-set-field

---@class Fuel
---@type table
Fuel = {}

Fuel.GetFuel = function()
  return 0
end

Fuel.SetFuel = function() end

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