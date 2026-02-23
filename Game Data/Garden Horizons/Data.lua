local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function safeRequire(module)
    local success, result = pcall(require, module)
    return success and type(result) == "table" and result or {}
end

local function extractItems(data, mapper)
    local result = {}
    for name, itemData in pairs(data) do
        if type(itemData) == "table" then
            result[name] = mapper(name, itemData)
        end
    end
    return result
end

local merchantMapper = function(name, data)
    return {Name = data.SeedName or data.Name or name,Price = data.Price or data.Cost or data.PriceValue or data.Value or 0}
end

local petMapper = function(name, data)
    return {
        Name = data.Name or name,
        Rarity = data.Rarity or "Common",
        Icon = data.Icon or "rbxassetid://0",
        SellPrice = data.SellPrice or 1
    }
end
local function extractPetMutations()
    local petMutationRegistry = safeRequire(ReplicatedStorage.Data.PetRegistry.PetMutationRegistry)
    local result = {}
    for mutationName, mutationData in pairs(petMutationRegistry) do
        if type(mutationData) == "table" and mutationData.EnumId then
            table.insert(result, {
                Name = mutationData.Name or mutationName,
                Id = mutationData.EnumId
            })
        end
    end
    return result
end

local function extractAllMerchantsData()
    local merchants = safeRequire(ReplicatedStorage.Data.TravelingMerchant.TravelingMerchantData)
    local result = {}
    for merchantName, merchantData in pairs(merchants) do
        if merchantData.ShopData and type(merchantData.ShopData) == "table" then
            result[merchantName] = {
                Title = merchantData.Title or merchantName,
                Items = extractItems(merchantData.ShopData, merchantMapper)
            }
        end
    end
    return result
end

local allData = {
    Seeds = safeRequire(game:GetService("ReplicatedStorage").Shop.ShopData.SeedShopData)
}
local mutationModule = require(game:GetService("ReplicatedStorage").Plants.Definitions.MutationDataDefinitions)
if mutationModule then
    local mutations = {}
    for name, data in pairs(mutationModule) do
        mutations[name] = {
            Id = data.id,
            Color = data.color,
            PriceMultiplier = data.priceMultiplier
        }
    end
    allData.Mutations = mutations
end
local cosmeticCrates = {}
local crateItems = {}
for _, data in pairs(cosmeticCrates) do
    if data.CosmeticRolls and data.CosmeticRolls.Items then
        for name, itemData in pairs(data.CosmeticRolls.Items) do
            crateItems[#crateItems + 1] = itemData.Name or name
        end
    end
end
allData.Crate = crateItems
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
setclipboard(data)
return data
