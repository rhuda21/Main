local Require = {}
local DebugLogs = {}

local function Debug(output)
    table.insert(DebugLogs, tostring(output))
    print("[DEBUG REQUIRE]",output)
end

function Require.Decompiler(Script)
    local API = "http://api.plusgiant5.com/konstant/decompile"
    if decompile then return decompile(Script), false end
    local Success, Bytecode = pcall(getscriptbytecode, Script)
    if not Success then
        local Error = "--Failed to get script bytecode, error:\n" ..
                      "--[[\n" .. tostring(Bytecode) .. "\n]]"
        return Error, true
    end
    local Response = request({
        Url = API,
        Body = Bytecode,
        Method = "POST",
        Headers = {["Content-Type"] = "text/plain"},
    })
    if Response.StatusCode ~= 200 then
        local Error = "--[KONSTANT] Error occurred while requesting the API, error:\n" ..
                      "--[[\n" .. tostring(Response.Body) .. "\n]]"
        return Error, true
    end
    return Response.Body, false
end
local function ReplaceRequire(source)
    return source:gsub("require%s*%(", "Require.GetScript(")
end
function Require.GetScript(module)
    local source
    if decompile then
        source = decompile(module)
    elseif module.Source then
        source = module.Source
    elseif getscriptbytecode then
        local decompiled, isError = Require.Decompiler(module)
        if isError then
            return nil, "Failed to decompile: " .. tostring(decompiled)
        end
        source = decompiled
    else
        return nil, "No method to get module source"
    end
    source = ReplaceRequire(source)
    local func, err = loadstring(source)
    if not func then
        return nil, "Failed to load module code: " .. tostring(err)
    end
    local env = getfenv(func)
    env.script = module
    setfenv(func, env)
    local ok, result = pcall(func)
    if not ok then
        return nil, "Error running module: " .. tostring(result)
    end
    return result
end
return Require
