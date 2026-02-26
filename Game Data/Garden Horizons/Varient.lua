local VariantDef = {}
local HS = game:GetService("HttpService")
for i,p in pairs(require(game:GetService("ReplicatedStorage").Plants.Definitions.VariantDataDefinitions)) do
table.insert(VariantDef,p)
end
return HS:JSONEncode(PlantDef)
