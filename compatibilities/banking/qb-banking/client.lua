---@diagnostic disable: duplicate-set-field
Banking.AddMoney = function(source, account, amount)
    return exports['qb-banking']:AddMoney(source, account, amount)
end

Banking.RemoveMoney = function(source, account, amount)
    return exports['qb-banking']:RemoveMoney(source, account, amount)
end

Banking.GetBalance = function(source, account)
    return exports['qb-banking']:GetBalance(source, account)
end

Banking.CreateAccount = function(source, accountName, accountType)
    return exports['qb-banking']:CreateAccount(source, accountName, accountType)
end