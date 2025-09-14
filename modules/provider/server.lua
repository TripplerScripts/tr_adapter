-- this will edit your fxmanifest providing the scripts that are missing automatically :)
while not IsReadyToProvide do
  Wait(1000)
end

local manifestPath = GetResourcePath(GetCurrentResourceName()) .. '/fxmanifest.lua'

local file = io.open(manifestPath, 'r')
if not file then return false end

local content = file:read('*all')
file:close()

content = content:gsub("provide%s+['\"][^'\"]+['\"]%s*\n?", "")

local filesEnd = content:find("files%s*{")
if filesEnd then
  local braceCount = 1
  local i = filesEnd
  while i <= #content and content:sub(i, i) ~= '{' do
    i = i + 1
  end
  i = i + 1

  while i <= #content and braceCount > 0 do
    local char = content:sub(i, i)
    if char == '{' then
      braceCount = braceCount + 1
    elseif char == '}' then
      braceCount = braceCount - 1
    end
    i = i + 1
  end
  filesEnd = i

  while filesEnd <= #content and content:sub(filesEnd, filesEnd):match("%s") do
    filesEnd = filesEnd + 1
  end
else
  filesEnd = #content
end

local provideEntries = ""
for _, scriptName in ipairs(ScriptsToProvide) do
  provideEntries = provideEntries .. "provide '" .. scriptName .. "'\n"
end

local newContent = content:sub(1, filesEnd) .. provideEntries .. content:sub(filesEnd + 1)

local writeFile = io.open(manifestPath, 'w')
if not writeFile then return false end

writeFile:write(newContent)
writeFile:close()

IsReadyToLoad = true