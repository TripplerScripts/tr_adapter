-- Helper function for finding index
local function indexOf(tbl, value)
  for i, v in ipairs(tbl) do
    if v == value then 
      return i 
    end
  end
  return nil
end

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
      exports.tr_lib:print({type = 'warn', message = ('No resource table found for category: %s'):format(categoryInfo.categoryVariable)})
      goto continue
    end

    local availableResourceData = resourceTable[availableResourceName]
    if not availableResourceData then
      exports.tr_lib:print({type = 'warn', message = ('No config found for resource: %s in category: %s'):format(availableResourceName, categoryName)})
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

            exports.tr_lib:print({type = 'info', message = ('Calling: %s %s with args: %s'):format(availableResourceName, exportLabel, json.encode(orderedArgs))})
            return exports[availableResourceName][exportLabel](_, table.unpack(orderedArgs))
          end

          exports(funcName, _G[funcName])
          exports.tr_lib:print({type = 'info', message = ('Registered export: %s'):format(funcName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          
          for scriptName, scriptConfig in pairs(resourceTable) do
            if scriptName ~= availableResourceName then
              -- Capture loop variables in closure
              local capturedFuncName = funcName
              local capturedExportLabel = exportLabel
              local capturedScriptName = scriptName
              
              AddEventHandler(('__cfx_export_%s_%s'):format(scriptName, scriptConfig[funcName].label), function(setCB)
                
                -- Create caller-specific wrapper
                local callerSpecificFunction = function(...)
                  local params = { ... }
                  local orderedArgs = {}
                  
                  -- Get configs for reordering
                  local callerConfig = resourceTable[capturedScriptName][capturedFuncName]
                  local targetConfig = resourceTable[availableResourceName][capturedFuncName]
                  
                  if #params == 1 and type(params[1]) == "table" then
                    local dataObj = params[1]
                    for i, argName in ipairs(targetConfig.args) do
                      orderedArgs[i] = dataObj[argName]
                    end
                  else
                    -- REORDER: from caller order to target order
                    for i, targetArgName in ipairs(targetConfig.args) do
                      local callerIndex = indexOf(callerConfig.args, targetArgName)
                      if callerIndex then
                        orderedArgs[i] = params[callerIndex]
                      else
                        orderedArgs[i] = params[i] -- fallback to same position
                      end
                    end
                  end
                  
                  exports.tr_lib:print({type = 'info', message = ('Caller: %s → Target: %s %s with args: %s'):format(capturedScriptName, availableResourceName, capturedExportLabel, json.encode(orderedArgs))})
                  return exports[availableResourceName][capturedExportLabel](_, table.unpack(orderedArgs))
                end
                
                setCB(callerSpecificFunction)
              end)
              
              exports.tr_lib:print({type = 'info', message = ('Created export listener: %s %s'):format(scriptName, scriptConfig[funcName].label), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
            end
          end
        end
      end
    end

    ::continue::
  end
end