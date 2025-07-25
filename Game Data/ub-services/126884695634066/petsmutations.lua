local PetMutationRegistry = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetMutationRegistry)
local mutationNames = {}
for name, data in pairs(PetMutationRegistry.PetMutationRegistry) do
    table.insert(mutationNames, name)
end
table.sort(mutationNames)
local mutations = mutationNames
local clipboardText = "local PetsM = {\n"
for i, name in ipairs(mutations) do
    clipboardText = clipboardText .. '    "' .. name .. '"'
    if i < #mutations then
        clipboardText = clipboardText .. ","
    end
    clipboardText = clipboardText .. "\n"
end
clipboardText = clipboardText .. "}\n\nreturn PetsM"
return clipboardText
