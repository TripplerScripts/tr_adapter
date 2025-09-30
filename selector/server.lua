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
      print({type = 'success', message = ("✓ Found: %s (Provided by another script)"):format(data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    else
      if state == "started" then
        AvailableScripts[#AvailableScripts + 1] = { category = data.category, name = data.name, duplicityVersion = data
        .duplicityVersion }
        print({type = 'success', message = ("✓ Started: %s"):format(data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      else
        if state == 'missing' then
          ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
          print({type = 'info', message = ("✗ Missing: %s"):format(data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else -- XD
          ScriptsToSupport[#ScriptsToSupport + 1] = { category = data.category, name = data.name }
          print({type = 'info', message = ("✗ Missing: %s"):format(data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end
    end
  end

  RegisterNetEvent('tr_adapter:server:selector_debug', function()
    print({type = 'info', message = ("[Resource Selector] Found %s scripts to support"):format(#ScriptsToSupport), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    for _, data in ipairs(ScriptsToSupport) do
      print({type = 'info', message = ("- [%s] %s"):format(data.category, data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      Wait(300)
    end
    Wait(1000)

    print({type = 'info', message = ("[Resource Selector] Found %s scripts that are going to provide"):format(#AvailableScripts), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    local categoryLookup = {}
    for _, data in ipairs(SupportedResourcesData) do
      categoryLookup[data.name] = data.category
    end

    for _, data in ipairs(AvailableScripts) do
      local category = categoryLookup[data.name] or "unknown"
      Wait(300)
      print({type = 'info', message = ("- %s [%s]"):format(data.name, category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    end
    print({type = 'info', message = ("[Resource Selector] Selector debug finished"):format(#AvailableScripts), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
  end)
  ProvideScripts()
end