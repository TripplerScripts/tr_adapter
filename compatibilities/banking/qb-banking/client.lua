---@diagnostic disable: duplicate-set-field
-- qb-banking client compatibilities for tr_compatibilities
-- Assigns qb-banking specific functions to global BankingEngine

-- AddMoney function for qb-banking
BankingEngine.AddMoney = function(source, account, amount)
    return exports['qb-banking']:AddMoney(source, account, amount)
end

-- RemoveMoney function for qb-banking
BankingEngine.RemoveMoney = function(source, account, amount)
    return exports['qb-banking']:RemoveMoney(source, account, amount)
end

-- GetBalance function for qb-banking
BankingEngine.GetBalance = function(source, account)
    return exports['qb-banking']:GetBalance(source, account)
end

-- CreateAccount function for qb-banking
BankingEngine.CreateAccount = function(source, accountName, accountType)
    return exports['qb-banking']:CreateAccount(source, accountName, accountType)
end
