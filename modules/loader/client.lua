local function loadScripts()
  for _, data in ipairs(AvailableScripts) do
    if data.duplicityVersion then goto continue end
    local success, error = pcall(function()
      local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/client.lua') and not LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/server.lua')
      if not initContent then
        exports.tr_lib:print({type = 'warn', message = '[LOADER WARNING] Init file not found: ' .. data.category .. '/_init/client.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      else
        local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/client.lua')
        if chunkInit then
          chunkInit()
          exports.tr_lib:print({type = 'info', message = '[LOADER] Successfully loaded: ' .. data.category .. '/_init/client.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          exports.tr_lib:print({type = 'error', message = '[LOADER ERROR] Failed to compile ' .. data.category .. '/_init/client.lua: ' .. (errInit or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end

      local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/' .. data.name .. '/client.lua')
        if not scriptContent then
          exports.tr_lib:print({type = 'warn', message = '[LOADER WARNING] File not found: ' .. data.category .. '/' .. data.name .. '/client.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/client.lua')
        if chunkScript then
          chunkScript()
          exports.tr_lib:print({type = 'info', message = '[LOADER] Successfully loaded: ' .. data.category .. '/' .. data.name .. '/client.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        else
          exports.tr_lib:print({type = 'error', message = '[LOADER ERROR] Failed to compile ' .. data.category .. '/' .. data.name .. '/client.lua: ' .. (errScript or 'Unknown error'), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
      end)

      if not scriptSuccess then
        exports.tr_lib:print({type = 'error', message = '[LOADER ERROR] ' .. scriptError, path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
      end
    end)

    if not success then
      exports.tr_lib:print({type = 'error', message = '[LOADER ERROR] ' .. error, path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
    end
    ::continue::
  end

  IsReadyToInit = true
  InitScripts()
end

RegisterNetEvent('tr_adapter:api', function()
  loadScripts()
end)