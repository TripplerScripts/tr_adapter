-- this will filter the supported resources names that are:
-- missing | stored in ScriptsToSupport
-- will be provided by the tr_adapter | stored in AvailableScripts
-- provided by another script | ignored
function SelectScripts()
  for _, categoryData in ipairs(SupportedResourcesData) do
    for _, resourceName in ipairs(categoryData.names) do
      local state = GetResourceState(resourceName)
      local foundInServer = false
      for _, serverName in ipairs(ServerResourcesNames) do
        if serverName == resourceName then
          foundInServer = true
          break
        end
      end
      if state == ('started' or 'starting') and not foundInServer then
        print({type = 'success', message = ("✓ Found: %s (Provided by another script)"):format(resourceName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      else
        if state == "started" then
          AvailableScripts[#AvailableScripts + 1] = { category = categoryData.category, name = resourceName }
          print({type = 'success', message = ("✓ Started: %s"):format(resourceName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          if state == 'missing' then
            ScriptsToSupport[#ScriptsToSupport + 1] = { category = categoryData.category, name = resourceName }
            print({type = 'info', message = ("✗ Missing: %s"):format(resourceName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          else
            ScriptsToSupport[#ScriptsToSupport + 1] = { category = categoryData.category, name = resourceName }
            print({type = 'info', message = ("✗ Missing: %s"):format(resourceName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          end
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
    for _, data in ipairs(AvailableScripts) do
      Wait(300)
      print({type = 'info', message = ("- %s [%s]"):format(data.name, data.category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    end
    print({type = 'info', message = ("[Resource Selector] Selector debug finished"):format(#AvailableScripts), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
  end)
  ProvideScripts()
end