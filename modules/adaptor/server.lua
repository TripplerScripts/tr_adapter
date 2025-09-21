function InitFunctions()
  local Categories = {}
  for _, data in pairs(AvailableScripts) do
    Categories[#Categories + 1] = {
      category = data.category,
      categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
      availableResource = data.name
    }
  end

  for _, categoryInfo in pairs(Categories) do
    local resourceTable = _G[categoryInfo.categoryVariable]

    if not resourceTable then goto continue end

    for funcName, func in pairs(resourceTable) do
      if type(func) == "function" then
        exports(funcName, func)
      end
    end

    local exportMappings = {
      ['qb-core'] = {
        SetPlayerData = 'setPlayerData',
        GetPlayerData = 'getPlayerData'
      },
      ['ox_core'] = {
        SetPlayerData = 'setPlayerInfo',
        GetPlayerData = 'getPlayerInfo'
      },
      ['esx_core'] = {
        SetPlayerData = 'setPlayerData',
        GetPlayerData = 'getPlayerData'
      }
    }

    for resourceName, funcMappings in pairs(exportMappings) do
      if resourceName ~= categoryInfo.availableResource then
        for localFuncName, exportName in pairs(funcMappings) do
          if resourceTable[localFuncName] then
            AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, exportName), function(setCB)
              setCB(resourceTable[localFuncName])
            end)
          end
        end
      end
    end

    ::continue::
  end
end
