---@diagnostic disable: duplicate-set-field
Management = {}

Management.GetEmployees = function(jobName)
    print('No management resource available - GetEmployees called', 'warn')
    return {}
end

Management.AddEmployee = function(source, jobName, grade)
    print('No management resource available - AddEmployee called', 'warn')
    return false
end

Management.RemoveEmployee = function(source, jobName)
    print('No management resource available - RemoveEmployee called', 'warn')
    return false
end

Management.SetGrade = function(source, jobName, grade)
    print('No management resource available - SetGrade called', 'warn')
    return false
end