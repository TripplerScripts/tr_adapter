---@diagnostic disable: duplicate-set-field

Management.AddBossMenuItem = function(data, id)
  return exports['qb-management']:AddBossMenuItem(data, id)
end

Management.RemoveBossMenuItem = function(id)
  exports['qb-management']:RemoveBossMenuItem(id)
end

Management.AddGangMenuItem = function(data, id)
  return exports['qb-management']:AddGangMenuItem(data, id)
end

Management.RemoveGangMenuItem = function(id)
  exports['qb-management']:RemoveGangMenuItem(id)
end