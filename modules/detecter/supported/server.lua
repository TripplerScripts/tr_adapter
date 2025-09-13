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

    for line in content:gmatch("[^\r\n]+") do
        local match = line:match("'compatibilities/[^/]+/([^/]+)/[^']+'")
        if match then
            foundNames[match] = true
        end
    end

    for name, _ in pairs(foundNames) do
        table.insert(SupportedResourcesNames, name)
    end

    table.sort(SupportedResourcesNames)

    print("^2[Resource Extractor] ^7Found " .. #SupportedResourcesNames .. " resource names:")
    for _, name in ipairs(SupportedResourcesNames) do
        print("^3- ^7" .. name)
    end
    AreSupportedResourcesReady = true
end

AddEventHandler('onResourceStart', function(startedResource)
    if GetCurrentResourceName() == startedResource then
        Wait(500)
        while not AreDetectedResourcesReady do
            Wait(100)
        end
        extractResourceNames()
    end
end)