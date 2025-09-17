---@diagnostic disable: duplicate-set-field

Housing.HasKey = function()
  return exports['qb-housing']:hasKey()
end

Housing.GetKeyHolderData = function()
  return exports['qb-housing']:getKeyHolderData()
end