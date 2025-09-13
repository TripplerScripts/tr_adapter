---@diagnostic disable: duplicate-set-field
-- qb-management client compatibilities for tr_compatibilities
-- Assigns qb-management specific functions to global ManagementEngine

-- GetEmployees function for qb-management
ManagementEngine.GetEmployees = function(jobName)
    return exports['qb-management']:GetEmployees(jobName)
end

-- AddEmployee function for qb-management
ManagementEngine.AddEmployee = function(source, jobName, grade)
    return exports['qb-management']:AddEmployee(source, jobName, grade)
end

-- RemoveEmployee function for qb-management
ManagementEngine.RemoveEmployee = function(source, jobName)
    return exports['qb-management']:RemoveEmployee(source, jobName)
end

-- SetGrade function for qb-management
ManagementEngine.SetGrade = function(source, jobName, grade)
    return exports['qb-management']:SetGrade(source, jobName, grade)
end
