---@diagnostic disable: duplicate-set-field
-- qb-weathersync client compatibilities for tr_compatibilities
-- Assigns qb-weathersync specific functions to global WeatherEngine

-- SetWeather function for qb-weathersync
WeatherEngine.SetWeather = function(weather)
    return exports['qb-weathersync']:SetWeather(weather)
end

-- GetWeather function for qb-weathersync
WeatherEngine.GetWeather = function()
    return exports['qb-weathersync']:GetWeather()
end

-- SetTime function for qb-weathersync
WeatherEngine.SetTime = function(hour, minute)
    return exports['qb-weathersync']:SetTime(hour, minute)
end

-- GetTime function for qb-weathersync
WeatherEngine.GetTime = function()
    return exports['qb-weathersync']:GetTime()
end
