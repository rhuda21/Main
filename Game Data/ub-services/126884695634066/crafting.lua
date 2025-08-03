local HttpService = game:GetService("HttpService")
local craftingData = require(game:GetService("ReplicatedStorage").Data.CraftingData.CraftingRecipeRegistry)
local recipes = {}
for recipeName, recipeData in pairs(craftingData.ItemRecipes) do
    local recipe = {
        Inputs = {},
        MachineTypes = recipeData.MachineTypes, 
        Cost = recipeData.Cost
    }
    for inputIndex, input in pairs(recipeData.Inputs) do
        recipe.Inputs[inputIndex] = {
            ItemType = input.ItemType,
            ItemData = {
                AcceptAllTypes = input.ItemData.AcceptAllTypes or false,
                ItemName = input.ItemData.ItemName
            }
        }
    end
    recipes[recipeName] = recipe
end
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
local craftingfrecipies = prettyPrintJson(HttpService:JSONEncode(recipes))
--setclipboard(craftingfrecipies)
return craftingfrecipies