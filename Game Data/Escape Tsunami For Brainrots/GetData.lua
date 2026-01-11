local BrainrotModule = require(game:GetService("ReplicatedStorage").SharedModules.BrainrotModule)
local function prettyPrintJson(jsonString)
    local result = ""
    local indentLevel = 0
    local inString = false  
    for i = 1, #jsonString do
        local char = jsonString:sub(i,i)
        if char == '"' and jsonString:sub(i-1,i-1) ~= "\\" then
            inString = not inString
        end
        if not inString then
            if char == "{" or char == "[" then
                result = result .. char .. "\n" .. string.rep("  ", indentLevel + 1)
                indentLevel = indentLevel + 1
            elseif char == "}" or char == "]" then
                indentLevel = indentLevel - 1
                result = result .. "\n" .. string.rep("  ", indentLevel) .. char
            elseif char == "," then
                result = result .. char .. "\n" .. string.rep("  ", indentLevel)
            elseif char == ":" then
                result = result .. char .. " "
            else
                result = result .. char
            end
        else
            result = result .. char
        end
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
local json = prettyPrintJson(HttpService:JSONEncode(extractedData))
return json
