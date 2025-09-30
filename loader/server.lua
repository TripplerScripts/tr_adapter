function LoadScripts()
  local loadedCategories = {}
  
  for _, categoryData in ipairs(SupportedResourcesData) do
    if not loadedCategories[categoryData.category] then
      local success, error = pcall(function()
        local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. categoryData.category .. '/_init/server.lua')
        if not initContent then
          print({type = 'warn', message = ('[LOADER WARNING] Init file not found: %s/_init/server.lua'):format(categoryData.category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          local chunkInit, errInit = load(initContent, '@' .. categoryData.category .. '/_init/server.lua')
          if chunkInit then
            chunkInit()
            print({type = 'info', message = ('[LOADER] Successfully loaded: %s/_init/server.lua'):format(categoryData.category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          else
            print({type = 'error', message = ('[LOADER ERROR] Failed to compile %s/_init/server.lua: %s'):format(categoryData.category, errInit or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          end
        end
      end)
      
      if not success then
        print({type = 'error', message = ('[LOADER ERROR] ' .. error):format(error), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      end
      
      loadedCategories[categoryData.category] = true
    end
    
    -- Load each resource in the category
    for _, resourceName in ipairs(categoryData.names) do
      local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. categoryData.category .. '/' .. resourceName .. '/server.lua')
        if not scriptContent then
          print({type = 'warn', message = '[LOADER WARNING] File not found: ' .. categoryData.category .. '/' .. resourceName .. '/server.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. categoryData.category .. '/' .. resourceName .. '/server.lua')
        if chunkScript then
          chunkScript()
          print({type = 'info', message = ('[LOADER] Successfully loaded: %s/%s/server.lua'):format(categoryData.category, resourceName), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          print({type = 'error', message = ('[LOADER ERROR] Failed to compile %s/%s/server.lua: %s'):format(categoryData.category, resourceName, errScript or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end)

      if not scriptSuccess then
        print({type = 'error', message = ('[LOADER ERROR] ' .. scriptError):format(scriptError), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      end
    end
  end

  if next(SupportedResourcesData) then
    AdapterSetup()
  else
    print({type = 'error', message = '[LOADER ERROR] Functions Initialization failed, No available script found, double check the fxmanifest', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
  end
end

CreateThread(function()
  TriggerEvent('tr_adapter:server:extractor_debug')
  while not ExtractorDebugerFinished do Wait(1000) end
  TriggerEvent('tr_adapter:server:selector_debug')
end)