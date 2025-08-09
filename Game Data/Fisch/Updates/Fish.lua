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
local function processValue(value)
    if typeof(value) == "Color3" then
        return {
            _type = "Color3",
            R = value.R,
            G = value.G,
            B = value.B
        }
    elseif typeof(value) == "Instance" then
        return {
            _type = "Instance",
            ClassName = value.ClassName,
            Name = value.Name
        }
    elseif type(value) == "table" then
        local processed = {}
        for k, v in pairs(value) do
            processed[k] = processValue(v)
        end
        return processed
    else
        return value
    end
end
local _require = loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/Others/Require.lua?ref_type=heads"))()
local fishModule = game:GetService("ReplicatedStorage").shared.modules.library.fish
local fishData = _require.GetScript(fishModule)
local processedData = {}
for key, value in pairs(fishData) do
    processedData[key] = processValue(value)
end
local Fish = prettyPrintJson(HttpService:JSONEncode(processedData))
return Fish