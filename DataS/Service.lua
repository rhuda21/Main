local DataService = {}

local Script = ""
local OverideID = nil
local GameId = OverideID or game.PlaceId
local endpoint = "https://ub-services.rhuda21.workers.dev/loadData"
local DataE = endpoint .. "?script=Mutations&gameId=" .. tostring(GameId)

function InitalizeData(Data)
  

return DataService
