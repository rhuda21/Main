local HttpService = game:GetService("HttpService")
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
local function tableToJson(name, data)
    local items = {}
    if name == "Sprinkler" then
        for item in pairs(data.SprinklerBoxSizes) do
            table.insert(items, item)
        end
    else
        for item in pairs(data) do
            table.insert(items, item)
        end
    end
    return HttpService:JSONEncode({
        [name] = items
    })
end
local DataOutput = "{"
for name, data in pairs(Data) do
    if DataOutput ~= "{" then
        DataOutput = DataOutput .. ","
    end
    DataOutput = DataOutput .. tableToJson(name, data):sub(2, -2)
end
DataOutput = DataOutput .. "}"
local alldata = prettyPrintJson(DataOutput)
--setclipboard(alldata)
return alldata