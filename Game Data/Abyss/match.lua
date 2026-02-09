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
local v1 = {}
local matchfolder = game:GetService("ReplicatedStorage").common.presets.items.fish
for _, v2 in ipairs(matchfolder:GetChildren()) do
    if v2:IsA("Folder") then
        for _, v3 in ipairs(v2:GetChildren()) do
            if v3:IsA("ModuleScript") then
                local success, moduleData = pcall(function() return require(v3) end)
                if success then
                    v1[v3.Name] = moduleData
                end
            end
        end
    elseif v2:IsA("ModuleScript") then
        local success, moduleData = pcall(function() return require(v2) end)
        if success then
            v1[v2.Name] = moduleData
        end
    end
end
local json = prettyPrintJson(HttpService:JSONEncode(v1))
return json
