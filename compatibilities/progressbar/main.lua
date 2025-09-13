---@diagnostic disable: duplicate-set-field
-- Progressbar Engine - Provides fallback functions for progressbar compatibility

-- Create global ProgressbarEngine with fallback functions
ProgressbarEngine = {}

-- Progress fallback
ProgressbarEngine.Progress = function(data, cb)
    Config.Log('No progressbar resource available - Progress called', 'warn')
    if cb then cb(false) end
    return false
end

-- ProgressWithStartEvent fallback
ProgressbarEngine.ProgressWithStartEvent = function(data, cb)
    Config.Log('No progressbar resource available - ProgressWithStartEvent called', 'warn')
    if cb then cb(false) end
    return false
end
