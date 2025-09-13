---@diagnostic disable: duplicate-set-field
-- Management Engine - Provides fallback functions for management compatibility

-- Create global ManagementEngine with fallback functions
ManagementEngine = {}

-- GetEmployees fallback
ManagementEngine.GetEmployees = function(jobName)
    Config.Log('No management resource available - GetEmployees called', 'warn')
    return {}
end

-- AddEmployee fallback
ManagementEngine.AddEmployee = function(source, jobName, grade)
    Config.Log('No management resource available - AddEmployee called', 'warn')
    return false
end

-- RemoveEmployee fallback
ManagementEngine.RemoveEmployee = function(source, jobName)
    Config.Log('No management resource available - RemoveEmployee called', 'warn')
    return false
end

-- SetGrade fallback
ManagementEngine.SetGrade = function(source, jobName, grade)
    Config.Log('No management resource available - SetGrade called', 'warn')
    return false
end
