Progressbar.Progress = function(data, cb)
    local success = exports.ox_lib:progressBar(data)
    if cb then cb(success) end
    return success
end

Progressbar.ProgressWithStartEvent = function(data, cb)
    local success = exports.ox_lib:progressCircle(data)
    if cb then cb(success) end
    return success
end