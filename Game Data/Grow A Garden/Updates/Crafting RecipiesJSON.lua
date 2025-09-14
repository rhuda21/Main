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
local craftingfrecipies = HttpService:JSONEncode(recipes)
--setclipboard(craftingfrecipies)
return craftingfrecipies