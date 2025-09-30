function InitOrder(Category, convertion, functionName, called)
  local functionsSettings = Category[called][functionName].returns
  for missingArg, _ in pairs(functionsSettings) do
    for shopArg, shopValue in pairs(convertion) do
      if shopArg == 'count' and missingArg == 'count' then
        functionsSettings = shopValue
        break
      end
    end
  end
  return functionsSettings
end