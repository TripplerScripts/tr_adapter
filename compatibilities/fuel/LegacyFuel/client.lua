---@diagnostic disable: duplicate-set-field
---@version 1.3.0?

---@class GetFuel
---@field entity integer
---@return type number
Fuel.GetFuel = function(entity)
  return exports['LegacyFuel']:GetFuel(entity)
end

---@class SetFuel
---@param entity integer
---@param fuel number
Fuel.SetFuel = function(entity, fuel)
  exports['LegacyFuel']:SetFuel(entity, fuel)
end