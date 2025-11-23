local Require = {}

function Require.Decompiler(Script)
    local API = "https://medal-decom.rhuda21.workers.dev/decompile"
    local AUTH_SECRET = "ymjKH2O3BbO3bDSsKmpo3ek3vHxIWYLQfj0"
    local Success, Bytecode = pcall(getscriptbytecode, Script)
    if not Success then
        local Error = "--Failed to get script bytecode, error:\n" .. tostring(Bytecode)
        return Error, true
    end
    local encodedBytecode = crypt.base64.encode(Bytecode)
    local Response = request({
        Url = API,
        Body = encodedBytecode,
        Method = "POST",
        Headers = {
            ["Authorization"] = AUTH_SECRET,
            ["Content-Type"] = "application/octet-stream"
        },
    })
    if Response.StatusCode ~= 200 then
        local Error = "--Error occurred while requesting the API:\n" .. tostring(Response.Body)
        return Error, true
    end
    return Response.Body, false
end

local function ReplaceRequire(source)
    return source:gsub("require%s*%(", "Require.GetScript(")
end

function Require.GetScript(module)
    local source
    if module.Source then
        source = module.Source
    else
        local decompiled, isError = Require.Decompiler(module)
        if isError then
            return nil, "Failed to decompile: " .. tostring(decompiled)
        end
        source = decompiled
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
