function LoadScripts()
  for _, data in ipairs(AvailableScripts) do
    if not data.duplicityVersion then goto continue end
    local success, error = pcall(function()
      local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/_init/server.lua')
      if not initContent then
        print('^3[LOADER WARNING]^7 Init file not found: ' .. data.category .. '/_init/server.lua', 'warn')
      else
        local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/server.lua')
        if chunkInit then
          chunkInit()
          print('^2[LOADER]^7 Successfully loaded: ' .. data.category .. '/_init/server.lua', 'info')
        else
          print('^1[LOADER ERROR]^7 Failed to compile ' ..
            data.category .. '/_init/server.lua: ' .. (errInit or 'Unknown error'), 'error')
        end
      end

      local scriptSuccess, scriptError = pcall(function()
        local scriptContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. data.category .. '/' .. data.name .. '/server.lua')
        if not scriptContent then
          print(' - ^3[LOADER WARNING]^7 File not found: ' .. data.category .. '/' .. data.name .. '/server.lua', 'warn')
          return
        end

        local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/server.lua')
        if chunkScript then
          chunkScript()
          print('^2 - [LOADER]^7 Successfully loaded: ' .. data.category .. '/' .. data.name .. '/server.lua', 'info')
        else
          print('^1 - [LOADER ERROR]^7 Failed to compile ' .. data.category .. '/' .. data.name .. '/server.lua: ' .. (errScript or 'Unknown error'), 'error')
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
  if next(AvailableScripts) then
    InitFunctions()
  else
    print('^1[LOADER ERROR] Functions Initialization failed', 'error^7')
  end
end
TriggerEvent('tr_adapter:server:extractor_debug')
while not ExtractorDebugerFinished do Wait(1000) end
TriggerEvent('tr_adapter:server:selector_debug')