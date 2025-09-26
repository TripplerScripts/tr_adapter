function Init()
  local Categories = {}
  for _, data in pairs(AvailableScripts) do
    Categories[#Categories + 1] = {
      categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
      availableResource = data.name
    }
  end

  for _, categoryInfo in pairs(Categories) do
    local category = _G[categoryInfo.categoryVariable]
    for resourceName, functions in pairs(category) do
      for functionName, functionConfig in pairs(functions) do
        if resourceName ~= categoryInfo.availableResource and resourceName ~= '__index' then
          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, functionConfig.label), function(cb)
            cb(function(...)
              return category.__index[functionName](GetInvokingResource(), resourceName, categoryInfo.availableResource, ...)
            end)
          end)
        end
      end
    end
  end
end