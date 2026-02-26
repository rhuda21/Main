local PlantDef = {}
local HS = game:GetService("HttpService")
for i,p in pairs(require(game:GetService("ReplicatedStorage").Plants.Definitions.PlantDataDefinitions)) do
table.insert(PlantDef,p)
end
return HS:JSONEncode(PlantDef)
