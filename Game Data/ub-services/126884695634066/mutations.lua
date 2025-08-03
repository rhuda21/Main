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
local mutationModule = require(game:GetService("ReplicatedStorage").Modules.MutationHandler)
local mutationNames = {}
for name, _ in pairs(mutationModule.MutationNames) do
    table.insert(mutationNames, name)
end
table.sort(mutationNames)
local mutationsData = {}
local mutationsData = {}
for _, name in ipairs(mutationNames) do
    local mutationData = mutationModule:GetMutations()[name]
    if mutationData then
        local entry = {
            Name = mutationData.Name,
            Id = mutationData.Id,
            ValueMulti = mutationData.ValueMulti,
            TimeData = mutationData.TimeData and {
                TimeToChange = mutationData.TimeData.TimeToChange,
                AddMutationName = mutationData.TimeData.AddMutationName
            } or nil
        }
        if mutationData.Color then
            entry.Color = {
                R = math.floor(mutationData.Color.R * 255),
                G = math.floor(mutationData.Color.G * 255),
                B = math.floor(mutationData.Color.B * 255)
            }
        end
        mutationsData[name] = entry
    end
end
mutations = prettyPrintJson(HttpService:JSONEncode(mutationsData))
--setclipboard(mutations)
return mutations
