---@diagnostic disable: duplicate-set-field
Inventory = {}

local function getAvailableSystem()
    local systems = { 'ox_inventory', 'qb-inventory', 'ps-inventory' }
    for _, system in ipairs(systems) do
        if GetResourceState(system) == 'started' then
            return system
        end
    end
    return nil
end

local function convertItem(rawItem, fromSystem, toSystem, toFormat)
    if fromSystem == toSystem then
        return rawItem
    end

    local converted = {}

    for field, fieldType in pairs(toFormat) do
        if field == 'metadata' then
            converted.metadata = rawItem.info or rawItem.metadata or {}
        elseif field == 'info' then
            converted.info = rawItem.metadata or rawItem.info or {}
        elseif field == 'name' then
            converted.name = rawItem.name or ''
        elseif field == 'label' then
            converted.label = rawItem.label or ''
        elseif field == 'weight' then
            converted.weight = rawItem.weight or 0
        elseif field == 'count' then
            converted.count = rawItem.amount or rawItem.count or 0
        elseif field == 'amount' then
            converted.amount = rawItem.count or rawItem.amount or 0
        elseif field == 'slot' then
            converted.slot = rawItem.slot or 0
        elseif field == 'close' then
            converted.close = rawItem.shouldClose or rawItem.close or false
        elseif field == 'shouldClose' then
            converted.shouldClose = rawItem.close or rawItem.shouldClose or false
        elseif field == 'stack' then
            converted.stack = not (rawItem.unique or false)
        elseif field == 'unique' then
            converted.unique = not (rawItem.stack or false)
        elseif field == 'useable' then
            converted.useable = rawItem.useable or false
        elseif field == 'type' then
            converted.type = rawItem.type or 'item'
        elseif field == 'image' then
            converted.image = rawItem.image or (rawItem.name and rawItem.name .. '.png') or 'default.png'
        elseif field == 'description' then
            converted.description = rawItem.description or rawItem.label or ''
        else
            if rawItem[field] ~= nil then
                converted[field] = rawItem[field]
            elseif fieldType == 'string' then
                converted[field] = ''
            elseif fieldType == 'number' then
                converted[field] = 0
            elseif fieldType == 'boolean' then
                converted[field] = false
            elseif fieldType == 'table' then
                converted[field] = {}
            end
        end
    end

    return converted
end

Inventory = {
    ['__index'] = {
        GetTargetItems = function(expectedFormat, ...)
            local args = { ... }
            local availableSystem = getAvailableSystem()

            if not availableSystem then
                error('No inventory system available')
            end

            local systemConfig = Inventory[availableSystem]
            if not systemConfig or not systemConfig.GetTargetItems then
                error('GetTargetItems not configured for ' .. availableSystem)
            end

            local funcConfig = systemConfig.GetTargetItems
            local actualFunction = funcConfig.label

            local returnType = '1'
            if expectedFormat == 'ox_inventory' and #args == 4 and args[2] == 2 then
                returnType = '2'
            end

            local success, rawResult = pcall(function()
                return exports[availableSystem][actualFunction](table.unpack(args))
            end)

            if not success then
                error('Failed to call ' .. availableSystem .. ':' .. actualFunction)
            end

            local expectedConfig = Inventory[expectedFormat]
            if not expectedConfig or not expectedConfig.GetTargetItems then
                return rawResult -- fallback
            end

            local expectedReturns = expectedConfig.GetTargetItems.returns[returnType]

            if expectedReturns and expectedReturns[1] == 'number' then
                if type(rawResult) == 'table' and #rawResult > 0 then
                    local total = 0
                    for _, item in ipairs(rawResult) do
                        total = total + (item.count or item.amount or 1)
                    end
                    return total
                elseif type(rawResult) == 'number' then
                    return rawResult
                else
                    return 0
                end
            end

            if type(rawResult) == 'table' and expectedReturns then
                local convertedItems = {}
                for _, rawItem in ipairs(rawResult) do
                    local converted = convertItem(rawItem, availableSystem, expectedFormat, expectedReturns)
                    table.insert(convertedItems, converted)
                end
                return convertedItems
            end

            return rawResult
        end
    },

    ['ox_inventory'] = {
        ['GetTargetItems'] = {
            label = 'Search',
            returns = {
                ['1'] = {
                    metadata = 'table',
                    name = 'string',
                    weight = 'number',
                    label = 'string',
                    count = 'number',
                    close = 'boolean',
                    slot = 'number',
                    stack = 'boolean'
                },
                ['2'] = {
                    'number'
                }
            }
        },
    },

    ['qb-inventory'] = {
        ['GetTargetItems'] = {
            label = 'GetItemsByName',
            returns = {
                ['1'] = {
                    amount = 'number',
                    type = 'string',
                    useable = 'boolean',
                    info = 'table',
                    weight = 'number',
                    image = 'string',
                    description = 'string',
                    shouldClose = 'boolean',
                    label = 'string',
                    slot = 'number',
                    name = 'string',
                    unique = 'boolean'
                }
            }
        },
    },

    ['ps-inventory'] = {
        ['GetTargetItems'] = {
            label = 'GetItemsByName',
            returns = {
                ['1'] = {
                    amount = 'number',
                    type = 'string',
                    useable = 'boolean',
                    info = 'table',
                    weight = 'number',
                    image = 'string',
                    description = 'string',
                    shouldClose = 'boolean',
                    label = 'string',
                    slot = 'number',
                    name = 'string',
                    unique = 'boolean'
                }
            }
        },
    }
}

exports('GetTargetItems', function(expectedFormat, ...)
    return Inventory.__index.GetTargetItems(expectedFormat, ...)
end)