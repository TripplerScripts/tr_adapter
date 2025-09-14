while not IsReadyToLoad do
  Wait(1000)
end
print(json.encode(SupportedResourcesData))

for _, data in ipairs(SupportedResourcesData) do
  print("^3- ^7" .. data.name .. " ^6[" .. data.category .. "]")
end