function Init()
  local Categories = {}
  for _, data in pairs(AvailableScripts) do
    Categories[#Categories + 1] = {
      categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
      availableResource = data.name
    }
  end

  for _, categoryInfo in pairs(Categories) do
    local availableResource = categoryInfo.availableResource

    local categoryObject = _G[categoryInfo.categoryVariable]
    for resourceName, resourceConfig in pairs(categoryObject) do
      for funcName, funcConfig in pairs(resourceConfig) do
        if resourceName == availableResource then
          local exportLabel = funcConfig.label

          _G[funcName] = function(...)
            print(...)
            local params = { ... }
            local orderedArgs = {}

            if #params == 1 and type(params[1]) == "table" then
              local dataObj = params[1]
              for i, argName in ipairs(funcConfig.args) do
                orderedArgs[i] = dataObj[argName]
              end
            else
              for i = 1, #params do
                orderedArgs[i] = params[i]
              end
            end
            print(("Calling: %s %s with args: %s"):format(availableResource, exportLabel, json.encode(orderedArgs)))
            return exports[availableResource][exportLabel](_, table.unpack(orderedArgs))
          end
        end

        if _G[funcName] and resourceName ~= availableResource then
          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, funcConfig.label), function(setCB)
            setCB(_G[funcName])
          end)
          print(("Created export listener: %s %s"):format(resourceName, funcConfig.label))
        end
      end
    end
  end
end