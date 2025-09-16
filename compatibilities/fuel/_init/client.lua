---@diagnostic disable: duplicate-set-field
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