---@diagnostic disable: duplicate-set-field

Banking.HandleTransaction = function (account, title, amount, message, issuer, receiver, transType, transID)
  return exports['Renewed-Banking']:handleTransaction(account, title, amount, message, issuer, receiver, transType, transID)
end

Banking.GetAccountMoney = function (account)
  return exports['Renewed-Banking']:getAccountMoney(account)
end

Banking.AddAccountMoney = function (account, amount)
  return exports['Renewed-Banking']:addAccountMoney(account, amount)
end

Banking.RemoveAccountMoney = function (account, amount)
  return exports['Renewed-Banking']:removeAccountMoney(account, amount)
end

Banking.ChangeAccountName = function (account, newName, src)
  return exports['Renewed-Banking']:changeAccountName(account, newName, src)
end

Banking.GetJobAccount = function (jobName)
  return exports['Renewed-Banking']:GetJobAccount(jobName)
end

--- @param job table A table containing job account details:
---        job.name string - The unique identifier for the job (e.g., "mechanic", "police").
---        job.label string - The display name/label for the job (e.g., "Mechanic", "Police Department").
--- @param initialBalance number? The starting balance of the account. Default is 0.
--- @return table Returns the account table if found or successfully created. This function may raise an error if validation or database insertion fails.
Banking.CreateJobAccount = function (job, initialBalance)
  return exports['Renewed-Banking']:CreateJobAccount(job, initialBalance)
end

Banking.AddAccountMember = function (account, member)
  exports['Renewed-Banking']:addAccountMember(account, member)
end

Banking.RemoveAccountMember = function (account, member)
  exports['Renewed-Banking']:removeAccountMember(account, member)
end

Banking.GetAccountTransactions = function (account)
  return exports['Renewed-Banking']:getAccountTransactions(account)
end