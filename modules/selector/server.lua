while not AreSupportedResourcesReady do
  Wait(100)
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
IsReadyToProvide = true