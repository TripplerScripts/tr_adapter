---@diagnostic disable: duplicate-set-field
Weather = {}

Weather.SetWeather = function(weather)
    print('No weather resource available - SetWeather called', 'warn')
    return false
end

Weather.GetWeather = function()
    print('No weather resource available - GetWeather called', 'warn')
    return 'CLEAR'
end

Weather.SetTime = function(hour, minute)
    print('No weather resource available - SetTime called', 'warn')
    return false
end

Weather.GetTime = function()
    print('No weather resource available - GetTime called', 'warn')
    return {hour = 12, minute = 0}
end