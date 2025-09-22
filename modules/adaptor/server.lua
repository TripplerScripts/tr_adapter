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
            local params = { ... }
            local orderedArgs = {}

            if #params == 1 and type(params[1]) == "table" then
              local dataObj = params[1]
              for i, argName in ipairs(funcConfig.args) do
                orderedArgs[i] = dataObj[argName]
              end
            else
              -- Get the available resource's parameter order for this function
              local availableResourceData = resourceTable[availableResourceName]
              local availableFuncConfig = availableResourceData and availableResourceData[funcName]
              
              if availableFuncConfig and availableFuncConfig.args then
                -- Map parameters from caller's order to available resource's expected order
                local callerArgs = funcConfig.args      -- e.g., ['slot', 'target'] (ps-inventory)
                local targetArgs = availableFuncConfig.args  -- e.g., ['target', 'slot'] (ox_inventory)
                
                -- Create mapping from caller position to target position
                for targetPos, targetArg in ipairs(targetArgs) do
                  for callerPos, callerArg in ipairs(callerArgs) do
                    if callerArg == targetArg then
                      orderedArgs[targetPos] = params[callerPos]
                      break
                    end
                  end
                end
              else
                -- Fallback: use original order
                for i = 1, #params do
                  orderedArgs[i] = params[i]
                end
              end
            end

            print("Calling:", availableResourceName, exportLabel, "with args:", json.encode(orderedArgs), 'info')

            return exports[availableResourceName][exportLabel](_, table.unpack(orderedArgs))
          end

          exports(funcName, _G[funcName])
          print("Registered export:", funcName, 'info')
          for scriptName, scriptConfig in pairs(resourceTable) do
            if scriptName ~= availableResourceName then
              AddEventHandler(('__cfx_export_%s_%s'):format(scriptName, scriptConfig[funcName].label), function(setCB)
                setCB(_G[funcName])
              end)
              print("Created export listener:", scriptName, scriptConfig[funcName].label, 'info')
            end
          end
        end
      end
    end

    ::continue::
  end
end
