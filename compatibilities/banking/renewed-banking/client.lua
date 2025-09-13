---@diagnostic disable: duplicate-set-field
-- renewed-banking client compatibilities for tr_compatibilities
-- Assigns renewed-banking specific functions to global BankingEngine

-- AddMoney function for renewed-banking
BankingEngine.AddMoney = function(source, account, amount)
    return exports['renewed-banking']:AddMoney(source, account, amount)
end

-- RemoveMoney function for renewed-banking
BankingEngine.RemoveMoney = function(source, account, amount)
    return exports['renewed-banking']:RemoveMoney(source, account, amount)
end

-- GetBalance function for renewed-banking
BankingEngine.GetBalance = function(source, account)
    return exports['renewed-banking']:GetBalance(source, account)
end

-- CreateAccount function for renewed-banking
BankingEngine.CreateAccount = function(source, accountName, accountType)
    return exports['renewed-banking']:CreateAccount(source, accountName, accountType)
end
