local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MODULE_PATHS = {
    Rarities = ReplicatedStorage.Modules.Library.FuseDurations,
    Mutations = ReplicatedStorage.Modules.Library.BrainrotMutations
}
local collectedData = {}
for dataType, modulePath in pairs(MODULE_PATHS) do
    local moduleTable = require(modulePath)
    local keys = {}
    if dataType == "Mutations" then
        for key in pairs(moduleTable.Colors) do
            table.insert(keys, key)
        end
    else
        for key in pairs(moduleTable) do
            table.insert(keys, key)
        end
    end
    collectedData[dataType] = keys
end
local jsonLines = {"{"}
local first = true
for categoryName, categoryData in pairs(collectedData) do
    if not first then
        table.insert(jsonLines, ",")
    end
    first = false
    table.insert(jsonLines, '\n  "' .. categoryName .. '": ')
    local categoryJson = HttpService:JSONEncode(categoryData)
    table.insert(jsonLines, categoryJson)
end
table.insert(jsonLines, "\n}")
local data = table.concat(jsonLines)
return data
