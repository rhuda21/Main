local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MapsModule = require(ReplicatedStorage.Shared.Information.Maps)
local ExtractedData = {
    PreviewInfo = MapsModule.PreviewInfo,
    GamemodeTypes = MapsModule.GamemodeTypes,
    DefaultMaxPlayers = MapsModule.DefaultMaxPlayers,
    IgnoreCompletionHistory = MapsModule.IgnoreCompletionHistory,
    AllMapsList = MapsModule:GetAllMaps(),
    AllGamemodesList = MapsModule:GetAllGamemodes(),
    MapData = MapsModule.MapData
}
local success, jsonString = pcall(function()
    return HttpService:JSONEncode(ExtractedData)
end)
if success then
  return setclipboard(jsonString)
else
    warn("Failed to encode data to JSON:", jsonString)
end
