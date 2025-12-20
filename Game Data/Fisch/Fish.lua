local HttpService = game:GetService("HttpService")
local Data = require(game:GetService("ReplicatedStorage").shared.modules.library.fish)
local FishImages = require(game:GetService("ReplicatedStorage").shared.data.fishImages)
local function compileFishingData()
    local fishingData = {
        Fish = {},
        Crates = {},
        Locations = Data.Locations,
        Rarities = Data.Rarities,
        RarityColors = Data.RarityColours
    }
    for itemName, itemData in pairs(Data) do
        if type(itemData) == "table" then
            local itemImage = itemData.Icon or FishImages[itemName] or ""
            
            if itemData.IsCrate then
                fishingData.Crates[itemName] = {
                    Price = itemData.Price,
                    BaitContents = itemData.BaitContents,
                    CoinContents = itemData.CoinContents,
                    Rarity = itemData.Rarity,
                    Unpurchasable = itemData.Unpurchasable,
                    Image = itemImage
                }
            elseif itemData.Rarity then
                fishingData.Fish[itemName] = {
                    Rarity = itemData.Rarity,
                    Price = itemData.Price,
                    XP = itemData.XP,
                    Resilience = itemData.Resilience,
                    Worlds = itemData.Worlds,
                    Location = itemData.From,
                    FavoriteBait = itemData.FavouriteBait,
                    Image = itemImage
                }
            end
        end
    end
    return fishingData
end

local fishingData = compileFishingData()
local function tableToString(tbl, indent)
    indent = indent or 0
    local spaces = string.rep("  ", indent)
    local result = ""
    if indent == 0 then
        result = "{\n"
    else
        result = "{\n"
    end
    for key, value in pairs(tbl) do
        local formattedKey = type(key) == "string" and ("[\"" .. key .. "\"]") or ("[" .. key .. "]")
        result = result .. spaces .. "  " .. formattedKey .. " = "
        if type(value) == "table" then
            if next(value) == nil then
                result = result .. "{},\n"
            else
                result = result .. tableToString(value, indent + 1) .. ",\n"
            end
        elseif type(value) == "string" then
            result = result .. "\"" .. value .. "\",\n"
        elseif type(value) == "number" or type(value) == "boolean" then
            result = result .. tostring(value) .. ",\n"
        else
            result = result .. tostring(value) .. ",\n"
        end
    end
    return result .. spaces .. "}"
end
local o = "local fishingData = " .. tableToString(fishingData) .. "\nreturn fishingData"
return o
