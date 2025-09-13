AddEventHandler('onResourceStart', function(startedResource)
  if GetCurrentResourceName() == startedResource then
    Wait(1000)

    local numResources = GetNumResources()

    for i = 0, numResources - 1 do
      local resourceName = GetResourceByFindIndex(i)
      if resourceName then
        table.insert(ServerResourcesNames, resourceName)
      end
    end

    print("^2[Resource Detector] ^7Stored " .. #ServerResourcesNames .. " resource names")

    for _, name in ipairs(ServerResourcesNames) do
      print("^3- ^7" .. name)
    end
    AreDetectedResourcesReady = true
  end
end)
