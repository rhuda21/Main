local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
local allFishData = {}
local itemsFolder = ReplicatedStorage:FindFirstChild("Items")
if not itemsFolder then
    warn("Items folder not found in ReplicatedStorage!")
    return allFishData
end
local function getWeightRange(weightData, rangeName)
    if not weightData or not weightData[rangeName] then
        return {Min = 0, Max = 0}
    end
    local range = weightData[rangeName]
    if typeof(range) == "NumberRange" then
        return {Min = range.Min, Max = range.Max}
    elseif type(range) == "table" then
        return {Min = range.Min or range[1] or 0, Max = range.Max or range[2] or 0}
    else
        return {Min = 0, Max = 0}
    end
end
for _, child in ipairs(itemsFolder:GetChildren()) do
    if child:IsA("ModuleScript") then
        local success, moduleData = pcall(function() return require(child) end)
        if success and moduleData and moduleData.Data then
            if moduleData.Data.Type == "Fishes" then
                local fish = {
                    Id = moduleData.Data.Id or 0,
                    Type = moduleData.Data.Type or "Unknown",
                    Name = moduleData.Data.Name or "Unnamed Fish",
                    Description = moduleData.Data.Description or "",
                    Icon = moduleData.Data.Icon or "",
                    Tier = moduleData.Data.Tier or 0,
                    SellPrice = moduleData.SellPrice or 0,
                    Weight = {
                        Big = getWeightRange(moduleData.Weight, "Big"),
                        Default = getWeightRange(moduleData.Weight, "Default")
                    },
                    Probability = (moduleData.Probability and moduleData.Probability.Chance) or 0,
                    ModuleName = child.Name,
                    ModulePath = child:GetFullName()
                } 
                table.insert(allFishData, fish)
            end
            else
                if not success then return end
            end
        end
    end
local Fishes = prettyPrintJson(HttpService:JSONEncode(allFishData))
setclipboard(Fishes)
return Fishes
