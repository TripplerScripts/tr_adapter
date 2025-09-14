---@diagnostic disable: duplicate-set-field
Banking = {}

Banking.AddMoney = function(source, account, amount)
    print('No banking resource available - AddMoney called', 'warn')
    return false
end

Banking.RemoveMoney = function(source, account, amount)
    print('No banking resource available - RemoveMoney called', 'warn')
    return false
end

Banking.GetBalance = function(source, account)
    print('No banking resource available - GetBalance called', 'warn')
    return 0
end

Banking.CreateAccount = function(source, accountName, accountType)
    print('No banking resource available - CreateAccount called', 'warn')
    return false
end

exports('AddMoney', function(source, account, amount)
    return Banking.AddMoney(source, account, amount)
end)

exports('RemoveMoney', function(source, account, amount)
    return Banking.RemoveMoney(source, account, amount)
end)

exports('GetBalance', function(source, account)
    return Banking.GetBalance(source, account)
end)

exports('CreateAccount', function(source, accountName, accountType)
    return Banking.CreateAccount(source, accountName, accountType)
end)