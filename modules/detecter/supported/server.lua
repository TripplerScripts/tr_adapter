-- this will import the names of all resources that are located in /compatibilities/ folder
    -- store the category and name of the resource in a table
local function extractResourceNames()
    local currentResource = GetCurrentResourceName()
    local manifestPath = GetResourcePath(currentResource) .. '/fxmanifest.lua'

    local file = io.open(manifestPath, 'r')
    if not file then
        print("^1[Resource Extractor] ^7Could not open fxmanifest.lua")
        return
    end

    local content = file:read('*all')
    file:close()

    local foundNames = {}
    local foundData = {}

    for line in content:gmatch("[^\r\n]+") do
        local category, resourceName = line:match("'compatibilities/([^/]+)/([^/]+)/[^']+'")
        if category and resourceName then
            foundNames[resourceName] = true
            foundData[resourceName] = {
                category = category,
                name = resourceName
            }
        end
    end

    for name, _ in pairs(foundNames) do
        table.insert(SupportedResourcesNames, name)
        table.insert(SupportedResourcesData, foundData[name])
    end

    table.sort(SupportedResourcesNames)

    table.sort(SupportedResourcesData, function(a, b)
        if a.category == b.category then
            return a.name < b.name
        end
        return a.category < b.category
    end)

    print("^2[Resource Extractor] ^7Found " .. #SupportedResourcesNames .. " resource names:")

    local currentCategory = ""
    for _, data in ipairs(SupportedResourcesData) do
        if data.category ~= currentCategory then
            currentCategory = data.category
            print("^6[" .. currentCategory:upper() .. "]")
        end
        print("^3  - ^7" .. data.name)
    end

    AreSupportedResourcesReady = true
end

AddEventHandler('onResourceStart', function(startedResource)
    if GetCurrentResourceName() == startedResource then
        Wait(1000)
        while not AreDetectedResourcesReady do
            Wait(1000)
        end
        extractResourceNames()
    end
end)
