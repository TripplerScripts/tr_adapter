-- this will filter the supported resources names that are:
  -- missing | stored in ScriptsToProvide
  -- will be provided by the tr_adapter | stored in ScriptsThatProvide
  -- provided by another script | ignored
while not AreSupportedResourcesReady do
  Wait(1000)
end

for _, name in ipairs(SupportedResourcesNames) do
  local state = GetResourceState(name)
  local foundInServer = false

  for _, serverName in ipairs(ServerResourcesNames) do
    if serverName == name then
      foundInServer = true
      break
    end
  end

  if state ~= "missing" and not foundInServer then
    print("^2✓ Found: " .. name .. ' (^3Provided by another script)')
  else
    if state ~= "missing" then
      ScriptsThatProvide[#ScriptsThatProvide + 1] = name
      print("^2✓ Found: " .. name)
    else
      ScriptsToProvide[#ScriptsToProvide + 1] = name
      print("^1✗ Missing: " .. name)
    end
  end
end

print("^2[Resource Selector] ^7Found " .. #ScriptsToProvide .. " scripts to support")
for _, name in ipairs(ScriptsToProvide) do
  print("^3- ^7" .. name)
end

print("^2[Resource Selector] ^7Found " .. #ScriptsThatProvide .. " scripts that provide")
local categoryLookup = {}
for _, data in ipairs(SupportedResourcesData) do
  categoryLookup[data.name] = data.category
end

for _, name in ipairs(ScriptsThatProvide) do
  local category = categoryLookup[name] or "unknown"
  print("^3- ^7" .. name .. " ^6[" .. category .. "]")
end

IsReadyToProvide = true