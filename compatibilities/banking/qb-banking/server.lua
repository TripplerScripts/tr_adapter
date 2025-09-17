---@diagnostic disable: duplicate-set-field

Banking.CreatePlayerAccount = function(playerId, accountName, accountBalance, accountUsers)
  return exports['qb-banking']:CreatePlayerAccount(playerId, accountName, accountBalance, accountUsers)
end

Banking.CreateJobAccount = function(accountName, accountBalance)
  return exports['qb-banking']:CreateJobAccount(accountName, accountBalance)
end

Banking.CreateGangAccount = function(accountName, accountBalance)
  return exports['qb-banking']:CreateGangAccount(accountName, accountBalance)
end

Banking.CreateBankStatement = function(playerId, account, amount, reason, statementType, accountType)
  return exports['qb-banking']:CreateBankStatement(playerId, account, amount, reason, statementType, accountType)
end

Banking.AddMoney = function(accountName, amount, reason)
  return exports['qb-banking']:AddMoney(accountName, amount, reason)
end

Banking.AddGangMoney = function(accountName, amount, reason)
  return exports['qb-banking']:AddGangMoney(accountName, amount, reason)
end

Banking.RemoveMoney = function(accountName, amount, reason)
  return exports['qb-banking']:RemoveMoney(accountName, amount, reason)
end

Banking.RemoveGangMoney = function(accountName, amount, reason)
  return exports['qb-banking']:RemoveGangMoney(accountName, amount, reason)
end

Banking.GetAccount = function()
  return exports['qb-banking']:GetAccount()
end

Banking.GetGangAccount = function(accountName)
  return exports['qb-banking']:GetGangAccount(accountName)
end

Banking.GetAccountBalance = function(accountName)
  return exports['qb-banking']:GetAccountBalance(accountName)
end