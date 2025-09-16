---@diagnostic disable: duplicate-set-field
---@version 1.2.3

---@class SetFuelType
---@param entity integer
---@param fuelType string

---@class setFuelType
---@return type function, SetFuelType

---@class GetFuel
---@param entity integer
---@return type number
Fuel.GetFuel = function(entity)
  return exports.lc_fuel:GetFuel(entity)
end

---@class SetFuel
---@param entity integer
---@param fuel number
Fuel.SetFuel = function(entity, fuel)
  exports.lc_fuel:SetFuel(entity, fuel | 100)
end

---@class getFuel
---@return type function, GetFuel

---@class setFuel
---@field SetFuel function