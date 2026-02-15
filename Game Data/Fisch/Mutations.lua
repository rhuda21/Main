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
local function extractColor(colorValue)
    if not colorValue then
        return nil
    end
    if typeof(colorValue) == "Color3" then
        return {
            R = math.floor(colorValue.R * 255),
            G = math.floor(colorValue.G * 255),
            B = math.floor(colorValue.B * 255)
        }
    end
    if typeof(colorValue) == "ColorSequence" then
        local keypoints = colorValue.Keypoints
        local colorInfo = {
            Type = "ColorSequence",
            Keypoints = {}
        }
        for i, keypoint in ipairs(keypoints) do
            colorInfo.Keypoints[i] = {
                Time = keypoint.Time,
                Color = {
                    R = math.floor(keypoint.Value.R * 255),
                    G = math.floor(keypoint.Value.G * 255),
                    B = math.floor(keypoint.Value.B * 255)
                }
            }
        end
        return colorInfo
    end 
    return nil
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
                if mutationData.Priority then
                    mutationInfo.Priority = mutationData.Priority
                end
                if mutationData.Color then
                    mutationInfo.Color = extractColor(mutationData.Color)
                end      
                result.Mutations[mutationName] = mutationInfo
            end
        end
    end
    return result
end
local mutationsData = extractAllMutationsData()
local data = prettyPrintJson(HttpService:JSONEncode(mutationsData))
return data
