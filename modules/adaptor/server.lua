function InitFunctions()
  local Categories = {}
  for _, data in pairs(AvailableScripts) do
    Categories[#Categories + 1] = {
      category = data.category,
      categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
      availableResource = data.name
    }
  end

  for _, categoryInfo in pairs(Categories) do
    local categoryName = categoryInfo.category
    local availableResourceName = categoryInfo.availableResource

    local resourceTable = _G[categoryInfo.categoryVariable]
    if not resourceTable then
      print("No resource table found for category:", categoryInfo.categoryVariable, "warn")
      goto continue
    end

    local availableResourceData = resourceTable[availableResourceName]
    if not availableResourceData then
      print("No config found for resource:", availableResourceName, "in category:", categoryName, "warn")
      goto continue
    end

    for resourceName, resourceConfig in pairs(resourceTable) do
      for funcName, funcConfig in pairs(resourceConfig) do
        if resourceName == availableResourceName then
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

            print("Calling:", availableResourceName, exportLabel, "with args:", json.encode(orderedArgs))
            return exports[availableResourceName][exportLabel](_, table.unpack(orderedArgs))
          end

          exports(funcName, _G[funcName])
          print("Registered export:", funcName)
        end

        if _G[funcName] and resourceName ~= availableResourceName then
          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, funcConfig.label), function(setCB)
            setCB(_G[funcName])
          end)
          print("Created export listener:", resourceName, funcConfig.label)
        end
      end
    end

    ::continue::
  end
end
