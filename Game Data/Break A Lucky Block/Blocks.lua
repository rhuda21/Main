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
local v1 = require(game:GetService("ReplicatedStorage").BlocksModule)
local function prepareTableForJson(tbl)
    local result = {}
    for key, value in pairs(tbl) do
        if typeof(value) == "Color3" then
            result[key] = {
                r = math.floor(value.r * 255),
                g = math.floor(value.g * 255),
                b = math.floor(value.b * 255)
            }
        elseif typeof(value) == "table" then
            result[key] = prepareTableForJson(value)
        else
            result[key] = value
        end
    end
    return result
end
local serializableTable = prepareTableForJson(v1)
local jsonString = HttpService:JSONEncode(serializableTable)
return prettyPrintJson(jsonString)
