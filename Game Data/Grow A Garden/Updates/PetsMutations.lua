local PetMutationRegistry = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetMutationRegistry)
local mutationNames = {}
for name, data in pairs(PetMutationRegistry.PetMutationRegistry) do
    table.insert(mutationNames, name)
end
table.sort(mutationNames)
return mutationNames
local mutations = GetMutationNames()
local clipboardText = "local PetsM = {\n"
for i, name in ipairs(mutations) do
    clipboardText = clipboardText .. '    "' .. name .. '"'
    if i < #mutations then
        clipboardText = clipboardText .. ","
    end
    clipboardText = clipboardText .. "\n"
end
clipboardText = clipboardText .. "}\n\nreturn PetsM"
if setclipboard then
    setclipboard(clipboardText)
    print("Copied to clipboard!")
end
print(clipboardText)