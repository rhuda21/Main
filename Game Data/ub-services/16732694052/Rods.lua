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
local RodsModule = require(game:GetService("ReplicatedStorage").shared.modules.library.rods)
local rodsData = {}
for rodName, rodStats in pairs(RodsModule) do
    if type(rodStats) ~= "table" then continue end
    local rodEntry = {
        Name = rodName,
        Price = rodStats.Price,
        Description = rodStats.Description,
        Stats = {
            Luck = rodStats.Luck,
            LureSpeed = rodStats.LureSpeed,
            Strength = rodStats.Strength,
            LineDistance = rodStats.LineDistance,
            Resilience = rodStats.Resilience,
            Control = rodStats.Control
        },
        From = rodStats.From,
        Worlds = rodStats.Worlds
    }
    if rodStats.Passive then
        rodEntry.Passive = rodStats.Passive
    end
    if rodStats.ProgressEfficiency then
        rodEntry.ProgressEfficiency = rodStats.ProgressEfficiency
    end  
    table.insert(rodsData, rodEntry)
end
local rods = prettyPrintJson(HttpService:JSONEncode(rodsData))
return rods
