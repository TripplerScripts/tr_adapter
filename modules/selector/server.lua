-- this will filter the supported resources names that are:
-- missing | stored in ScriptsToSupport
-- will be provided by the tr_adapter | stored in AvailableScripts
-- provided by another script | ignored
function SelectScripts()
  for _, data in ipairs(SupportedResourcesData) do
    local state = GetResourceState(data.name)
    local foundInServer = false
    for _, serverName in ipairs(ServerResourcesNames) do
      if serverName == data.name then
        foundInServer = true
        break
      end
    end
    if state == ('started' or 'starting') and not foundInServer then
      exports.tr_lib:print(("✓ Found: %s (Provided by another script)"):format(data.name), 'info')
    else
      if state == "started" then
        AvailableScripts[#AvailableScripts + 1] = { category = data.category, name = data.name, duplicityVersion = data
        .duplicityVersion }
        exports.tr_lib:print(("✓ Started: %s"):format(data.name), 'info')
      else
        if state == 'missing' then
          ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
          exports.tr_lib:print(("✗ Missing: %s"):format(data.name), 'info')
        else -- XD
          ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
          exports.tr_lib:print(("✗ Missing: %s"):format(data.name), 'info')
        end
      end
    end
  end

  RegisterNetEvent('tr_adapter:server:selector_debug', function()
    exports.tr_lib:print(("[Resource Selector] Found %s scripts to support"):format(#ScriptsToSupport), 'info')
    for _, data in ipairs(ScriptsToSupport) do
      exports.tr_lib:print(("- [%s] %s"):format(data.category, data.name), 'info')
      Wait(300)
    end
    Wait(1000)

    exports.tr_lib:print(("[Resource Selector] Found %s scripts that are going to provide"):format(#AvailableScripts), 'info')
    local categoryLookup = {}
    for _, data in ipairs(SupportedResourcesData) do
      categoryLookup[data.name] = data.category
    end

    for _, data in ipairs(AvailableScripts) do
      local category = categoryLookup[data.name] or "unknown"
      Wait(300)
      exports.tr_lib:print(("- %s [%s]"):format(data.name, category), 'info')
    end
    exports.tr_lib:print(("[Resource Selector] Selector debug finished"):format(#AvailableScripts), 'info')
  end)

  IsReadyToProvide = true
  ProvideScripts()
end