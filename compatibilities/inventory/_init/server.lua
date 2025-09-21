---@diagnostic disable: duplicate-set-field
Inventory = {}
local test = require 'test'
Inventory = {
  ['ox_inventory'] = {
    functions = {
      ['GetSlot'] = {
        label = 'GetSlot',
        args = {
          'inv', 'slotId'
        }
      },
    }
  },
  ['qb-inventory'] = {
    functions = {
      ['GetSlot'] = {
        label = 'GetItemBySlot',
        args = {
          'source', 'slot'
        }
      }
    }
  },
}

-- Categories array built from AvailableScripts
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
    local categoryName = categoryInfo.category
    local availableResourceName = categoryInfo.availableResource

    -- Dynamic access to global variables (Inventory, Core, Fuel, etc.)
    local resourceTable = _G[categoryInfo.categoryVariable]
    if not resourceTable then
      print("No resource table found for category:", categoryInfo.categoryVariable, "warn")
      goto continue
    end

    -- Get the available resource config (the one that's actually running)
    local availableResourceData = resourceTable[availableResourceName]
    if not availableResourceData then
      print("No config found for resource:", availableResourceName, "in category:", categoryName, "warn")
      goto continue
    end

    -- Filter out functions from the resourceTable, only process config tables
    local cleanResourceTable = {}
    for resourceName, resourceData in pairs(resourceTable) do
      if type(resourceData) == "table" and resourceData.functions then
        cleanResourceTable[resourceName] = resourceData
      end
    end

    -- Process ALL valid resources in this category to create comprehensive export listeners
    for resourceName, resourceData in pairs(cleanResourceTable) do
      for funcName, funcConfig in pairs(resourceData.functions) do
        
        -- Only create the actual function once (from the available resource)
        if resourceName == availableResourceName and not _G[funcName] then
          local exportLabel = funcConfig.label

          -- Create the adapter function that calls the available resource  
          _G[funcName] = function(...)
            local params = {...}
            local orderedArgs = {}
            
            -- Support both calling methods
            if #params == 1 and type(params[1]) == "table" then
              -- Called with data object: GetItemBySlot({source: 1, slot: 1})
              local dataObj = params[1]
              for i, argName in ipairs(funcConfig.args) do
                orderedArgs[i] = dataObj[argName]
              end
            else
              -- Called with individual params: GetItemBySlot(1, 1)
              -- Map the available resource's parameter names to received params
              local availableFuncConfig = availableResourceData.functions[funcName]
              for i = 1, #params do
                orderedArgs[i] = params[i]
              end
            end

            print("Calling:", availableResourceName, exportLabel, "with args:", json.encode(orderedArgs))
            return exports[availableResourceName][exportLabel](table.unpack(orderedArgs))
          end

          -- Register as export
          exports(funcName, _G[funcName])
          print("Registered export:", funcName)
        end

        -- Only create export listener for OTHER resources (not the available one)
        if _G[funcName] and resourceName ~= availableResourceName then
          print(resourceName, funcConfig.label)
          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, funcConfig.label), function(setCB)
            setCB(_G[funcName])
          end)
          print("Created export listener:", resourceName, funcConfig.label)
        end
      end
    end

    ::continue::
  end
end

-- Example usage:
--[[
exports.tr_adapter:SetPlayerData({
  name = 'lenix',
  job = {
    details = {
      grade = 1,
      grade_label = 'Officer'
    },
    label = 'police',
  },
  money = 1000
})
]]