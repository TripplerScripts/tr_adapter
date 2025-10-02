-- this will import the names of all resources that are located in /compatibilities/ folder
-- store the category and name of the resource in a table
function ExtractResourceNames()
    local currentResource = GetCurrentResourceName()
    local manifestPath = GetResourcePath(currentResource) .. '/fxmanifest.lua'

    local file = io.open(manifestPath, 'r')
    if not file then
        print({ type = 'warn', message = ('Could not open fxmanifest.lua'):format(), path = debug.getinfo(1, "Sl").short_src, line = debug.getinfo(1, "Sl").currentline })
        return
    end

    local content = file:read('*all')
    file:close()

    local foundData = {}

    for line in content:gmatch("[^\r\n]+") do
        local category, resourceName, _ = line:match("'compatibilities/([^/]+)/([^/]+)/([^/]+%.lua)'")
        if category and resourceName and resourceName ~= '_init' then
            if not foundData[category] then
                foundData[category] = {}
            end
            table.insert(foundData[category], resourceName)
        end
    end

    for category, names in pairs(foundData) do
        table.insert(SupportedResourcesData, {
            category = category,
            names = names
        })
    end

    RegisterNetEvent('tr_adapter:server:extractor_debug', function()
        print({ type = 'info', message = ('Found resources:'):format(), path = debug.getinfo(1, "Sl")
        .short_src, line = debug.getinfo(1, "Sl").currentline })
        for _, data in ipairs(SupportedResourcesData) do
            Wait(200)
            print({ type = 'info', message = ('[' .. data.category:upper() .. ']:'):format(), path = debug.getinfo(1,
                "Sl").short_src, line = debug.getinfo(1, "Sl").currentline })
            for _, name in ipairs(data.names) do
                Wait(200)
                print({ type = 'info', message = ('  - %s'):format(name), path = debug.getinfo(1, "Sl").short_src, line =
                debug.getinfo(1, "Sl").currentline })
            end
        end
        print({ type = 'info', message = 'Extractor debug finished', path = debug.getinfo(1, "Sl")
        .short_src, line = debug.getinfo(1, "Sl").currentline })
        ExtractorDebuggerFinished = true
    end)

    SelectScripts()
end
