---@diagnostic disable: duplicate-set-field
Core = {}

Core.GetJobs = function()
  print('No core resource available - GetJobs called', 'warn')
  return nil
end