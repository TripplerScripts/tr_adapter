---@diagnostic disable: duplicate-set-field

Inventory = {}
Inventory.tr_adapter = {}

Inventory.tr_adapter = function(called, handler, ...)
  for _, functionName in pairs(ScriptsFunctions['inventory']) do
    functionName(called, handler, ...)
    local functionsSettings = GenerateFunctionENV(Inventory, handler, functionName, called)
    if called == 'ox_inventory' then
      if ...[2] == 1 then
        functionsSettings = Inventory[called].GetTargetItems.returns
        for missingArg, missingValue in pairs(functionsSettings) do
          for shopArg, shopValue in pairs(convertion) do
            if missingArg == shopArg then
              functionsSettings[missingArg] = shopValue
            end
          end
        end
      elseif ...[2] == 2 then
        functionsSettings = Inventory[called].GetTargetItems.returns
        for missingArg, missingValue in pairs(functionsSettings) do
          for shopArg, shopValue in pairs(convertion) do
            if shopArg == 'count' and missingArg == 'count' then
              functionsSettings = shopValue
              break
            end
          end
        end
      end
    elseif called == 'qb-inventory' then
      functionsSettings = Inventory[called].GetTargetItems.returns
      for missingArg, missingValue in pairs(functionsSettings) do
        if missingValue == 'image' then
          assert(convertion.name ~= nil, 'convertion.name is nil')
          functionsSettings[missingArg] = (convertion.name) .. '.png'
        else
          for shopArg, shopValue in pairs(convertion) do
            if missingArg == shopArg then
              functionsSettings[missingArg] = shopValue
            end
          end
        end
      end
    end
    return functionsSettings
  end
end