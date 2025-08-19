local HttpService = game:GetService("HttpService")
local PetData = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetList)
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
local petsArray = {}
for petName, petData in pairs(PetData) do
    table.insert(petsArray, {
        Name = petName,
        Description = petData.Description or "No description",
        Icon = petData.Icon or "No icon",
        Hunger = petData.DefaultHunger or 0,
        Rarity = petData.Rarity or "Unknown",
        SellPrice = petData.SellPrice or 0,
        MovementType = petData.MovementType or "Unknown",
        MovementSpeed = petData.MovementSpeed or 0
    })
end
local dataPet = prettyPrintJson(HttpService:JSONEncode(petsArray))
setclipboard(dataPet)
return dataPet