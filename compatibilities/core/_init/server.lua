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
  Categories[#Categories + 1] = { category = data.category, categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2) }
end

function InitFunctions()
  for _, categoryInfo in pairs(Categories) do
    local resourceTable = _G[categoryInfo.categoryVariable]
    for resourceName, resourceData in pairs(resourceTable) do
      for funcName, func in pairs(resourceData.functions) do
        _G[funcName] = function(data)
          return exports[resourceName][func](data.char.name, data.job.name, data.playerMoney)
        end
      end
    end
  end
end