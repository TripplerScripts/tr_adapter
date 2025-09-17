---@diagnostic disable: duplicate-set-field

Housing.GetMainDoor = function(propertyId, doorIndex, isShell)
  return exports['ps-housing']:getMainDoor(propertyId, doorIndex, isShell)
end

Housing.RegisterProperty = function(propertyData, preventEnter, source)
  return exports['ps-housing']:registerProperty(propertyData, preventEnter, source)
end

Housing.IsOwner = function(src, property_id)
  return exports['ps-housing']:IsOwner(src, property_id)
end

Housing.GetProperties = function()
  return exports['ps-housing']:GetProperties()
end

Housing.GetApartments = function()
  return exports['ps-housing']:GetApartments()
end