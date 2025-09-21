-- Auto-parsing function extractor using FiveM's LoadResourceFile
local function ExtractFunctionInfo(func, funcName)
  local info = debug.getinfo(func, "S")
  if not info.source or not info.source:match("^@") then
    return nil
  end
  
  -- Get the source file path and resource name
  local filePath = info.source:sub(2) -- Remove @ prefix
  local resourceName = GetCurrentResourceName()
  
  -- Use FiveM's LoadResourceFile to get the source code
  local content = LoadResourceFile(resourceName, '/compatibilities/' .. filePath)
  if not content then 
    print("  Error: Cannot load file", filePath)
    return nil 
  end
  
  print("Parsing function:", funcName)
  print("File content preview:", content:sub(1, 200) .. "...")
  
  -- Extract the specific function definition
  local patterns = {
    -- Pattern 1: Inventory.FuncName = function(params) return exports.resource:func(params) end
    "(%w+)%.(" .. funcName .. ")%s*=%s*function%s*%(([^)]*)%).-return%s+exports%.([^:%.%s]+):(%w+)%s*%(([^)]*)%)",
    
    -- Pattern 2: Inventory['FuncName'] = function(params) return exports['resource']:func(params) end
    "(%w+)%[%s*['\"]" .. funcName .. "['\"]%s*%]%s*=%s*function%s*%(([^)]*)%).-return%s+exports%[%s*['\"]([^'\"]+)['\"]%s*%]:(%w+)%s*%(([^)]*)%)",
    
    -- Pattern 3: Multi-line function with whitespace
    "(%w+)%.(" .. funcName .. ")%s*=%s*function%s*%(([^)]*)%)%s*return%s+exports%.([^:%.%s]+):(%w+)%s*%(([^)]*)%)",
    
    -- Pattern 4: More flexible whitespace handling
    funcName .. "%s*=%s*function%s*%(([^)]*)%).-return%s+exports%.([^:%.%s]+):(%w+)%s*%(([^)]*)%)"
  }
  
  for i, pattern in ipairs(patterns) do
    print("Trying pattern", i, ":", pattern)
    
    if i <= 3 then
      local globalTable, matchedFunc, params, targetResource, targetFunc, targetParams = content:match(pattern)
      if globalTable and matchedFunc then
        print("Match found with pattern", i)
        return {
          globalTable = globalTable,
          funcName = funcName,
          params = params:gsub("%s", ""),
          targetResource = targetResource,
          targetFunction = targetFunc,
          targetParams = targetParams:gsub("%s", "")
        }
      end
    else
      local params, targetResource, targetFunc, targetParams = content:match(pattern)
      if params then
        print("Match found with pattern", i)
        return {
          globalTable = "Unknown",
          funcName = funcName,
          params = params:gsub("%s", ""),
          targetResource = targetResource,
          targetFunction = targetFunc,
          targetParams = targetParams:gsub("%s", "")
        }
      end
    end
  end
  
  print("No pattern matched for:", funcName)
  return nil
end

-- Parse all functions in a resource table
local function ParseResourceFunctions(resourceTable, resourceTableName)
  local parsedFunctions = {}
  
  for funcName, func in pairs(resourceTable) do
    if type(func) == "function" then
      local info = ExtractFunctionInfo(func, funcName)  -- Pass funcName here
      if info then
        parsedFunctions[funcName] = info
        print("Parsed:", info.globalTable, info.funcName, "->", info.targetResource, info.targetFunction)
      else
        print("Could not parse function:", funcName, "warn")
      end
    end
  end
  
  return parsedFunctions
end

-- Generate reverse mappings by parsing ALL resource files (not just available one)
local function GenerateExportMappings(categoryName, availableResource, resourceTable)
  local exportMappings = {}
  
  print("Generating export mappings...")
  print("Available resource:", availableResource)
  
  -- Parse functions from ALL supported resources to get their export names
  for _, script in pairs(ScriptsToSupport) do
    if script.category == categoryName and script.name ~= availableResource then
      print("Parsing missing resource:", script.name)
      
      -- Try to load and parse the missing resource's file
      local filePath = categoryName .. "/" .. script.name .. "/server.lua"
      local content = LoadResourceFile(GetCurrentResourceName(), '/compatibilities/' .. filePath)
      
      if content then
        print("Loaded file:", filePath)
        
        -- Parse functions that call the missing resource's exports
        for funcName in pairs(resourceTable) do
          if type(resourceTable[funcName]) == "function" then
            -- Look for patterns like: Inventory.FuncName = function(...) return exports['missing-resource']:ExportName(...)
            local patterns = {
              "(" .. funcName .. ")%s*=%s*function%s*%(([^)]*)%).-return%s+exports%[%s*['\"]" .. script.name .. "['\"]%s*%]:(%w+)%s*%(([^)]*)%)",
              "(" .. funcName .. ")%s*=%s*function%s*%(([^)]*)%).-return%s+exports%." .. script.name:gsub("%-", "\\-") .. ":(%w+)%s*%(([^)]*)%)"
            }
            
            for _, pattern in ipairs(patterns) do
              local matchedFunc, params, exportName, exportParams = content:match(pattern)
              print("Content exists:", content ~= nil)
              print("Content type:", type(content))
              if content then
                print("Content length:", #content)
                print("Content preview:", content:sub(1, 100))
              end
              if matchedFunc and exportName then
                if not exportMappings[script.name] then
                  exportMappings[script.name] = {}
                end
                exportMappings[script.name][exportName] = funcName  -- Map export name to parent function
                print("  -> Will create listener:", script.name .. ":" .. exportName, "->", "Inventory." .. funcName)
                break
              end
            end
          end
        end
      else
        print("Could not load file:", filePath)
      end
    end
  end
  
  return exportMappings
end

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
    
    if not resourceTable then
      print("No resource table found for category:", categoryInfo.categoryVariable, "warn")
      goto continue
    end

    -- Auto-parse all functions in the resource table
    print("Auto-parsing functions for:", categoryInfo.categoryVariable)
    local parsedFunctions = ParseResourceFunctions(resourceTable, categoryInfo.categoryVariable)
    
    -- Register exports for all functions
    for funcName, func in pairs(resourceTable) do
      if type(func) == "function" then
        exports(funcName, func)
        print("Registered export:", funcName)
      end
    end

    -- Generate export mappings by parsing missing resource files
    local exportMappings = GenerateExportMappings(categoryInfo.category, categoryInfo.availableResource, resourceTable)
    
    -- Create export listeners for missing resources
    for resourceName, funcMappings in pairs(exportMappings) do
      for localFuncName, exportName in pairs(funcMappings) do
        if resourceTable[localFuncName] then
          AddEventHandler(('__cfx_export_%s_%s'):format(resourceName, exportName), function(setCB)
            setCB(resourceTable[localFuncName])
          end)
          print("Auto-created export listener:", resourceName, exportName, "->", localFuncName)
        end
      end
    end

    ::continue::
  end
end

-- Alternative approach using string dumping (if file reading isn't available)
local function ExtractFromDump(func)
  local success, dump = pcall(string.dump, func)
  if not success then return nil end
  
  -- This is much more complex as you'd need to parse Lua bytecode
  -- or use debug.getlocal and other debug functions
  -- File parsing approach above is more reliable
  
  return nil
end