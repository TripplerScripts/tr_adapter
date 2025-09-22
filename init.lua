exports.tr_lib:print({
  type = "error",
  message = "hello Lenix",
  path = debug.getinfo(1, "Sl").short_src,
  line = debug.getinfo(1, "Sl").currentline
})
AreDetectedResourcesReady = false
AreSupportedResourcesReady = false
IsReadyToProvide = false
IsReadyToLoad = false
IsReadyToInit = false
ExtractorDebugerFinished = false

---@type table<string>
---@class ServerResourcesNames
---@field resourceName string
ServerResourcesNames = {}

---@type table
---@class ScriptToSupport
---@field category string
---@field name string
ScriptsToSupport = {}

---@type table
---@class AvailableScripts
---@field name string
---@field category string
---@field duplicityVersion boolean
AvailableScripts = {}

---@type table
---@class SupportedResourcesData
---@field name string
---@field category string
---@field duplicityVersion boolean
SupportedResourcesData = {}