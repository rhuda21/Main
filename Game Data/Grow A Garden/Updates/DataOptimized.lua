local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function safeRequire(module)
    local success, result = pcall(require, module)
    if success and type(result) == "function" then
        local funcSuccess, funcResult = pcall(result)
        if funcSuccess and type(funcResult) == "table" then
            return funcResult
        else
            return {}
        end
    elseif success and type(result) == "table" then
        return result
    else
        return {}
    end
end
local function extractNamePrice(data)
    local result = {}
    for itemName, itemData in pairs(data) do
        if type(itemData) == "table" then
            local name = itemData.Name or itemName
            local price = itemData.Price or itemData.Cost or itemData.PriceValue or itemData.Value or 0
            result[itemName] = {
                Name = name,
                Price = price
            }
        end
    end
    return result
end
local function extractSprinklerData(sprinklerModule)
    local sprinklerData = safeRequire(sprinklerModule)
    local result = {}
    if sprinklerData and sprinklerData.SprinklerBoxSizes then
        for sprinklerName, size in pairs(sprinklerData.SprinklerBoxSizes) do
            result[sprinklerName] = {
                Name = sprinklerName,
                BoxSize = {X = size.X, Y = size.Y, Z = size.Z},
                Duration = sprinklerData.SprinklerDurations and sprinklerData.SprinklerDurations[sprinklerName] or 0,
                Offset = sprinklerData.SprinklerOffsets and sprinklerData.SprinklerOffsets[sprinklerName] and 
                         {X = sprinklerData.SprinklerOffsets[sprinklerName].X, 
                          Y = sprinklerData.SprinklerOffsets[sprinklerName].Y, 
                          Z = sprinklerData.SprinklerOffsets[sprinklerName].Z} or {X = 0, Y = 0, Z = 0}
            }
        end
    end
    
    return result
end
local allData = {
    Seeds = extractNamePrice(safeRequire(ReplicatedStorage.Data.SeedData)),
    Eggs = extractNamePrice(safeRequire(ReplicatedStorage.Data.PetRegistry.PetEggs)),
    Gears = extractNamePrice(safeRequire(ReplicatedStorage.Data.GearData)),
    Cosmetics = extractNamePrice(safeRequire(ReplicatedStorage.Data.CosmeticItemShopData)),
    Pets = extractNamePrice(safeRequire(ReplicatedStorage.Data.PetRegistry.PetList)),
    Event1 = extractNamePrice(safeRequire(ReplicatedStorage.Data.EventShopData)),
    Merchant = extractNamePrice(safeRequire(ReplicatedStorage.Data.TravelingMerchant.TravelingMerchantData.GnomeMerchantShopData)),
    Sprinkler = extractSprinklerData(ReplicatedStorage.Data.SprinklerData),
    PetsM = extractNamePrice(safeRequire(ReplicatedStorage.Data.PetRegistry.PetMutationRegistry)),
    Garden = extractNamePrice(safeRequire(ReplicatedStorage.Data.GardenCoinShopData))
}
local mutationModule = safeRequire(ReplicatedStorage.Modules.MutationHandler)
if mutationModule and mutationModule.MutationNames then
    local mutationsData = {}
    for name, _ in pairs(mutationModule.MutationNames) do
        local mutationData = mutationModule:GetMutations()[name]
        if mutationData then
            mutationsData[name] = {
                Name = mutationData.Name,
                Id = mutationData.Id,
                ValueMulti = mutationData.ValueMulti
            }
        end
    end
    allData.Mutations = mutationsData
end
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