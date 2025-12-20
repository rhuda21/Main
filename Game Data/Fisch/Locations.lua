local locations = require(game:GetService("ReplicatedStorage").shared.modules.library.locations)
local locationNames = {}
for _, locationData in pairs(locations) do
    table.insert(locationNames, locationData.Name)
end
local output = "local Locations = {\n"
for index, name in ipairs(locationNames) do
    if index == #locationNames then
        output = output .. '  "' .. name .. '"\n'
    else
        output = output .. '  "' .. name .. '",\n'
    end
end
o = output .. "}\n\nreturn Locations"
return o
