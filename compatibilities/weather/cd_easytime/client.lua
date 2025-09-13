---@diagnostic disable: duplicate-set-field
-- cd_easytime client compatibilities for tr_compatibilities
-- Assigns cd_easytime specific functions to global WeatherEngine

-- SetWeather function for cd_easytime
WeatherEngine.SetWeather = function(weather)
    return exports.cd_easytime:SetWeather(weather)
end

-- GetWeather function for cd_easytime
WeatherEngine.GetWeather = function()
    return exports.cd_easytime:GetWeather()
end

-- SetTime function for cd_easytime
WeatherEngine.SetTime = function(hour, minute)
    return exports.cd_easytime:SetTime(hour, minute)
end

-- GetTime function for cd_easytime
WeatherEngine.GetTime = function()
    return exports.cd_easytime:GetTime()
end
