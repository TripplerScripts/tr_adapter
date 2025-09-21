---@diagnostic disable: duplicate-set-field

print('TR Adapter: Core compatibility loaded')
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
      ['SetPlayerData'] = {
        label = 'setPlayerData',
        args = {
          'name', 'job', 'money'
        }
      },
      ['GetPlayerData'] = {
        label = 'getPlayerData',
        args = {
          'identifier'
        }
      }
    }
  },
  ['ox_core'] = {
    functions = {
      ['SetPlayerData'] = {
        label = 'setPlayerInfo',
        args = {
          'gangDetails', 'jobLabel', 'jobDetails', 'balance', 'charName'
        }
      }
    }
  },
  ['esx_core'] = {
    functions = {
      ['SetPlayerData'] = {
        label = 'setCharInfo',
        args = {
          'bank', 'gang', 'dob', 'car'
        }
      }
    }
  }
}

Categories = {}
for _, data in pairs(AvailableScripts) do
  Categories[#Categories + 1] = {
    category = data.category,
    categoryVariable = string.upper(string.sub(data.category, 1, 1)) .. string.sub(data.category, 2),
    availableResource = data.name
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
          local label = func.label

          if type(resourceData[label]) == 'table' then
            label = resourceData[label].label
          end

          local orderedArgs = {}
          for i, argName in ipairs(func.args) do
            orderedArgs[i] = dataObj[argName]
          end

          return exports[availableResourceName][label](nil, table.unpack(orderedArgs))
        end
        exports(funcName, _G[funcName])
      end
    end
  end
end
