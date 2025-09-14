---@diagnostic disable: duplicate-set-field
Management.GetEmployees = function(jobName)
    return exports['qb-management']:GetEmployees(jobName)
end

Management.AddEmployee = function(source, jobName, grade)
    return exports['qb-management']:AddEmployee(source, jobName, grade)
end

Management.RemoveEmployee = function(source, jobName)
    return exports['qb-management']:RemoveEmployee(source, jobName)
end

Management.SetGrade = function(source, jobName, grade)
    return exports['qb-management']:SetGrade(source, jobName, grade)
end