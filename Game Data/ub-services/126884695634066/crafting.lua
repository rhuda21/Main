local function SafeRequire(script)
    local success, result = pcall(function()
        return require(script)
    end)
    if success then
        return result
    else
        return RequireWeak.GetScript(script)
    end
end
local HttpService = game:GetService("HttpService")
local craftingData = SafeRequire(game:GetService("ReplicatedStorage").Data.CraftingData.CraftingRecipeRegistry)
local recipes = {}
for recipeName, recipeData in pairs(craftingData.ItemRecipes) do
    local recipe = {
        ["Inputs"] = {},
        ["MachineTypes"] = recipeData.MachineTypes, 
        ["Cost"] = recipeData.Cost
    }
    for inputIndex, input in pairs(recipeData.Inputs) do
        recipe.Inputs[inputIndex] = {
            ["ItemType"] = input.ItemType,
            ["ItemData"] = {
                ["AcceptAllTypes"] = input.ItemData.AcceptAllTypes or false,
                ["ItemName"] = input.ItemData.ItemName
            }
        }
    end
    recipes[recipeName] = recipe
end
local function formatTable(t, indent)
    indent = indent or ""
    local result = "{\n"
    for k, v in pairs(t) do
        if type(v) == "table" then
            result = result .. indent .. "  [" .. HttpService:JSONEncode(k) .. "] = " .. formatTable(v, indent .. "  ") .. ",\n"
        else
            result = result .. indent .. "  [" .. HttpService:JSONEncode(k) .. "] = " .. HttpService:JSONEncode(v) .. ",\n"
        end
    end
    result = result .. indent .. "}"
    return result
end
local CraftingRecipie = "return " .. formatTable(recipes)
return CraftingRecipie
