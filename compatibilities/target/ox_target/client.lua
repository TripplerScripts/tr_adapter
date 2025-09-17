---@diagnostic disable: duplicate-set-field

---@param data OxTargetPolyZone | table
---@return number
Target.AddPolyZone = function(data)
  return exports.ox_target:addPolyZone(data)
end

---@param data OxTargetBoxZone | table
---@return number
Target.AddBoxZone = function(data)
  return exports.ox_target:addBoxZone(data)
end

---@param data OxTargetSphereZone | table
---@return number
Target.AddSphereZone = function(data)
  return exports.ox_target:addSphereZone(data)
end

---@param id number | string The ID of the zone to check. It can be either a number or a string representing the zone's index or name, respectively.
---@return boolean returns true if the zone with the specified ID exists, otherwise false.
Target.ZoneExists = function(id)
  return exports.ox_target:zoneExists(id)
end

---@param id number | string
---@param suppressWarning boolean?
Target.RemoveZone = function(id, suppressWarning)
  exports.ox_target:removeZone(id, suppressWarning)
end

---@param options OxTargetOption | OxTargetOption[]
Target.AddGlobalPed = function(options)
  exports.ox_target:addGlobalPed(options)
end

---@param options string | string[]
Target.RemoveGlobalPed = function(options)
  exports.ox_target:removeGlobalPed(options)
end

---@param options OxTargetOption | OxTargetOption[]
Target.AddGlobalVehicle = function(options)
  exports.ox_target:addGlobalVehicle(options)
end

---@param options string | string[]
Target.RemoveGlobalVehicle = function(options)
  exports.ox_target:removeGlobalVehicle(options)
end

---@param options OxTargetOption | OxTargetOption[]
Target.AddGlobalObject = function(options)
  exports.ox_target:addGlobalObject(options)
end

---@param options string | string[]
Target.RemoveGlobalObject = function(options)
  exports.ox_target:removeGlobalObject(options)
end

---@param options OxTargetOption | OxTargetOption[]
Target.AddGlobalPlayer = function(options)
  exports.ox_target:addGlobalPlayer(options)
end

---@param options string | string[]
Target.RemoveGlobalPlayer = function(options)
  exports.ox_target:removeGlobalPlayer(options)
end

---@param arr (number | string) | (number | string)[]
---@param options OxTargetOption | OxTargetOption[]
Target.AddModel = function(arr, options)
  exports.ox_target:addModel(arr, options)
end

---@param arr (number | string) | (number | string)[]
---@param options? string | string[]
Target.RemoveModel = function(arr, options)
  exports.ox_target:removeModel(arr, options)
end

---@param arr number | number[]
---@param options OxTargetOption | OxTargetOption[]
Target.AddEntity = function(arr, options)
  exports.ox_target:addEntity(arr, options)
end

---@param arr number | number[]
---@param options? string | string[]
Target.RemoveEntity = function(arr, options)
  exports.ox_target:removeEntity(arr, options)
end

---@param arr number | number[]
---@param options OxTargetOption | OxTargetOption[]
Target.AddLocalEntity = function(arr, options)
  exports.ox_target:addLocalEntity(arr, options)
end

---@param arr number | number[]
---@param options? table
Target.RemoveLocalEntity = function(arr, options)
  exports.ox_target:removeLocalEntity(arr, options)
end

---@param options OxTargetOption | OxTargetOption[]
Target.AddGlobalOption = function(options)
  exports.ox_target:addGlobalOption(options)
end

---@param options string | string[]
Target.RemoveGlobalOption = function(options)
  exports.ox_target:removeGlobalOption(options)
end

---@param entity? number
---@param _type? number
---@param model? number
Target.GetTargetOptions = function(entity, _type, model)
  return exports.ox_target:getTargetOptions(entity, _type, model)
end

Target.DisableTargeting = function(value)
  exports.ox_target:disableTargeting(value)
end

Target.IsActive = function()
  return exports.ox_target:isActive()
end