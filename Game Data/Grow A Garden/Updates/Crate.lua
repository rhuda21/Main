local crate = "return {\n"
for crateName, crateData in pairs(require(game:GetService("ReplicatedStorage").Data.CosmeticCrateRegistry.CosmeticCrates)) do
    crate = crate .. string.format('    ["%s"] = {\n', crateName)
    crate = crate .. string.format('        ["Name"] = "%s",\n', crateName)
    if crateData.Color then
        local r, g, b = math.floor(crateData.Color.R * 255), math.floor(crateData.Color.G * 255), math.floor(crateData.Color.B * 255)
        crate = crate .. string.format('        ["Color"] = Color3.fromRGB(%d, %d, %d),\n', r, g, b)
    else
        crate = crate .. '        ["Color"] = nil,\n'
    end
    crate = crate .. string.format('        ["OpenTime"] = %d,\n', crateData.OpenTime or 1800)
    if crateData.Icon and crateData.Icon ~= "" then
        crate = crate .. string.format('        ["Icon"] = "%s",\n', crateData.Icon)
    else
        crate = crate .. '        ["Icon"] = nil,\n'
    end
    if crateData.CosmeticRolls and crateData.CosmeticRolls.Items then
        crate = crate .. '        ["Items"] = {\n'
        for itemName, itemData in pairs(crateData.CosmeticRolls.Items) do
            crate = crate .. string.format('            ["%s"] = {\n', itemName)
            crate = crate .. string.format('                ["Name"] = "%s",\n', itemData.Name)
            crate = crate .. string.format('                ["ItemOdd"] = %d,\n', itemData.ItemOdd)
            crate = crate .. '            },\n'
        end
        crate = crate .. '        },\n'
    end
    crate = crate .. '    },\n'
end
crate = crate .. "}"
return crate