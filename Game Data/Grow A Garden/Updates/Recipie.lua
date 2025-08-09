local HttpService = game:GetService("HttpService")
local recipesData = require(game:GetService("ReplicatedStorage").Data.FoodRecipeData)
local recipes = {}
for recipeName, recipeData in pairs(recipesData.Recipes) do
    local recipe = {
        Id = recipeData.Id,
        Priority = recipeData.Priority,
        Requires = {
            Count = recipeData.Requires.Count,
            Ingredients = {}
        },
        Results = recipeData.Results,
        BaseTime = recipeData.BaseTime,
        BaseWeight = recipeData.BaseWeight
    }
    if recipeData.Requires.Ingredients then
        for ingredientType, ingredientValue in pairs(recipeData.Requires.Ingredients) do
            recipe.Requires.Ingredients[ingredientType] = ingredientValue
        end
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
local FoodRecipie = prettyPrintJson(HttpService:JSONEncode(recipes))
setclipboard(FoodRecipie)
return FoodRecipie