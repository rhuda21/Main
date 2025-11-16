local HttpService = game:GetService("HttpService")
local fishingZonesModule = game:GetService("ReplicatedStorage").shared.modules.library.fish.zones
local zoneData = require(fishingZonesModule)
local data = HttpService:JSONEncode(zoneData)
return data
