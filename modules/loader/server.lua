function LoadScripts()
  for _, data in ipairs(AvailableScripts) do
    if not data.duplicityVersion then goto continue end
    local success, error = pcall(function()
      local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/server.lua')
      if not initContent then
        exports.tr_lib:print({type = 'warn', message = ('[LOADER WARNING] Init file not found: %s/_init/server.lua'):format(data.category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      else
        local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/server.lua')
        if chunkInit then
          chunkInit()
          exports.tr_lib:print({type = 'info', message = ('[LOADER] Successfully loaded: %s/_init/server.lua'):format(data.category), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          exports.tr_lib:print({type = 'error', message = ('[LOADER ERROR] Failed to compile %s/_init/server.lua: %s'):format(data.category, errInit or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end

      --[[ local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/' .. data.name .. '/server.lua')
        if not scriptContent then
          exports.tr_lib:print({type = 'warn', message = '[LOADER WARNING] File not found: ' .. data.category .. '/' .. data.name .. '/server.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/server.lua')
        if chunkScript then
          chunkScript()
          exports.tr_lib:print({type = 'info', message = ('[LOADER] Successfully loaded: %s/%s/server.lua'):format(data.category, data.name), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          exports.tr_lib:print({type = 'error', message = ('[LOADER ERROR] Failed to compile %s/%s/server.lua: %s'):format(data.category, data.name, errScript or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end)

      if not scriptSuccess then
        exports.tr_lib:print({type = 'error', message = ('[LOADER ERROR] ' .. scriptError):format(scriptError), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      end ]]
    end)

    if not success then
      exports.tr_lib:print({type = 'error', message = ('[LOADER ERROR] ' .. error):format(error), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    end
    ::continue::
  end

  IsReadyToInit = true
  if next(AvailableScripts) then
    InitFunctions()
  else
    exports.tr_lib:print({type = 'error', message = '[LOADER ERROR] Functions Initialization failed, No available script found, double check the fxmanifest', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
  end
end

CreateThread(function()
  TriggerEvent('tr_adapter:server:extractor_debug')
  while not ExtractorDebugerFinished do Wait(1000) end
  TriggerEvent('tr_adapter:server:selector_debug')
end)