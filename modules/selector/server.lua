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
    if state == 'starting' then
      print(("^1!Error: %s has been started unproperly\n - %s has been detected %s, this'll cause issues, please restart the server"):format(GetCurrentResourceName(), data.name, state,  'error', '^0'))
      goto skip
    elseif state == 'started' then
      print(("^1!Error: %s has been started unproperly\n - %s has been detected %s, this'll cause issues, please restart the server"):format(GetCurrentResourceName(), data.name, state, 'error', '^0'))
      goto skip
    end
    if state ~= "missing" and not foundInServer then
      print(("^4✓ Found: %s (^3Provided by another script)"):format(data.name), 'info')
    else
      if state ~= "missing" then
        AvailableScripts[#AvailableScripts + 1] = { category = data.category, name = data.name, duplicityVersion = data
        .duplicityVersion }
        print(("^2✓ Started: %s"):format(data.name), 'info')
      else
        ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
        print(("^6✗ Missing: %s"):format(data.name), 'info')
      end
    end
    ::skip::
  end

  RegisterNetEvent('tr_adapter:server:selector_debug', function()
    print(("^2[Resource Selector] ^7Found %s scripts to support"):format(#ScriptsToSupport), 'info')
    for _, data in ipairs(ScriptsToSupport) do
      print(("^3- ^4[%s] ^7%s"):format(data.category, data.name), 'info')
      Wait(300)
    end
    Wait(1000)

    print(("^2[Resource Selector] ^7Found %s scripts that are going to provide"):format(#AvailableScripts), 'info')
    local categoryLookup = {}
    for _, data in ipairs(SupportedResourcesData) do
      categoryLookup[data.name] = data.category
    end

    for _, data in ipairs(AvailableScripts) do
      local category = categoryLookup[data.name] or "unknown"
      Wait(300)
      print(("^3- ^7%s ^4[%s]"):format(data.name, category), 'info')
    end
    print(("^2[Resource Selector] ^7Selector debug finished"):format(#AvailableScripts), 'info')
  end)

  IsReadyToProvide = true
  ProvideScripts()
end