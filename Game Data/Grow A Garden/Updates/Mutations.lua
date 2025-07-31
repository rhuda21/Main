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
local mutations = "return {\n"
for name, data in pairs(mutationsData) do
    mutations = mutations .. string.format('    ["%s"] = {\n', name)
    mutations = mutations .. string.format('        ["Name"] = "%s",\n', data.Name)
    mutations = mutations .. string.format('        ["Id"] = "%s",\n', data.Id)
    if data.Color then
        local r, g, b = math.floor(data.Color.R * 255), math.floor(data.Color.G * 255), math.floor(data.Color.B * 255)
        mutations = mutations .. string.format('        ["Color"] = Color3.fromRGB(%d, %d, %d),\n', r, g, b)
    else
        mutations = mutations .. '        ["Color"] = nil,\n'
    end
    mutations = mutations .. string.format('        ["ValueMulti"] = %d,\n', data.ValueMulti)
    if data.TimeData then
        mutations = mutations .. '        ["TimeData"] = {\n'
        mutations = mutations .. string.format('            ["TimeToChange"] = %d,\n', data.TimeData.TimeToChange)
        mutations = mutations .. string.format('            ["AddMutationName"] = "%s"\n', data.TimeData.AddMutationName)
        mutations = mutations .. '        },\n'
    end
    mutations = mutations .. '    },\n'
end
mutations = mutations .. "}"
return mutations
