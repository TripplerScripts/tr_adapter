---@diagnostic disable: duplicate-set-field
--[[ Core = {}

Core.SetPlayerData = function(playerInfo)
  local playerData = {
    gang = {
      name = playerInfo.gangDetails[1],
      label = playerInfo.gangDetails[2],
      gangRank = playerInfo.gangDetails[3]
    },
    playerMoney = playerInfo.playerMoney,
    job = {
      name = playerInfo.jobName,
      label = playerInfo.jobLabel,
      rank = playerInfo.jobRank
    },
    char = {
      name = playerInfo.PlayerName
    }
  }
  return SetPlayerData(playerData)
end ]]

Core = {
  ['qb-core'] = {
   functions = {
    ['SetPlayerData'] = 'setPlayerData'
   }
  },
  ['ox_core'] = {
   functions = {
    ['SetPlayerData'] = 'setPlayerData'
   }
  },
  ['esx_core'] = {
   functions = {
    ['SetPlayerData'] = 'setPlayerData'
   }
  }
}

Categories = {}
for _, data in pairs(AvailableScripts) do
  Categories[#Categories + 1] = { 
    category = data.category, 
    categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
    availableResource = data.name  -- Add the actual available resource name
  }
end

function InitFunctions()
  for _, categoryInfo in pairs(Categories) do
    local resourceTable = _G[categoryInfo.categoryVariable]
    local availableResourceName = categoryInfo.availableResource
    
    if resourceTable[availableResourceName] then
      local resourceData = resourceTable[availableResourceName]
      for funcName, func in pairs(resourceData.functions) do
        _G[funcName] = function(dataObj)
          print("Received data:", json.encode(dataObj, { indent = true }))
          return exports[availableResourceName][func](_, dataObj.name, dataObj.job, dataObj.playerMoney)
        end
      end
    end
  end
  exports('SetPlayerData', function (name, job, money)
    return SetPlayerData(name, job, money)
  end)
end