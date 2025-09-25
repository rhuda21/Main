local HttpService = game:GetService("HttpService")
local r = game:GetService("ReplicatedStorage").Modules.Library.FuseDurations
local m = game:GetService("ReplicatedStorage").Modules.Library.BrainrotMutations
local rarity = {}
for name, d in pairs(require(r)) do
    table.insert(rarity, name)
end
local mutation = {}
for name, data in pairs(require(m).Colors) do
    table.insert(mutation, name)
end
local allData = { Rarities = rarity, Mutations = mutation,}
local jsonLines = {"{"}
local first = true
for categoryName, categoryData in pairs(allData) do
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
print(data)
