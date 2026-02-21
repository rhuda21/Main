local HttpService = game:GetService("HttpService")
local e = require(game:GetService("ReplicatedStorage").Registries.MutationRegistry)
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
local function convertToJsonFriendly(tbl)
    local newTbl = {}
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            newTbl[key] = convertToJsonFriendly(value)
        elseif typeof(value) == "Color3" then
            newTbl[key] = string.format("Color3(%f, %f, %f)", value.R, value.G, value.B)
        else
            newTbl[key] = value
        end
    end
    return newTbl
end
local friendlyTable = convertToJsonFriendly(e) 
local jsonString = HttpService:JSONEncode(friendlyTable)
local prettyJson = prettyPrintJson(jsonString) 
return prettyJson
