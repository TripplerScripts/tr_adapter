---@diagnostic disable: duplicate-set-field
-- ox_lib progressbar client compatibilities for tr_compatibilities
-- Assigns ox_lib specific functions to global ProgressbarEngine

-- Progress function for ox_lib (using progressBar)
ProgressbarEngine.Progress = function(data, cb)
    local success = exports.ox_lib:progressBar(data)
    if cb then cb(success) end
    return success
end

-- ProgressWithStartEvent function for ox_lib (using progressCircle)
ProgressbarEngine.ProgressWithStartEvent = function(data, cb)
    local success = exports.ox_lib:progressCircle(data)
    if cb then cb(success) end
    return success
end
