---@diagnostic disable: duplicate-set-field
Inventory = {}
Inventory.GetInventory = function()
  print('No inventory resource available - GetInventory called', 'warn')
  return {}
end

for _, table in ipairs(ScriptsToSupport) do
  if table.category == "inventory" then
    local initContent = LoadResourceFile(GetCurrentResourceName(), 'compatibilities/' .. table.category .. '/' .. table.name .. '/server.lua')
    if not initContent then
      print('^3[LOADER WARNING]^7 Init file not found: ' .. table.category .. '/' .. table.name .. '/server.lua')
    else
      local chunkInit, errInit = load(initContent, '@' .. table.category .. '/' .. table.name .. '/server.lua')
      if chunkInit then
        chunkInit()
        print('^2[LOADER]^7 Successfully loaded: ' .. table.category .. '/' .. table.name .. '/server.lua')
      else
        print('^1[LOADER ERROR]^7 Failed to compile ' ..
          table.category .. '/' .. table.name .. '/server.lua: ' .. (errInit or 'Unknown error'))
      end
    end
    for _, export in pairs(UniqueFunctions) do
      print(table.name .. ':' .. export)
      AddEventHandler(('__cfx_export_%s_%s'):format(table.name, export), function(setCB)
        setCB(function()
          return Inventory.GetInventory()
        end)
      end)
    end
  end
end
