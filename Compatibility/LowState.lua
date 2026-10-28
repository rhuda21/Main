local LowEndChecks = {}

LowEndChecks.LowEnd = { "Xeno", "Solara", "WRD" }

local executorName = ""
if identifyexecutor then
    local ok, name = pcall(identifyexecutor)
    if ok and type(name) == "string" then
        executorName = name:lower()
    end
end

local function IsLowEnd()
    for _, name in ipairs(LowEndChecks.LowEnd) do
        if executorName:find(name:lower(), 1, true) then
            return true
        end
    end
    return false
end
local isLowEnd = IsLowEnd() 
