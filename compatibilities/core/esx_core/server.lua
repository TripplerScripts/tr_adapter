---@diagnostic disable: duplicate-set-field

Core.SetPlayerData = function(bank, gang, dob, car)
  return exports.esx_core:setCharInfo(bank, gang, dob, car)
end