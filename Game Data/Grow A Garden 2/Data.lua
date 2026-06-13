local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local MutationDataScript = ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("MutationData")
local RarityDataScript = ReplicatedStorage.SharedModules.RarityVisuals
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
Funcs.GatherRarityData = function()
    local RarityModule = require(RarityDataScript)
    local extractedRarities = {}
    local targetFunction = RarityModule.GetStaticColor
    if targetFunction then
        local upvalues = debug.getupvalues(targetFunction)
        for _, upvalueValue in pairs(upvalues) do
            if typeof(upvalueValue) == "table" and upvalueValue.Common ~= nil then
                for rarityName, color in pairs(upvalueValue) do
                    if typeof(color) == "Color3" then
                        extractedRarities[rarityName] = {
                            R = math.floor(color.R * 255 + 0.5),
                            G = math.floor(color.G * 255 + 0.5),
                            B = math.floor(color.B * 255 + 0.5),
                            Hex = string.format("#%02X%02X%02X", math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5))
                        }
                    end
                end
                break
            end
        end
    end
    local specialRarities = {"Super", "Secret"}
    for _, rarityName in ipairs(specialRarities) do
        local success, color = pcall(function() return RarityModule.GetStaticColor(rarityName) end)
        if success and typeof(color) == "Color3" then
            extractedRarities[rarityName] = {
                R = math.floor(color.R * 255 + 0.5),
                G = math.floor(color.G * 255 + 0.5),
                B = math.floor(color.B * 255 + 0.5),
                Hex = string.format("#%02X%02X%02X", math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5))
            }
        end
    end
    return extractedRarities
end
AllData.Mutations = Funcs.GatherMutationData()
AllData.Rarities = Funcs.GatherRarityData()
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
