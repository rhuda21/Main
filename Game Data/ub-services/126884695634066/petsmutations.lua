local PetMutationRegistry = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetMutationRegistry)
local mutationNames = {}
for name, data in pairs(PetMutationRegistry.PetMutationRegistry) do
    table.insert(mutationNames, name)
end
table.sort(mutationNames)
local mutations = mutationNames
local petsmutation = "local PetsM = {\n"
for i, name in ipairs(mutations) do
    petsmutation = petsmutation .. '    "' .. name .. '"'
    if i < #mutations then
        petsmutation = petsmutation .. ","
    end
    petsmutation = petsmutation .. "\n"
end
petsmutation = petsmutation .. "}\n\nreturn PetsM"
return petsmutation
