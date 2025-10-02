function AdapterSetup()
  local Categories = {}
  for _, categoryData in pairs(SupportedResourcesData) do
    local categoryVariable = string.upper(string.sub(categoryData.category, 1, 1)) ..
    string.sub(categoryData.category, 2)

    if not _G[categoryVariable] then
      _G[categoryVariable] = {}
    end
    _G[categoryVariable].tr_adapter = {}
    if not Categories[categoryVariable] then
      Categories[categoryVariable] = {}
    end

    for _, resourceName in ipairs(categoryData.names) do
      table.insert(Categories[categoryVariable], {
        name = resourceName
      })
    end
  end

  for categoryVariable, _ in pairs(Categories) do
    local category     = (categoryVariable):lower()
    local categoryName = _G[categoryVariable]
    local handler      = AvailableScripts[category][1]
    for resourceName, functionsObject in pairs(categoryName) do
      for functionName, functionConfig in pairs(functionsObject) do
        if not ScriptsFunctions[category] then
          ScriptsFunctions[category] = {}
        end
        table.insert(ScriptsFunctions[category], functionName)
        if resourceName ~= handler and resourceName ~= 'tr_adapter' then
          categoryName.tr_adapter[functionName] = function(calledResource, handlerResource, ...)
            local param = { ... }
            local convertion = InitENV(categoryName, handlerResource, functionName, param, calledResource)
            local functionsSettings = InitOrder(categoryName, convertion, functionName, calledResource)

            return functionsSettings
          end

          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, functionConfig.label), function(cb)
            cb(function(...)
              return categoryName.tr_adapter[functionName](resourceName, handler, ...)
            end)
          end)
        end
      end
    end
  end
end
