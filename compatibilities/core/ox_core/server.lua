---@diagnostic disable: duplicate-set-field

SetPlayerData = function (jobLabel, jobDetails, balance, charName)
  return exports.ox_core:setPlayerInfo(jobLabel, jobDetails, balance, charName)
end