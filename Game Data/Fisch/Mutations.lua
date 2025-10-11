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

local MutationsModule = require(game:GetService("ReplicatedStorage").shared.modules.fishing.mutations)
local mutationsTable = nil
for key, value in pairs(MutationsModule) do
    if type(value) == "table" and value.Mayhem and value.SixSeven then
        mutationsTable = value
        break
    end
end

local function extractAllMutationsData()
    local result = {
        Mutations = {}
    }
    if mutationsTable then
        for mutationName, mutationData in pairs(mutationsTable) do
            if type(mutationData) == "table" then
                local mutationInfo = {
                    Display = mutationData.Display,
                    PriceMultiply = mutationData.PriceMultiply,
                    Chance = mutationData.Chance
                }
                
                if mutationData.Color then
                    mutationInfo.Color = {
                        R = math.floor(mutationData.Color.R * 255),
                        G = math.floor(mutationData.Color.G * 255),
                        B = math.floor(mutationData.Color.B * 255)
                    }
                end
                
                result.Mutations[mutationName] = mutationInfo
            end
        end
    end
    return result
end

local mutationsData = extractAllMutationsData()
local data = prettyPrintJson(HttpService:JSONEncode(mutationsData))
setclipboard(data)
return data
