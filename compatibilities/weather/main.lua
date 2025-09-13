---@diagnostic disable: duplicate-set-field
-- Weather Engine - Provides fallback functions for weather compatibility

-- Create global WeatherEngine with fallback functions
WeatherEngine = {}

-- SetWeather fallback
WeatherEngine.SetWeather = function(weather)
    Config.Log('No weather resource available - SetWeather called', 'warn')
    return false
end

-- GetWeather fallback
WeatherEngine.GetWeather = function()
    Config.Log('No weather resource available - GetWeather called', 'warn')
    return 'CLEAR'
end

-- SetTime fallback
WeatherEngine.SetTime = function(hour, minute)
    Config.Log('No weather resource available - SetTime called', 'warn')
    return false
end

-- GetTime fallback
WeatherEngine.GetTime = function()
    Config.Log('No weather resource available - GetTime called', 'warn')
    return {hour = 12, minute = 0}
end
