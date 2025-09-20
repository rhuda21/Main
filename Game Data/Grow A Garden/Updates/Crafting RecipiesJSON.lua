local recipes = {}
for recipeName, recipeData in pairs(require(game:GetService("ReplicatedStorage").Data.CraftingData.CraftingRecipeRegistry).ItemRecipes) do
    local inputs = {}
    for i, v in pairs(recipeData.Inputs) do
        inputs[i] = {ItemType = v.ItemType,ItemData = {AcceptAllTypes = v.ItemData.AcceptAllTypes or false,ItemName = v.ItemData.ItemName}}
    end
    recipes[recipeName] = {Inputs = inputs, MachineTypes = recipeData.MachineTypes, Cost = recipeData.Cost}
end return game:GetService("HttpService"):JSONEncode(recipes)
