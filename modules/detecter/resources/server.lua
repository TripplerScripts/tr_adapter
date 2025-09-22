-- this will grab the names of all resources that are installed in the server
-- store the detected resources names from the server in a table
local numResources = GetNumResources()

for i = 0, numResources - 1 do
  local resourceName = GetResourceByFindIndex(i)
  if resourceName then
    table.insert(ServerResourcesNames, resourceName)
  end
end

exports.tr_lib:print({type = 'info', message = '[Resource Detector] Stored ' .. #ServerResourcesNames .. ' resource names', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
AreDetectedResourcesReady = true
ExtractResourceNames()