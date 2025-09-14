-- this will filter the supported resources names that are:
  -- missing | stored in MissingScripts
  -- will be provided by the tr_adapter | stored in AvailableScripts
  -- provided by another script | ignored
while not AreSupportedResourcesReady do
  Wait(1000)
end

for _, data in ipairs(SupportedResourcesData) do
  local state = GetResourceState(data.name)
  local foundInServer = false

  for _, serverName in ipairs(ServerResourcesNames) do
    if serverName == data.name then
      foundInServer = true
      break
    end
  end

  if state ~= "missing" and not foundInServer then
    print("^2✓ Found: " .. data.name .. ' (^3Provided by another script)')
  else
    if state ~= "missing" then
      AvailableScripts[#AvailableScripts + 1] = { category = data.category, name = data.name, duplicityVersion = data.duplicityVersion }
      print("^2✓ Found: " .. data.name)
    else
      MissingScripts[#MissingScripts + 1] = data.name
      print("^1✗ Missing: " .. data.name)
    end
  end
end

print("^2[Resource Selector] ^7Found " .. #MissingScripts .. " scripts to support")
for _, name in ipairs(MissingScripts) do
  print("^3- ^7" .. name)
end

print("^2[Resource Selector] ^7Found " .. #AvailableScripts .. " scripts that are going to provide")
local categoryLookup = {}
for _, data in ipairs(SupportedResourcesData) do
  categoryLookup[data.name] = data.category
end

for _, data in ipairs(AvailableScripts) do
  local category = categoryLookup[data.name] or "unknown"
  print("^3- ^7" .. data.name .. " ^6[" .. category .. "]")
end

IsReadyToProvide = true