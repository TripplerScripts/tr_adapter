function AdapterSetup()
  local ScriptsFunctions = {}
  local Categories = {}
  for _, categoryData in pairs(SupportedResourcesData) do
    local categoryVariable = string.upper(string.sub(categoryData.category, 1, 1)) .. string.sub(categoryData.category, 2)

    if not Categories[categoryVariable] then
      Categories[categoryVariable] = {}
    end

    for _, resourceName in ipairs(categoryData.names) do
      table.insert(Categories[categoryVariable], {
        name = resourceName
      })
    end
  end

  for categoryVariable, resources in pairs(Categories) do
    local category = (categoryVariable):lower()
    local categoryName = _G[categoryVariable]
    
    for _, resourceData in ipairs(resources) do
      for resourceName, functionsObject in pairs(categoryName) do
        for functionName, functionConfig in pairs(functionsObject) do
          if not ScriptsFunctions[category] then
            ScriptsFunctions[category] = {}
          end
          table.insert(ScriptsFunctions[category], functionName)
          if resourceName ~= AvailableScripts[category][1] and resourceName ~= 'tr_adapter' then
            AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, functionConfig.label), function(cb)
              cb(function(...)
                categoryName.tr_adapter = function(...)
                  for _, functionName in pairs(ScriptsFunctions[category]) do
                    functionName(...)
                    local functionsSettings = GenerateFunctionENV(categoryName, resourceName, functionName, ...)
                    return functionsSettings
                  end
                end
              end)
            end)
          end
        end
      end
    end
  end
  Init()
end