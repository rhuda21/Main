local Data = {
    Seeds = require(game:GetService("ReplicatedStorage").Data.SeedData),
    Eggs = require(game:GetService("ReplicatedStorage").Data.PetEggData),
    Gears = require(game:GetService("ReplicatedStorage").Data.GearData),
    Cosmetics = require(game:GetService("ReplicatedStorage").Data.CosmeticItemShopData),
    Pets = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetList),
    Event1 = require(game:GetService("ReplicatedStorage").Data.EventShopData),
    Merchant = require(game:GetService("ReplicatedStorage").Data.TravelingMerchant.TravelingMerchantData.GnomeMerchantShopData),
    Sprinkler = require(game:GetService("ReplicatedStorage").Data.SprinklerData),
    PetsM = require(game:GetService("ReplicatedStorage").Data.PetRegistry.PetMutationRegistry)
}
local function formatTable(name, data)
    local items = {}
    if name == "Sprinkler" then
        for item in pairs(data.SprinklerBoxSizes) do
            table.insert(items, '    "'..item..'"')
        end
    else
        for item in pairs(data) do
            table.insert(items, '    "'..item..'"')
        end
    end
    return "local "..name.." = {\n"..table.concat(items, ",\n").."\n}"
end
local output = ""
for name, data in pairs(Data) do
    output = output .. formatTable(name, data) .. "\n\n"
end

output = output .. [[
return {
    Seeds = Seeds,
    Eggs = Eggs,
    Gears = Gears,
    Cosmetics = Cosmetics,
    Pets = Pets,
    Event1 = Event1,
    Variants = variant,
    Merchant = Merchant,
    sprinklerNames = sprinklerNames,
    PetMutations = PetMutations
}]]
return output
