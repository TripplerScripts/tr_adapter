---@diagnostic disable: duplicate-set-field
Inventory = {}

Inventory = {
  __index = {
    GetTargetItems = function(called, handler, ...)
      -- a normal and usual steps
      --[[ start ]]
      local functionsSettings = {}
      local param = {...}

      local exportLabel = Inventory[handler].GetTargetItems.label
      local map = MapArguments(param, Inventory[called].GetTargetItems.args, Inventory[handler].GetTargetItems.args)
      local export = exports[handler][exportLabel](_, table.unpack(map))[1]
      local convertion = BuildConversionTable(export, Inventory)
      --[[ end ]]

      --Inventory scripts exception
      --[[ start ]]
      -- look, this is an exception, can we create like a another function that we put our functions's exception like
      
      if called == 'ox_inventory' then
        if param[2] == 1 then
          functionsSettings = Inventory[called].GetTargetItems.returns
          for missingArg, missingValue in pairs(functionsSettings) do
            for shopArg, shopValue in pairs(convertion) do
              if missingArg == shopArg then
                functionsSettings[missingArg] = shopValue
              end
            end
          end
        elseif param[2] == 2 then
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
            functionsSettings[missingArg] = (convertion.name or 'item') .. '.png'
          else
            for shopArg, shopValue in pairs(convertion) do
              if missingArg == shopArg then
                functionsSettings[missingArg] = shopValue
              end
            end
          end
        end
      end
      --[[ end ]]

      return functionsSettings
    end
  }
}