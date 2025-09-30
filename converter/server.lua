function BuildConversionTable(export, inventoryConfigs)
  local convertion = {}
  
  for scriptName, scriptConfig in pairs(inventoryConfigs) do
    if scriptName ~= '__index' and type(scriptConfig) == 'table' and scriptConfig.GetTargetItems and scriptConfig.GetTargetItems.returns then
      local returns = scriptConfig.GetTargetItems.returns
      
      for targetField, sourceField in pairs(returns) do
        if type(sourceField) == 'string' and export[sourceField] ~= nil then
          convertion[targetField] = export[sourceField]
        end
      end
    end
  end
  
  return convertion
end