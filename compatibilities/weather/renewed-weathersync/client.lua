---@diagnostic disable: duplicate-set-field
-- renewed-weathersync client compatibilities for tr_compatibilities
-- Assigns renewed-weathersync specific functions to global WeatherEngine

-- SetWeather function for renewed-weathersync
WeatherEngine.SetWeather = function(weather)
    return exports['renewed-weathersync']:SetWeather(weather)
end

-- GetWeather function for renewed-weathersync
WeatherEngine.GetWeather = function()
    return exports['renewed-weathersync']:GetWeather()
end

-- SetTime function for renewed-weathersync
WeatherEngine.SetTime = function(hour, minute)
    return exports['renewed-weathersync']:SetTime(hour, minute)
end

-- GetTime function for renewed-weathersync
WeatherEngine.GetTime = function()
    return exports['renewed-weathersync']:GetTime()
end
