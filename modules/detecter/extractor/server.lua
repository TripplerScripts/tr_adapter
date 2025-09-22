-- this will import the names of all resources that are located in /compatibilities/ folder
    -- store the category and name of the resource in a table
function ExtractResourceNames()
    local currentResource = GetCurrentResourceName()
    local manifestPath = GetResourcePath(currentResource) .. '/fxmanifest.lua'

    local file = io.open(manifestPath, 'r')
    if not file then
        exports.tr_lib:print({type = 'warn', message = '[Resource Extractor] Could not open fxmanifest.lua', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        return
    end

    local content = file:read('*all')
    file:close()

    local foundNames = {}
    local foundData = {}

    for line in content:gmatch("[^\r\n]+") do
        local category, resourceName, fileName = line:match("'compatibilities/([^/]+)/([^/]+)/([^/]+%.lua)'")
        if category and resourceName and resourceName ~= '_init' then
            foundNames[resourceName] = true
            foundData[resourceName] = {
                category = category,
                name = resourceName,
                duplicityVersion = fileName == "server.lua",
            }
        end
    end

    for name, _ in pairs(foundNames) do
        table.insert(SupportedResourcesData, foundData[name])
    end


    table.sort(SupportedResourcesData, function(a, b)
        if a.category == b.category then
            return a.name < b.name
        end
        return a.category < b.category
    end)

    RegisterNetEvent('tr_adapter:server:extractor_debug', function()
        local currentCategory = ""
        exports.tr_lib:print({type = 'info', message = '[Resource Extractor] Found ' .. #SupportedResourcesData .. ' resource names:', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        for _, data in ipairs(SupportedResourcesData) do
            Wait(200)
            if data.category ~= currentCategory then
                currentCategory = data.category
                exports.tr_lib:print({type = 'info', message = '[' .. currentCategory:upper() .. ']', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
                Wait(200)
            end
            exports.tr_lib:print({type = 'info', message = '  - ' .. data.name, path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        end
        exports.tr_lib:print({type = 'info', message = '[Resource Extractor] Extractor debug finished', path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline})
        ExtractorDebugerFinished = true
    end)

    AreSupportedResourcesReady = true
    SelectScripts()
end