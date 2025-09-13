---@diagnostic disable: duplicate-set-field
-- qbx_management client compatibilities for tr_compatibilities
-- Assigns qbx_management specific functions to global ManagementEngine

-- GetEmployees function for qbx_management
ManagementEngine.GetEmployees = function(jobName)
    return exports.qbx_management:GetEmployees(jobName)
end

-- AddEmployee function for qbx_management
ManagementEngine.AddEmployee = function(source, jobName, grade)
    return exports.qbx_management:AddEmployee(source, jobName, grade)
end

-- RemoveEmployee function for qbx_management
ManagementEngine.RemoveEmployee = function(source, jobName)
    return exports.qbx_management:RemoveEmployee(source, jobName)
end

-- SetGrade function for qbx_management
ManagementEngine.SetGrade = function(source, jobName, grade)
    return exports.qbx_management:SetGrade(source, jobName, grade)
end
