---@diagnostic disable: duplicate-set-field
Banking.AddMoney = function(source, account, amount)
    return exports.fd_banking:AddMoney(source, account, amount)
end

Banking.RemoveMoney = function(source, account, amount)
    return exports.fd_banking:RemoveMoney(source, account, amount)
end

Banking.GetBalance = function(source, account)
    return exports.fd_banking:GetBalance(source, account)
end

Banking.CreateAccount = function(source, accountName, accountType)
    return exports.fd_banking:CreateAccount(source, accountName, accountType)
end