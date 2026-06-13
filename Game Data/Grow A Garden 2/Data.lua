local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local MutationDataScript = ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("MutationData")
local Funcs = {}
local AllData = {}
Funcs.GatherMutationData = function()
    local MutationDataModule = require(MutationDataScript)
    local extractedMutations = {}
    local targetFunction = MutationDataModule.GetMutation
    if targetFunction then
        local upvalues = debug.getupvalues(targetFunction)
        for _, upvalueValue in pairs(upvalues) do
            if typeof(upvalueValue) == "table" and upvalueValue.Gold ~= nil then
                for mutationName, mutationConfig in pairs(upvalueValue) do
                    extractedMutations[mutationName] = {
                        PriceMultiplier = mutationConfig.PriceMultiplier or 1,
                        FruitChance = mutationConfig.FruitChance or "None",
                        PlantChance = mutationConfig.PlantChance or "None",
                        CanGetOnGrowth = mutationConfig.CanGetOnGrowth or false
                    }
                end
                break
            end
        end
    end
    return extractedMutations
end
AllData.Mutations = Funcs.GatherMutationData()
local jsonLines = {"{"}
local first = true
for categoryName, categoryData in pairs(AllData) do
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
setclipboard(data)
return data
