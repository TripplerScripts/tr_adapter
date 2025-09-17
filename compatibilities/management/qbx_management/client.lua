---@diagnostic disable: duplicate-set-field

Management.AddBossMenuItem = function(menuItem)
  return exports.qbx_management:AddBossMenuItem(menuItem)
end

Management.AddGangMenuItem = function(menuItem)
  return exports.qbx_management:AddGangMenuItem(menuItem)
end

Management.RemoveBossMenuItem = function(id)
  exports.qbx_management:RemoveBossMenuItem(id)
end

---@param groupType GroupType
Management.OpenBossMenu = function(groupType)
  exports.qbx_management:OpenBossMenu(groupType)
end