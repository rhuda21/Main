local RequireWeak = loadstring(game:HttpGet("https://gitlab.com/r_soft/main/-/raw/main/Others/Require.lua"))()
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
local Data = {
    Seeds = SafeRequire(game:GetService("ReplicatedStorage").Data.SeedData),
    Eggs = SafeRequire(game:GetService("ReplicatedStorage").Data.PetEggData),
    Gears = SafeRequire(game:GetService("ReplicatedStorage").Data.GearData),
    Cosmetics = SafeRequire(game:GetService("ReplicatedStorage").Data.CosmeticItemShopData),
    Pets = SafeRequire(game:GetService("ReplicatedStorage").Data.PetRegistry.PetList),
    Event1 = SafeRequire(game:GetService("ReplicatedStorage").Data.EventShopData),
    Merchant = SafeRequire(game:GetService("ReplicatedStorage").Data.TravelingMerchant.TravelingMerchantData.GnomeMerchantShopData),
    Sprinkler = SafeRequire(game:GetService("ReplicatedStorage").Data.SprinklerData),
    PetsM = SafeRequire(game:GetService("ReplicatedStorage").Data.PetRegistry.PetMutationRegistry)
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
return output