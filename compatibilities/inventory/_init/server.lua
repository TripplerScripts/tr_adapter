---@diagnostic disable: duplicate-set-field

Inventory = {}
Inventory.tr_adapter = {}

Inventory.tr_adapter.GetTargetItem = function(called, param, functionName, convertion)
  local functionsSettings
  if called == 'ox_inventory' then
    if param[2] == 1 then
      functionsSettings = Inventory[called][functionName].returns
      for missingArg, _ in pairs(functionsSettings) do
        for shopArg, shopValue in pairs(convertion) do
          if missingArg == shopArg then
            functionsSettings[missingArg] = shopValue
          end
        end
      end
    elseif param[2] == 2 then
      functionsSettings = Inventory[called][functionName].returns
      for missingArg, _ in pairs(functionsSettings) do
        for shopArg, shopValue in pairs(convertion) do
          if shopArg == 'count' and missingArg == 'count' then
            functionsSettings = shopValue
            break
          end
        end
      end
    end
  elseif called == 'qb-inventory' then
    functionsSettings = Inventory[called][functionName].returns
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