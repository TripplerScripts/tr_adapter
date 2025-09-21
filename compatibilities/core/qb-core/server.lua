---@diagnostic disable: duplicate-set-field

Core.SetPlayerData = function (name, job, money)
  return exports['qb-core']:setPlayerData(name, job, money)
end