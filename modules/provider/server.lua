while not IsReadyToProvide do
  Wait(100)
end

local manifestPath = GetResourcePath(GetCurrentResourceName()) .. '/fxmanifest.lua'

local file = io.open(manifestPath, 'r')
if not file then return false end

local content = file:read('*all')
file:close()

-- Remove all existing provide entries
content = content:gsub("provide%s+['\"][^'\"]+['\"]%s*\n?", "")

-- Find insertion point after files block
local filesEnd = content:find("files%s*{")
if filesEnd then
  local braceCount = 1       -- Start with 1 since we found the opening brace
  local i = filesEnd
  -- Find the opening brace position
  while i <= #content and content:sub(i, i) ~= '{' do
    i = i + 1
  end
  i = i + 1       -- Move past the opening brace

  -- Count braces to find the matching closing brace
  while i <= #content and braceCount > 0 do
    local char = content:sub(i, i)
    if char == '{' then
      braceCount = braceCount + 1
    elseif char == '}' then
      braceCount = braceCount - 1
    end
    i = i + 1
  end
  filesEnd = i       -- Position after the closing brace

  -- Skip any whitespace/newlines after the closing brace
  while filesEnd <= #content and content:sub(filesEnd, filesEnd):match("%s") do
    filesEnd = filesEnd + 1
  end
else
  filesEnd = #content
end

-- Build provide entries
local provideEntries = "\n"
for _, scriptName in ipairs(ScriptsToProvide) do
  provideEntries = provideEntries .. "provide '" .. scriptName .. "'\n"
end

-- Insert provides
local newContent = content:sub(1, filesEnd) .. provideEntries .. content:sub(filesEnd + 1)

local writeFile = io.open(manifestPath, 'w')
if not writeFile then return false end

writeFile:write(newContent)
writeFile:close()
