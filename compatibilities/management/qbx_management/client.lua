---@diagnostic disable: duplicate-set-field
Management.GetEmployees = function(jobName)
    return exports.qbx_management:GetEmployees(jobName)
end

Management.AddEmployee = function(source, jobName, grade)
    return exports.qbx_management:AddEmployee(source, jobName, grade)
end

Management.RemoveEmployee = function(source, jobName)
    return exports.qbx_management:RemoveEmployee(source, jobName)
end

Management.SetGrade = function(source, jobName, grade)
    return exports.qbx_management:SetGrade(source, jobName, grade)
end