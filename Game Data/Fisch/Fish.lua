local HttpService = game:GetService("HttpService")
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
local Data = require(game:GetService("ReplicatedStorage").shared.modules.library.fish)
local function extractAllFishingData()
    local result = {
        Fish = {},
        Crates = {},
        Locations = Data.Locations or {},
        Rarities = Data.Rarities,
        RarityColors = Data.RarityColours
    }
    for name, data in pairs(Data) do
        if type(data) == "table" then
            if data.IsCrate then
                result.Crates[name] = {
                    Price = data.Price,
                    BaitContents = data.BaitContents,
                    CoinContents = data.CoinContents,
                    Rarity = data.Rarity,
                    Unpurchasable = data.Unpurchasable,
                    Image = data.Icon
                }
            elseif data.Rarity then
                result.Fish[name] = {
                    Rarity = data.Rarity,
                    Price = data.Price,
                    XP = data.XP,
                    Resilience = data.Resilience,
                    Worlds = data.Worlds,
                    Location = data.From,
                    FavoriteBait = data.FavouriteBait,
                    Image = data.Icon
                }
            end
        end
    end
    return result
end
local fishingData = extractAllFishingData()
local data = prettyPrintJson(HttpService:JSONEncode(fishingData))
return data
