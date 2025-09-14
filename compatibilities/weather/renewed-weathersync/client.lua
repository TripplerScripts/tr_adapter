---@diagnostic disable: duplicate-set-field
Weather.SetWeather = function(weather)
    return exports['renewed-weathersync']:SetWeather(weather)
end

Weather.GetWeather = function()
    return exports['renewed-weathersync']:GetWeather()
end

Weather.SetTime = function(hour, minute)
    return exports['renewed-weathersync']:SetTime(hour, minute)
end

Weather.GetTime = function()
    return exports['renewed-weathersync']:GetTime()
end