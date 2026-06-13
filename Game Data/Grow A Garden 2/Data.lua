local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local MutationDataScript = ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("MutationData")
local RarityDataScript = ReplicatedStorage.SharedModules.RarityVisuals
local SellValueScript = ReplicatedStorage.SharedModules:WaitForChild("SellValueData")
local SeedDataScript = ReplicatedStorage.SharedModules:WaitForChild("SeedData")

local Funcs = {}
local AllData = {}

Funcs.GatherMutationData = function()
    local MutationDataModule = require(MutationDataScript)
    local extractedMutations = {}
    local targetFunction = MutationDataModule.GetMutation or MutationDataModule.ReturnPriceMultiplier
    if targetFunction and typeof(targetFunction) == "function" then
        local upvalues = debug.getupvalues(targetFunction)
        for _, upvalueValue in pairs(upvalues) do
            if typeof(upvalueValue) == "table" and (upvalueValue.Gold ~= nil or upvalueValue.Golden ~= nil) then
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
    elseif typeof(MutationDataModule) == "table" then
        for mutationName, mutationConfig in pairs(MutationDataModule) do
            if typeof(mutationConfig) == "table" then
                extractedMutations[mutationName] = {
                    PriceMultiplier = mutationConfig.PriceMultiplier or 1,
                    FruitChance = mutationConfig.FruitChance or "None",
                }
            end
        end
    end
    return extractedMutations
end

Funcs.GatherRarityData = function()
    local RarityModule = require(RarityDataScript)
    local extractedRarities = {}
    local targetFunction = RarityModule.GetStaticColor
    if targetFunction and typeof(targetFunction) == "function" then
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
    local specialRarities = {"Super", "Secret", "Legendary", "Mythical"}
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

Funcs.GatherSellValueData = function()
    local success, SellValueModule = pcall(require, SellValueScript)
    local extractedValues = {}
    if success then
        if typeof(SellValueModule) == "table" then
            for fruitName, basePrice in pairs(SellValueModule) do
                if typeof(basePrice) == "number" then
                    extractedValues[fruitName] = basePrice
                end
            end
        end
    end
    return extractedValues
end

Funcs.GatherSeedData = function()
    local success, SeedDataModule = pcall(require, SeedDataScript)
    local extractedSeeds = {}
    if success and typeof(SeedDataModule) == "table" then
        for index, config in pairs(SeedDataModule) do
            if typeof(config) == "table" and config.SeedName then
                extractedSeeds[config.SeedName] = {
                    IsSingleHarvest = config.IsSingleHarvest == true,
                    GrowTime = config.GrowTime or 0,
                    HarvestAmount = config.HarvestAmount or 1
                }
            end
        end
    end
    return extractedSeeds
end

AllData.Mutations = Funcs.GatherMutationData()
AllData.Rarities = Funcs.GatherRarityData()
AllData.BasePrices = Funcs.GatherSellValueData()
AllData.Seeds = Funcs.GatherSeedData()

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
