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
    return {
        Name = data.SeedName or data.Name or name,
        Price = data.Price or data.Cost or data.PriceValue or data.Value or 0
    }
end
local petMapper = function(name, data)
    return {
        Name = data.Name or name,
        Rarity = data.Rarity or "Common",
        Icon = data.Icon or "rbxassetid://0",
        SellPrice = data.SellPrice or 1
    }
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
    Seeds = safeRequire(ReplicatedStorage.Data.SeedData),
    Pets = extractItems(safeRequire(ReplicatedStorage.Data.PetRegistry.PetList), petMapper),
    Merchant = extractAllMerchantsData(),
    PetsM = safeRequire(ReplicatedStorage.Data.PetRegistry.PetMutationRegistry)
}
local mutationModule = safeRequire(ReplicatedStorage.Modules.MutationHandler)
if mutationModule and mutationModule.MutationNames then
    local mutations = {}
    for name, _ in pairs(mutationModule.MutationNames) do
        local data = mutationModule:GetMutations()[name]
        if data then
            mutations[name] = {
                Name = data.Name,
                Id = data.Id,
                Color = {
                    R = math.floor(data.Color.R * 255),
                    G = math.floor(data.Color.G * 255),
                    B = math.floor(data.Color.B * 255)
                }
            }
        end
    end
    allData.Mutations = mutations
end
local cosmeticCrates = require(ReplicatedStorage.Data.CosmeticCrateRegistry.CosmeticCrates)
local crateItems = {}
for _, data in pairs(cosmeticCrates) do
    if data.CosmeticRolls and data.CosmeticRolls.Items then
        for name, itemData in pairs(data.CosmeticRolls.Items) do
            crateItems[#crateItems + 1] = itemData.Name or name
        end
    end
end
allData.Crate = crateItems
local jsonData = HttpService:JSONEncode(allData)
setclipboard(jsonData)
return jsonData
