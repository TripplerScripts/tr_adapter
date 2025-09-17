---@diagnostic disable: duplicate-set-field

Dispatch.CreateCall = function(data)
  return exports['bub-mdt']:createCall(data)
end

Dispatch.UpdateCallCoords = function(callId, coords)
  exports['bub-mdt']:updateCallCoords(callId, coords)
end

Dispatch.IsVehicleBOLO = function(plate)
  return exports['bub-mdt']:isVehicleBOLO(plate)
end

Dispatch.UpdateProfileImage = function(citizenId, image)
  return exports['bub-mdt']:updateProfileImage(citizenId, image)
end

Dispatch.CreateProfileCard = function(data)
  exports['bub-mdt']:createProfileCard(data)
end