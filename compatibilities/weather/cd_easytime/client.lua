---@diagnostic disable: duplicate-set-field
Weather.SetWeather = function(weather)
    return exports.cd_easytime:SetWeather(weather)
end

Weather.GetWeather = function()
    return exports.cd_easytime:GetWeather()
end

Weather.SetTime = function(hour, minute)
    return exports.cd_easytime:SetTime(hour, minute)
end

Weather.GetTime = function()
    return exports.cd_easytime:GetTime()
end