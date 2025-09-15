local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function safeRequire(module)
    local success, result = pcall(require, module)
    return (success and type(result) == "table") and result or {}
end

local function extractMerchantItems(merchantData)
    local result = {}
    for itemName, itemData in pairs(merchantData) do
        if type(itemData) == "table" then
            result[itemName] = {
                Name = itemData.SeedName or itemData.Name or itemName,
                Price = itemData.Price or itemData.Cost or itemData.PriceValue or itemData.Value or 0,
            }
        end
    end
    return result
end

local function extractAllMerchantsData()
    local merchantsModule = safeRequire(ReplicatedStorage.Data.TravelingMerchant.TravelingMerchantData)
    local allMerchantsData = {}
    if merchantsModule then
        for merchantName, merchantData in pairs(merchantsModule) do
            if merchantData.ShopData and type(merchantData.ShopData) == "table" then
                local shopItems = extractMerchantItems(merchantData.ShopData)
                allMerchantsData[merchantName] = {
                    Title = merchantData.Title or merchantName,
                    Items = shopItems
                }
            end
        end
    end
    return allMerchantsData
end

local function extractPetData(petData)
    local result = {}
    for petName, petInfo in pairs(petData) do
        if type(petInfo) == "table" then
            result[petName] = {
                Name = petInfo.Name or petName,
                Rarity = petInfo.Rarity or "Common",
                Icon = petInfo.Icon or "rbxassetid://0",
                SellPrice = petInfo.SellPrice or 1
            }
        end
    end
    return result
end

local allData = {
    Seeds = safeRequire(ReplicatedStorage.Data.SeedData),
    Pets = extractPetData(safeRequire(ReplicatedStorage.Data.PetRegistry.PetList)),
    Merchant = extractAllMerchantsData(),
    PetsM = safeRequire(ReplicatedStorage.Data.PetRegistry.PetMutationRegistry),
}

local mutationModule = safeRequire(ReplicatedStorage.Modules.MutationHandler)
if mutationModule and mutationModule.MutationNames then
    local mutationsData = {}
    for name, _ in pairs(mutationModule.MutationNames) do
        local mutationData = mutationModule:GetMutations()[name]
        if mutationData then
            local r, g, b = math.floor(mutationData.Color.R * 255), 
                            math.floor(mutationData.Color.G * 255), 
                            math.floor(mutationData.Color.B * 255)
            mutationsData[name] = {
                Name = mutationData.Name,
                Id = mutationData.Id,
                Color = {
                    R = r,
                    G = g,
                    B = b
                }
            }
        end
    end
    allData.Mutations = mutationsData
end

local cosmeticCrates = require(game:GetService("ReplicatedStorage").Data.CosmeticCrateRegistry.CosmeticCrates)
local crateData = {}
for crateName, data in pairs(cosmeticCrates) do
    if data.CosmeticRolls and data.CosmeticRolls.Items then
        for itemName, itemData in pairs(data.CosmeticRolls.Items) do
            table.insert(crateData, itemData.Name or itemName)
        end
    end
end
allData.Crate = crateData

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