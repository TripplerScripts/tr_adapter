local function extractResourceNames()
    local currentResource = GetCurrentResourceName()
    local manifestPath = GetResourcePath(currentResource) .. '/fxmanifest.lua'

    -- Read the fxmanifest.lua file
    local file = io.open(manifestPath, 'r')
    if not file then
        print("^1[Resource Extractor] ^7Could not open fxmanifest.lua")
        return
    end

    local content = file:read('*all')
    file:close()

    local foundNames = {}

    -- Pattern to match file paths in the manifest
    -- Looks for patterns like 'compatibilities/category/resource-name/file.lua'
    for line in content:gmatch("[^\r\n]+") do
        -- Match file paths that contain compatibilities
        local match = line:match("'compatibilities/[^/]+/([^/]+)/[^']+'")
        if match then
            foundNames[match] = true -- Use table as set to avoid duplicates
        end
    end

    -- Convert set back to array
    for name, _ in pairs(foundNames) do
        table.insert(SupportedResourcesNames, name)
    end

    -- Sort the names for consistency
    table.sort(SupportedResourcesNames)

    print("^2[Resource Extractor] ^7Found " .. #SupportedResourcesNames .. " resource names:")
    for _, name in ipairs(SupportedResourcesNames) do
        print("^3- ^7" .. name)
    end
    AreSupportedResourcesReady = true
end

-- Run extraction when this resource starts
AddEventHandler('onResourceStart', function(startedResource)
    if GetCurrentResourceName() == startedResource then
        Wait(500) -- Small delay to ensure file system is ready
        while not AreDetectedResourcesReady do
            Wait(100)
        end
        extractResourceNames()
    end
end)