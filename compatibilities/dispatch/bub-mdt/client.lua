---@diagnostic disable: duplicate-set-field

Dispatch.CustomAlert = function(data)
  exports['bub-mdt']:CustomAlert(data)
end

Dispatch.VehicleTheft = function()
  exports['bub-mdt']:VehicleTheft()
end

Dispatch.Shooting = function()
  exports['bub-mdt']:Shooting()
end

Dispatch.VehicleShooting = function()
  exports['bub-mdt']:VehicleShooting()
end

Dispatch.SpeedingVehicle = function()
  exports['bub-mdt']:SpeedingVehicle()
end

Dispatch.CarJacking = function(vehicle)
  exports['bub-mdt']:CarJacking(vehicle)
end

Dispatch.OfficerDown = function()
  exports['bub-mdt']:OfficerDown()
end

Dispatch.OpenMdt = function()
  exports['bub-mdt']:openMdt()
end