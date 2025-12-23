local mod = require(game:GetService("ReplicatedStorage").Shared.Data.Quests)
local quests = {}
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
for questId,questD in pairs(mod) do
    if questId ~= "..." then
        table.insert(quests,{
            id = questId,
            name = questD.Name,
            description = questD.Description,
            autoComplete = questD.AutoComplete or false,
            repeatable = questD.Repeatable or false,
            prereq = questD.Prerequisites,
            npc = questD.Npc,
            objectives = questD.Objectives,
            rewards = questD.Rewards
        })
    end
end
local Data = prettyPrintJson(game:GetService("HttpService"):JSONEncode(quests))
return Data
