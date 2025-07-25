local mutationModule = require(game:GetService("ReplicatedStorage").Modules.MutationHandler)
local mutationNames = {}
for name, _ in pairs(mutationModule.MutationNames) do
    table.insert(mutationNames, name)
end
table.sort(mutationNames)
local mutationsData = {}
for _, name in ipairs(mutationNames) do
    local mutationData = mutationModule:GetMutations()[name]
    if mutationData then
        mutationsData[name] = {
            Name = mutationData.Name,
            Id = mutationData.Id,
            Color = mutationData.Color,
            ValueMulti = mutationData.ValueMulti,
            TimeData = mutationData.TimeData
        }
    end
end
local clipboardText = "return {\n"
for name, data in pairs(mutationsData) do
    clipboardText = clipboardText .. string.format('    ["%s"] = {\n', name)
    clipboardText = clipboardText .. string.format('        ["Name"] = "%s",\n', data.Name)
    clipboardText = clipboardText .. string.format('        ["Id"] = "%s",\n', data.Id)
    if data.Color then
        local r, g, b = math.floor(data.Color.R * 255), math.floor(data.Color.G * 255), math.floor(data.Color.B * 255)
        clipboardText = clipboardText .. string.format('        ["Color"] = Color3.fromRGB(%d, %d, %d),\n', r, g, b)
    else
        clipboardText = clipboardText .. '        ["Color"] = nil,\n'
    end
    clipboardText = clipboardText .. string.format('        ["ValueMulti"] = %d,\n', data.ValueMulti)
    if data.TimeData then
        clipboardText = clipboardText .. '        ["TimeData"] = {\n'
        clipboardText = clipboardText .. string.format('            ["TimeToChange"] = %d,\n', data.TimeData.TimeToChange)
        clipboardText = clipboardText .. string.format('            ["AddMutationName"] = "%s"\n', data.TimeData.AddMutationName)
        clipboardText = clipboardText .. '        },\n'
    end
    clipboardText = clipboardText .. '    },\n'
end
clipboardText = clipboardText .. "}"
return clipboardText
