---@diagnostic disable: duplicate-set-field
-- Banking Engine - Provides fallback functions for banking compatibility

-- Create global BankingEngine with fallback functions
BankingEngine = {}

-- AddMoney fallback
BankingEngine.AddMoney = function(source, account, amount)
    Config.Log('No banking resource available - AddMoney called', 'warn')
    return false
end

-- RemoveMoney fallback
BankingEngine.RemoveMoney = function(source, account, amount)
    Config.Log('No banking resource available - RemoveMoney called', 'warn')
    return false
end

-- GetBalance fallback
BankingEngine.GetBalance = function(source, account)
    Config.Log('No banking resource available - GetBalance called', 'warn')
    return 0
end

-- CreateAccount fallback
BankingEngine.CreateAccount = function(source, accountName, accountType)
    Config.Log('No banking resource available - CreateAccount called', 'warn')
    return false
end

exports('AddMoney', function(source, account, amount)
    return BankingEngine.AddMoney(source, account, amount)
end)

exports('RemoveMoney', function(source, account, amount)
    return BankingEngine.RemoveMoney(source, account, amount)
end)

exports('GetBalance', function(source, account)
    return BankingEngine.GetBalance(source, account)
end)

exports('CreateAccount', function(source, accountName, accountType)
    return BankingEngine.CreateAccount(source, accountName, accountType)
end)