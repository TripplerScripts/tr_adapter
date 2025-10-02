-- this will grab the names of all resources that are installed in the server
-- store the detected resources names from the server in a table
local numResources = GetNumResources()

for i = 0, numResources - 1 do
  local resourceName = GetResourceByFindIndex(i)
  if resourceName then
    table.insert(ServerResourcesNames, resourceName)
  end
end

print({type = 'info', message = ('Stored %s resource names'):format(#ServerResourcesNames), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
ExtractResourceNames()