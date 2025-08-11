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
local RequireBad = loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/Others/Require.lua?ref_type=heads"))()
local Crafting = RequireBad.GetScript(game:GetService("ReplicatedStorage").Modules.Utilities.CraftingUtil)
local Crafts = {}
for craftName, craftData in pairs(Crafting.Crafts) do
    Crafts[craftName] = {
        name = craftData.name or craftData.Name,
        craftingTime = craftData.craftingTime or craftData.CraftingTime,
        craftingTimeSeconds = craftData.crafting_time,
        reward = {
            type = craftData.reward.reward_type,
            item = craftData.reward.variable,
            amount = craftData.reward.amount
        },
        requirements = {}
    }
    for _, requirement in ipairs(craftData.requirements) do
        table.insert(Crafts[craftName].requirements, {
            type = requirement.requirement_type,
            variable = requirement.variable,
            amount = requirement.amount or nil
        })
    end
end
local craftingData = prettyPrintJson(HttpService:JSONEncode(Crafts, jsonOptions))
return craftingData