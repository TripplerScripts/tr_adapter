local function loadScripts()
  for _, data in ipairs(AvailableScripts) do
    if data.duplicityVersion then goto continue end
    local success, error = pcall(function()
      -- Load _init client file (main/core file)
      local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/client.lua') and not LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/server.lua')
      if not initContent then
        print('^3[LOADER WARNING]^7 Init file not found: ' .. data.category .. '/_init/client.lua', 'warn')
      else
        local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/client.lua')
        if chunkInit then
          chunkInit()
          print('^2[LOADER]^7 Successfully loaded: ' .. data.category .. '/_init/client.lua', 'info')
        else
          print('^1[LOADER ERROR]^7 Failed to compile ' .. data.category .. '/_init/client.lua: ' .. (errInit or 'Unknown error'), 'error')
        end
      end

      -- Load specific script client file
      local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/' .. data.name .. '/client.lua')
        if not scriptContent then
          print(' - ^3[LOADER WARNING]^7 File not found: ' .. data.category .. '/' .. data.name .. '/client.lua', 'warn')
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/client.lua')
        if chunkScript then
          chunkScript()
          print('^2 - [LOADER]^7 Successfully loaded: ' .. data.category .. '/' .. data.name .. '/client.lua', 'info')
        else
          print('^1 - [LOADER ERROR]^7 Failed to compile ' .. data.category .. '/' .. data.name .. '/client.lua: ' .. (errScript or 'Unknown error'), 'error')
        end
      end)

      if not scriptSuccess then
        print('^1[LOADER ERROR]^7 ' .. scriptError, 'error')
      end
    end)

    if not success then
      print('^1[LOADER ERROR]^7 ' .. error, 'error')
    end
    ::continue::
  end

  IsReadyToInit = true
  InitScripts()
end

RegisterNetEvent('tr_adapter:api', function()
  loadScripts()
end)