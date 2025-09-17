---@diagnostic disable: duplicate-set-field

---@return player.isDead
Ambulance.IsDead = function ()
  return exports.ars_ambulance:isDead()
end

Ambulance.CreateDistressCall = function ()
  exports.ars_ambulance:createDistressCall()
end

Ambulance.OpenDistressCalls = function ()
  exports.ars_ambulance:openDistressCalls()
end