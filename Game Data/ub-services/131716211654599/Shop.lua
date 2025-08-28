local http = game:GetService("HttpService")
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
local itemsModule = require(game:GetService("ReplicatedStorage").shared.modules.library.items)
local itemsTable = itemsModule.Items
local organized = {
    Totems = {},
    Keys = {},
    MythicalItems = {},
    ExoticItems = {},
    LegendaryItems = {},
    Other = {}
} 
for itemName, itemData in pairs(itemsTable) do
    if itemName:find("Totem") then
        organized.Totems[itemName] = itemData
    elseif itemName:find("Key") then
        organized.Keys[itemName] = itemData
    elseif itemData.Rarity == "Mythical" then
        organized.MythicalItems[itemName] = itemData
    elseif itemData.Rarity == "Exotic" then
        organized.ExoticItems[itemName] = itemData
    elseif itemData.Rarity == "Legendary" then
        organized.LegendaryItems[itemName] = itemData
    else
        organized.Other[itemName] = itemData
    end
end
local prettyJSON = prettyPrintJson(http:JSONEncode(organized))
return prettyJSON
