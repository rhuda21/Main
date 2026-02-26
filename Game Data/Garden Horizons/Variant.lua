local HS = game:GetService("HttpService")
local VariantDef = require(game:GetService("ReplicatedStorage").Plants.Definitions.VariantDataDefinitions)
return HS:JSONEncode(VariantDef)
