---@diagnostic disable: duplicate-set-field

Housing.GetProperties = function()
  return exports['ps-housing']:GetProperties()
end

Housing.GetProperty = function(property_id)
  return exports['ps-housing']:GetProperty(property_id)
end

Housing.GetApartments = function()
  return exports['ps-housing']:GetApartments()
end

Housing.GetApartment = function(apartment_id)
  return exports['ps-housing']:GetApartment(apartment_id)
end

Housing.GetShells = function()
  return exports['ps-housing']:GetShells()
end

Housing.CreateTempShell = function(shellName, position, rotation, leaveCb)
  return exports['ps-housing']:CreateTempShell(shellName, position, rotation, leaveCb)
end

Housing.GetShellData = function(shellName)
  return exports['ps-housing']:GetShellData(shellName)
end

Housing.DespawnTempShell = function(shellEntity)
  return exports['ps-housing']:DespawnTempShell(shellEntity)
end

Housing.GetProperties = function()
  return exports['ps-housing']:GetProperties()
end

Housing.GetApartments = function()
  return exports['ps-housing']:GetApartments()
end