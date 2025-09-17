---@diagnostic disable: duplicate-set-field

Target.RaycastCamera = function(flag, playerCoords)
  return exports['qb-target']:RaycastCamera(flag, playerCoords)
end

Target.DisableNUI = function()
  exports['qb-target']:DisableNUI()
end

Target.EnableNUI = function(options)
  exports['qb-target']:EnableNUI(options)
end

Target.LeftTarget = function()
  exports['qb-target']:LeftTarget()
end

Target.DisableTarget = function(forcedisable)
  exports['qb-target']:DisableTarget(forcedisable)
end

Target.DrawOutlineEntity = function(entity, bool)
  exports['qb-target']:DrawOutlineEntity(entity, bool)
end

Target.CheckEntity = function(flag, datatable, entity, distance)
  exports['qb-target']:CheckEntity(flag, datatable, entity, distance)
end

Target.CheckBones = function(coords, entity, bonelist)
  return exports['qb-target']:CheckBones(coords, entity, bonelist)
end

Target.AddCircleZone = function(name, center, radius, options, targetoptions)
  return exports['qb-target']:AddCircleZone(name, center, radius, options, targetoptions)
end

Target.AddBoxZone = function(name, center, length, width, options, targetoptions)
  return exports['qb-target']:AddBoxZone(name, center, length, width, options, targetoptions)
end

Target.AddPolyZone= function(name, points, options, targetoptions)
  return exports['qb-target']:AddPolyZone(name, points, options, targetoptions)
end

Target.AddComboZone = function(zones, options, targetoptions)
  return exports['qb-target']:AddComboZone(zones, options, targetoptions)
end

Target.AddEntityZone = function(entity, options, targetoptions)
  return exports['qb-target']:AddEntityZone(entity, options, targetoptions)
end

Target.RemoveZone = function(name)
  exports['qb-target']:RemoveZone(name)
end

Target.AddTargetBone = function(bones, parameters)
  exports['qb-target']:AddTargetBone(bones, parameters)
end

Target.RemoveTargetBone = function(bones, labels)
  exports['qb-target']:RemoveTargetBone(bones, labels)
end

Target.AddTargetEntity = function(entities, parameters)
  exports['qb-target']:AddTargetEntity(entities, parameters)
end

Target.RemoveTargetEntity = function(entities, labels)
  exports['qb-target']:RemoveTargetEntity(entities, labels)
end

Target.AddTargetModel = function(models, parameters)
  exports['qb-target']:AddTargetModel(models, parameters)
end

Target.RemoveTargetModel = function(models, labels)
  exports['qb-target']:RemoveTargetModel(models, labels)
end

Target.AddGlobalType = function(type, parameters)
  exports['qb-target']:AddGlobalType(type, parameters)
end

Target.AddGlobalPed = function(parameters)
  exports['qb-target']:AddGlobalPed(parameters)
end

Target.AddGlobalVehicle = function(parameters)
  exports['qb-target']:AddGlobalVehicle(parameters)
end

Target.AddGlobalObject = function(parameters)
  exports['qb-target']:AddGlobalObject(parameters)
end

Target.AddGlobalPlayer = function(parameters)
  exports['qb-target']:AddGlobalPlayer(parameters)
end

Target.RemoveGlobalType = function(typ, labels)
  exports['qb-target']:RemoveGlobalType(typ, labels)
end

Target.RemoveGlobalPlayer = function(labels)
  exports['qb-target']:RemoveGlobalPlayer(labels)
end

Target.DeletePeds = function()
  exports['qb-target']:DeletePeds()
end

Target.SpawnPed = function(data)
  exports['qb-target']:SpawnPed(data)
end

Target.RemoveSpawnedPed = function(peds)
  exports['qb-target']:RemoveSpawnedPed(peds)
end

Target.RemoveGlobalPed = function(labels)
  exports['qb-target']:RemoveGlobalPed(labels)
end

Target.RemoveGlobalVehicle = function(labels)
  exports['qb-target']:RemoveGlobalVehicle(labels)
end

Target.RemoveGlobalObject = function(labels)
  exports['qb-target']:RemoveGlobalObject(labels)
end

Target.IsTargetActive = function()
  return exports['qb-target']:IsTargetActive()
end

Target.IsTargetSuccess = function()
  return exports['qb-target']:IsTargetSuccess()
end

Target.GetGlobalTypeData = function(type, label)
  exports['qb-target']:GetGlobalTypeData(type, label)
end

Target.GetZoneData = function(name)
  return exports['qb-target']:GetZoneData(name)
end

Target.GetTargetBoneData = function(bone, label)
  return exports['qb-target']:GetTargetBoneData(bone, label)
end

Target.GetTargetEntityData = function(bone, label)
  return exports['qb-target']:GetTargetEntityData(bone, label)
end

Target.GetTargetModelData = function(model, label)
  return exports['qb-target']:GetTargetModelData(model, label)
end

Target.GetGlobalPedData = function(label)
  return exports['qb-target']:GetGlobalPedData(label)
end

Target.GetGlobalVehicleData = function(label)
  return exports['qb-target']:GetGlobalVehicleData(label)
end

Target.GetGlobalObjectData = function(label)
  return exports['qb-target']:GetGlobalObjectData(label)
end

Target.GetGlobalPlayerData = function(label)
  return exports['qb-target']:GetGlobalPlayerData(label)
end

Target.UpdateGlobalTypeData = function(type, label, data)
  exports['qb-target']:UpdateGlobalTypeData(type, label, data)
end

Target.UpdateZoneData = function(name, data)
  exports['qb-target']:UpdateZoneData(name, data)
end

Target.UpdateTargetBoneData = function(bone, label, data)
  exports['qb-target']:UpdateTargetBoneData(bone, label, data)
end

Target.UpdateTargetEntityData = function(entity, label, data)
  exports['qb-target']:UpdateTargetEntityData(entity, label, data)
end

Target.UpdateTargetModelData = function(model, label, data)
  exports['qb-target']:UpdateTargetModelData()
end

Target.UpdateGlobalPedData = function(label, data)
  exports['qb-target']:UpdateGlobalPedData(label, data)
end

Target.UpdateGlobalVehicleData = function(label, data)
  exports['qb-target']:UpdateGlobalVehicleData(label, data)
end

Target.UpdateGlobalObjectData = function(label, data)
  exports['qb-target']:UpdateGlobalObjectData(label, data)
end

Target.UpdateGlobalPlayerData = function(label, data)
  exports['qb-target']:UpdateGlobalPlayerData(label, data)
end

Target.GetPeds = function()
  return exports['qb-target']:GetPeds()
end

Target.UpdatePedsData = function(index, data)
  exports['qb-target']:UpdatePedsData(index, data)
end

Target.AllowTargeting = function(bool)
  exports['qb-target']:AllowTargeting(bool)
end