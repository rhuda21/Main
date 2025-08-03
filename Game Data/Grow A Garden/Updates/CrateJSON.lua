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
local crateData = {}
local cosmeticCrates = require(game:GetService("ReplicatedStorage").Data.CosmeticCrateRegistry.CosmeticCrates)
for crateName, data in pairs(cosmeticCrates) do
    local crateEntry = {
        Name = crateName,
        Color = data.Color and {
            R = math.floor(data.Color.R * 255),
            G = math.floor(data.Color.G * 255),
            B = math.floor(data.Color.B * 255)
        } or nil,
        OpenTime = data.OpenTime or 1800,
        Items = {}
    }
    if data.CosmeticRolls and data.CosmeticRolls.Items then
        for itemName, itemData in pairs(data.CosmeticRolls.Items) do
            crateEntry.Items[itemName] = {
                Name = itemData.Name,
                ItemOdd = itemData.ItemOdd
            }
        end
    end
    
    crateData[crateName] = crateEntry
end
local crate = prettyPrintJson(HttpService:JSONEncode(crateData))
--setclipboard(crate)
return crate