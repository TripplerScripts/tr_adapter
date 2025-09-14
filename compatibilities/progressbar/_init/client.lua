Progressbar = {}

Progressbar.Progress = function(data, cb)
    print('No progressbar resource available - Progress called', 'warn')
    if cb then cb(false) end
    return false
end

Progressbar.ProgressWithStartEvent = function(data, cb)
    print('No progressbar resource available - ProgressWithStartEvent called', 'warn')
    if cb then cb(false) end
    return false
end