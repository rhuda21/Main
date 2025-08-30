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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FairyUpgrades = require(ReplicatedStorage.Data.FairyUpgrades)
local function removeFunctions(tbl)
    local result = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            result[k] = removeFunctions(v)
        elseif type(v) ~= "function" then
            result[k] = v
        end
    end
    return result
end
local cleanData = removeFunctions(FairyUpgrades)
local data = prettyPrintJson(HttpService:JSONEncode(cleanData))
setclipboard(data)
return data