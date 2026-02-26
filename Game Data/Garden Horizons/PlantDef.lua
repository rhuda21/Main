local HS = game:GetService("HttpService")
local PlantDef = require(game:GetService("ReplicatedStorage").Plants.Definitions.PlantDataDefinitions)
return HS:JSONEncode(PlantDef)
