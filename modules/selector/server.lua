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

    if state ~= "missing" and not foundInServer then
      print("^4✓ Found: " .. data.name .. ' (^3Provided by another script)', 'info')
    else
      if state ~= "missing" then
        AvailableScripts[#AvailableScripts + 1] = { category = data.category, name = data.name, duplicityVersion = data
        .duplicityVersion }
        print("^2✓ Started: " .. data.name, 'info')
      else
        ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
        print("^1✗ Missing: " .. data.name, 'info')
      end
    end
  end

  RegisterNetEvent('tr_adapter:server:selector_debug', function()
    print("^2[Resource Selector] ^7Found " .. #ScriptsToSupport .. " scripts to support", 'info')
    for _, data in ipairs(ScriptsToSupport) do
      print("^3- ^4[" .. data.category .. "] ^7" .. data.name, 'info')
      Wait(300)
    end
    Wait(1000)

    print("^2[Resource Selector] ^7Found " .. #AvailableScripts .. " scripts that are going to provide", 'info')
    local categoryLookup = {}
    for _, data in ipairs(SupportedResourcesData) do
      categoryLookup[data.name] = data.category
    end

    for _, data in ipairs(AvailableScripts) do
      local category = categoryLookup[data.name] or "unknown"
      Wait(300)
      print("^3- ^7" .. data.name .. " ^4[" .. category .. "]", 'info')
    end
    print("^2[Resource Selector] ^7Selector debug finished", 'info')
  end)

  IsReadyToProvide = true
  ProvideScripts()
end