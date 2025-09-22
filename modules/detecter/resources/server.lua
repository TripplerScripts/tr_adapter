-- this will grab the names of all resources that are installed in the server
-- store the detected resources names from the server in a table
local numResources = GetNumResources()

for i = 0, numResources - 1 do
  local resourceName = GetResourceByFindIndex(i)
  if resourceName then
    table.insert(ServerResourcesNames, resourceName)
  end
end

exports.tr_lib:print("info", "[Resource Detector] Stored " .. #ServerResourcesNames .. " resource names")
AreDetectedResourcesReady = true
ExtractResourceNames()