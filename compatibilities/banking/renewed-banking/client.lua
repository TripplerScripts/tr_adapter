---@diagnostic disable: duplicate-set-field
Banking.AddMoney = function(source, account, amount)
    return exports['renewed-banking']:AddMoney(source, account, amount)
end

Banking.RemoveMoney = function(source, account, amount)
    return exports['renewed-banking']:RemoveMoney(source, account, amount)
end

Banking.GetBalance = function(source, account)
    return exports['renewed-banking']:GetBalance(source, account)
end

Banking.CreateAccount = function(source, accountName, accountType)
    return exports['renewed-banking']:CreateAccount(source, accountName, accountType)
end