while not IsReadyToLoad do
  Wait(1000)
end

for _, data in ipairs(AvailableScripts) do
  local success, error = pcall(function()
    -- Load _init server file (main/core file)
    local initContent = LoadResourceFile(GetCurrentResourceName(),
      'compatibilities/' .. data.category .. '/_init/server.lua')
    if not initContent then
      print('^3[LOADER WARNING]^7 Init file not found: ' .. data.category .. '/_init/server.lua')
    else
      local chunkInit, errInit = load(initContent, '@' .. data.category .. '/_init/server.lua')
      if chunkInit then
        chunkInit()
        print('^2[LOADER]^7 Successfully loaded: ' .. data.category .. '/_init/server.lua')
      else
        print('^1[LOADER ERROR]^7 Failed to compile ' ..
        data.category .. '/_init/server.lua: ' .. (errInit or 'Unknown error'))
      end
    end

    -- Load specific script server file
    local scriptSuccess, scriptError = pcall(function()
      local scriptContent = LoadResourceFile(GetCurrentResourceName(),
        'compatibilities/' .. data.category .. '/' .. data.name .. '/server.lua')
      if not scriptContent then
        print(' - ^3[LOADER WARNING]^7 File not found: ' .. data.category .. '/' .. data.name .. '/server.lua')
        return
      end

      local chunkScript, errScript = load(scriptContent, '@' .. data.category .. '/' .. data.name .. '/server.lua')
      if chunkScript then
        chunkScript()
        print('^2 - [LOADER]^7 Successfully loaded: ' .. data.category .. '/' .. data.name .. '/server.lua')
      else
        print('^1 - [LOADER ERROR]^7 Failed to compile ' ..
        data.category .. '/' .. data.name .. '/server.lua: ' .. (errScript or 'Unknown error'))
      end
    end)

    if not scriptSuccess then
      print('^1[LOADER ERROR]^7 ' .. scriptError)
    end
  end)

  if not success then
    print('^1[LOADER ERROR]^7 ' .. error)
  end
end
