local function loadScripts()
  for _, data in ipairs(AvailableScripts) do
    if data.duplicityVersion then goto continue end
    local success, error = pcall(function()
      local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/client.lua') and not LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/server.lua')
      if not initContent then
        exports.tr_lib:print('warn', '[LOADER WARNING] Init file not found: ' .. data.category .. '/_init/client.lua')
      else
        local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/client.lua')
        if chunkInit then
          chunkInit()
          exports.tr_lib:print('info', '[LOADER] Successfully loaded: ' .. data.category .. '/_init/client.lua')
        else
          exports.tr_lib:print('error', '[LOADER ERROR] Failed to compile ' .. data.category .. '/_init/client.lua: ' .. (errInit or 'Unknown error'))
        end
      end

      local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/' .. data.name .. '/client.lua')
        if not scriptContent then
          exports.tr_lib:print('warn', '[LOADER WARNING] File not found: ' .. data.category .. '/' .. data.name .. '/client.lua')
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/client.lua')
        if chunkScript then
          chunkScript()
          exports.tr_lib:print('info', '[LOADER] Successfully loaded: ' .. data.category .. '/' .. data.name .. '/client.lua')
        else
          exports.tr_lib:print('error', '[LOADER ERROR] Failed to compile ' .. data.category .. '/' .. data.name .. '/client.lua: ' .. (errScript or 'Unknown error'))
        end
      end)

      if not scriptSuccess then
        exports.tr_lib:print('error', '[LOADER ERROR] ' .. scriptError)
      end
    end)

    if not success then
      exports.tr_lib:print('error', '[LOADER ERROR] ' .. error)
    end
    ::continue::
  end

  IsReadyToInit = true
  InitScripts()
end

RegisterNetEvent('tr_adapter:api', function()
  loadScripts()
end)