ResourceAdapter = {}

local function detectAvailableSystems()
  local availableSystems = {}

  for systemName, _ in pairs(ResourceAdapter) do
    if systemName ~= '__index' and GetResourceState(systemName) == 'started' then
      availableSystems[systemName] = true
    end
  end

  return availableSystems
end

local function handleExceptions(functionConfig, args)
  if not functionConfig.exceptions then
    return '1'
  end

  for _, exception in ipairs(functionConfig.exceptions) do
    if exception.condition(args) then
      return exception.returnType
    end
  end

  return '1'
end

local function convertToExpectedFormat(rawResult, sourceSystem, expectedFormat, functionConfig, returnType)
  local targetFormat = functionConfig.returns[returnType]

  if type(targetFormat) == 'table' and #targetFormat == 1 then
    local primitiveType = targetFormat[1]

    if primitiveType == 'number' then
      if type(rawResult) == 'table' and #rawResult > 0 then
        local total = 0
        for _, item in ipairs(rawResult) do
          total = total + (item.count or item.amount or item.qty or 1)
        end
        return total
      elseif type(rawResult) == 'number' then
        return rawResult
      else
        return 0
      end
    elseif primitiveType == 'boolean' then
      return not not rawResult
    elseif primitiveType == 'string' then
      return tostring(rawResult or '')
    end
  end

  if type(rawResult) ~= 'table' then
    return rawResult
  end

  if sourceSystem == expectedFormat then
    return rawResult
  end

  local convertedItems = {}
  for _, rawItem in ipairs(rawResult) do
    local convertedItem = convertItemToFormat(rawItem, sourceSystem, expectedFormat)
    table.insert(convertedItems, convertedItem)
  end

  return convertedItems
end

function convertItemToFormat(rawItem, sourceSystem, targetFormat)
  if sourceSystem == targetFormat then
    return rawItem
  end

  if targetFormat == 'ox_inventory' then
    return {
      metadata = rawItem.info or rawItem.metadata or {},
      name = rawItem.name or '',
      weight = rawItem.weight or 0,
      label = rawItem.label or '',
      count = rawItem.amount or rawItem.count or 0,
      close = rawItem.shouldClose or rawItem.close or false,
      slot = rawItem.slot or 0,
      stack = not (rawItem.unique or false)
    }
  elseif targetFormat == 'qb-inventory' or targetFormat == 'ps-inventory' then
    return {
      amount = rawItem.count or rawItem.amount or 0,
      type = rawItem.type or 'item',
      useable = rawItem.useable or rawItem.usable or false,
      info = rawItem.metadata or rawItem.info or {},
      weight = rawItem.weight or 0,
      image = rawItem.image or (rawItem.name and rawItem.name .. '.png') or 'default.png',
      description = rawItem.description or rawItem.label or '',
      shouldClose = rawItem.close or rawItem.shouldClose or false,
      label = rawItem.label or '',
      slot = rawItem.slot or 0,
      name = rawItem.name or '',
      unique = rawItem.unique or not (rawItem.stack or false)
    }
  end

  return rawItem
end

local function createUniversalFunction(functionName)
  return function(expectedFormat, ...)
    local args = { ... }
    local caller = GetInvokingResource()

    local availableSystems = detectAvailableSystems()
    local targetSystem = nil
    local functionConfig = nil

    for systemName, _ in pairs(availableSystems) do
      if ResourceAdapter[systemName] and ResourceAdapter[systemName][functionName] then
        targetSystem = systemName
        functionConfig = ResourceAdapter[systemName][functionName]
        break
      end
    end

    if not targetSystem or not functionConfig then
      error('Function "' .. functionName .. '" not available in any loaded system')
    end

    local returnType = handleExceptions(functionConfig, args)

    functionConfig.functionName = functionName

    local actualFunction = functionConfig.label
    local rawResult = exports[targetSystem][actualFunction](table.unpack(args))

    return convertToExpectedFormat(rawResult, targetSystem, expectedFormat, functionConfig, returnType)
  end
end

ResourceAdapter = {
  ['__index'] = {},

  ['ox_inventory'] = {
    ['GetItems'] = {
      label = 'Search',
      returns = {
        ['1'] = {
          name = 'string',
          label = 'string',
          amount = 'number',
          weight = 'number',
          slot = 'number',
          metadata = 'table',
          usable = 'boolean'
        },
        ['2'] = { 'number' }
      },
      exceptions = {
        {
          condition = function(args) return #args == 4 and args[2] == 2 end,
          returnType = '2'
        }
      }
    },
    ['AddItem'] = {
      label = 'AddItem',
      returns = { ['1'] = { 'boolean' } }
    },
    ['RemoveItem'] = {
      label = 'RemoveItem',
      returns = { ['1'] = { 'boolean' } }
    },
    ['GetWeight'] = {
      label = 'GetWeight',
      returns = { ['1'] = { 'number' } }
    }
  },

  ['qb-inventory'] = {
    ['GetItems'] = {
      label = 'GetItemsByName',
      returns = {
        ['1'] = {
          name = 'string',
          label = 'string',
          amount = 'number',
          weight = 'number',
          slot = 'number',
          metadata = 'table',
          usable = 'boolean'
        }
      }
    },
    ['AddItem'] = {
      label = 'AddItem',
      returns = { ['1'] = { 'boolean' } }
    },
    ['RemoveItem'] = {
      label = 'RemoveItem',
      returns = { ['1'] = { 'boolean' } }
    },
    ['GetWeight'] = {
      label = 'GetTotalWeight',
      returns = { ['1'] = { 'number' } }
    }
  },

  ['ps-inventory'] = {
    ['GetItems'] = {
      label = 'GetItemsByName',
      returns = {
        ['1'] = {
          name = 'string',
          label = 'string',
          amount = 'number',
          weight = 'number',
          slot = 'number',
          metadata = 'table',
          usable = 'boolean'
        }
      }
    },
    ['AddItem'] = {
      label = 'AddItem',
      returns = { ['1'] = { 'boolean' } }
    }
  },
}

local function initializeUniversalSystem()
  local allFunctions = {}

  for systemName, systemConfig in pairs(ResourceAdapter) do
    if systemName ~= '__index' then
      for functionName, _ in pairs(systemConfig) do
        allFunctions[functionName] = true
      end
    end
  end

  for functionName, _ in pairs(allFunctions) do
    ResourceAdapter['__index'][functionName] = createUniversalFunction(functionName)

    exports(functionName, function(expectedFormat, ...)
      return createUniversalFunction(functionName)(expectedFormat, ...)
    end)
  end
end

initializeUniversalSystem()
