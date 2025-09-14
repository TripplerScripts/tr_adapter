---@diagnostic disable: duplicate-set-field
Weather.SetWeather = function(weather)
    return exports['qb-weathersync']:SetWeather(weather)
end

Weather.GetWeather = function()
    return exports['qb-weathersync']:GetWeather()
end

Weather.SetTime = function(hour, minute)
    return exports['qb-weathersync']:SetTime(hour, minute)
end

Weather.GetTime = function()
    return exports['qb-weathersync']:GetTime()
end
