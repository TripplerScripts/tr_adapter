---@diagnostic disable: duplicate-set-field
-- fd_banking client compatibilities for tr_compatibilities
-- Assigns fd_banking specific functions to global BankingEngine

-- AddMoney function for fd_banking
BankingEngine.AddMoney = function(source, account, amount)
    return exports.fd_banking:AddMoney(source, account, amount)
end

-- RemoveMoney function for fd_banking
BankingEngine.RemoveMoney = function(source, account, amount)
    return exports.fd_banking:RemoveMoney(source, account, amount)
end

-- GetBalance function for fd_banking
BankingEngine.GetBalance = function(source, account)
    return exports.fd_banking:GetBalance(source, account)
end

-- CreateAccount function for fd_banking
BankingEngine.CreateAccount = function(source, accountName, accountType)
    return exports.fd_banking:CreateAccount(source, accountName, accountType)
end
