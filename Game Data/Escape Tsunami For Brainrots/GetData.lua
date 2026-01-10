local BrainrotModule = require(game:GetService("ReplicatedStorage").SharedModules.BrainrotModule)
local function toJSON(data, indent)
    indent = indent or 0
    local spaces = string.rep("  ", indent)
    local result = ""
    if type(data) == "table" then
        result = result .. "{\n"
        local first = true
        for k, v in pairs(data) do
            if not first then
                result = result .. ",\n"
            end
            first = false
            result = result .. spaces .. "  \"" .. tostring(k) .. "\": " .. toJSON(v, indent + 1)
        end
        result = result .. "\n" .. spaces .. "}"
    elseif type(data) == "string" then
        result = result .. "\"" .. data .. "\""
    elseif type(data) == "number" then
        result = result .. tostring(data)
    elseif type(data) == "boolean" then
        result = result .. tostring(data)
    elseif data == nil then
        result = result .. "null"
    else
        result = result .. "\"" .. tostring(data) .. "\""
    end
    return result
end
local extractedData = {
    ClassNames = BrainrotModule.ClassNames,
    BrainrotNames = BrainrotModule.BrainrotNames,
    Chances = BrainrotModule.Chances,
    NormalizedChances = BrainrotModule.NormalizedChances,
    IconIDs = BrainrotModule.IconIDs,
    ClassChances = BrainrotModule.ClassChances,
    LuckyClassChances = BrainrotModule.LuckyClassChances,
    ClassColours = {},
    MutationChances = BrainrotModule.MutationChances,
    GuaranteedMutationChances = BrainrotModule.GuaranteedMutationChances,
    MutationColours = {}
}
for className, color in pairs(BrainrotModule.ClassColours) do
    extractedData.ClassColours[className] = {
        R = math.floor(color.R * 255),
        G = math.floor(color.G * 255),
        B = math.floor(color.B * 255)
    }
end
for mutationName, color in pairs(BrainrotModule.MutationColours) do
    extractedData.MutationColours[mutationName] = {
        R = math.floor(color.R * 255),
        G = math.floor(color.G * 255),
        B = math.floor(color.B * 255)
    }
end
extractedData.BrainrotValues = {}
extractedData.Rarities = BrainrotModule.ClassNames
for _, rarity in ipairs(BrainrotModule.ClassNames) do
    local rarityTable = BrainrotModule.Chances[rarity]
    if rarityTable then
        for brainrotName, _ in pairs(rarityTable) do
            if not extractedData.BrainrotValues[brainrotName] then
                extractedData.BrainrotValues[brainrotName] = {
                    rate = BrainrotModule.GetRate(brainrotName, "None"),
                    sellAmount = BrainrotModule.GetSellAmount(brainrotName, "None"),
                    rarity = BrainrotModule.GetBrainrotClass(brainrotName)
                }
            end
        end
    end
end
extractedData.BrainrotsByRarity = {}
for _, rarity in ipairs(BrainrotModule.ClassNames) do
    extractedData.BrainrotsByRarity[rarity] = {}
    local rarityTable = BrainrotModule.Chances[rarity]
    if rarityTable then
        for brainrotName, chance in pairs(rarityTable) do
            extractedData.BrainrotsByRarity[rarity][brainrotName] = {
                chance = chance,
                normalizedChance = BrainrotModule.NormalizedChances[rarity][brainrotName],
                rate = BrainrotModule.GetRate(brainrotName, "None"),
                sellAmount = BrainrotModule.GetSellAmount(brainrotName, "None"),
                iconId = BrainrotModule.IconIDs[brainrotName]
            }
        end
    end
end
local HttpService = game:GetService("HttpService")
local jsonString = HttpService:JSONEncode(extractedData)
return extractedData
