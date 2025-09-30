function GenerateFunctionENV(category, handler, functionName, called)
  -- a normal and usual steps
  --[[ start ]]
  local functionsSettings = {}
  local param = {...}

  local exportLabel = category[handler][functionName].label
  local map = MapArguments(param, category[called][functionName].args, category[handler][functionName].args)
  local export = exports[handler][exportLabel](_, table.unpack(map))[1]
  local convertion = BuildConversionTable(export, category)
  --[[ end ]]

  --Inventory scripts exception
  --[[ start ]]
  -- look, this is an exception, can we create like a another function that we put our functions's exception like
  
  functionsSettings = category[called][functionName].returns
  for missingArg, missingValue in pairs(functionsSettings) do
    for shopArg, shopValue in pairs(convertion) do
      if missingArg == shopArg then
        functionsSettings[missingArg] = shopValue
      end
    end
  end
  --[[ end ]]

  return functionsSettings
end