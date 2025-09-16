---@diagnostic disable: duplicate-set-field
---@version 2.1.9

---@class IsHoldingElectricNozzle
---@return type boolean

---@class SetElectricNozzle
---@param state string

---@class FetchStationInfo
---@param info string
---@return type integer

---@class UpdateStationInfo
---@param info string

---@class GetFuel
---@param entity integer
---@return type number
Fuel.GetFuel = function(entity)
  return exports['cdn-fuel']:GetFuel(entity)
end

---@class SetFuelType
---@param entity integer
---@param fuel number
Fuel.SetFuel = function(entity, fuel)
  exports['cdn-fuel']:SetFuel(entity, fuel)
end