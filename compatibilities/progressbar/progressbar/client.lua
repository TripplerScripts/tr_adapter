---@diagnostic disable: duplicate-set-field
-- progressbar client compatibilities for tr_compatibilities
-- Assigns progressbar specific functions to global ProgressbarEngine

-- Progress function for progressbar
ProgressbarEngine.Progress = function(data, cb)
    local success = exports.progressbar:Progress(data, cb)
    return success
end

-- ProgressWithStartEvent function for progressbar
ProgressbarEngine.ProgressWithStartEvent = function(data, cb)
    local success = exports.progressbar:ProgressWithStartEvent(data, cb)
    return success
end
