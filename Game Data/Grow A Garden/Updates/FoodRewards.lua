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
local _require = loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/Others/Require.lua?ref_type=heads"))()
local rewardData = game:GetService("ReplicatedStorage").Data.FoodRewardData
local rewardData = _require.GetScript(rewardData)
local data = prettyPrintJson(HttpService:JSONEncode(rewardData))
setclipboard(data)
return data