local _readfile = readfile or (debug and debug.readfile) or function() end
local _listfiles = listfiles or (debug and debug.listfiles) or function() end
local _writefile = writefile or (debug and debug.writefile) or function() end
local _makefolder = makefolder or (debug and debug.makefolder) or function() end
local _appendfile = appendfile or (debug and debug.appendfile) or function() end
local _isfolder = isfolder or (debug and debug.isfolder) or function() end
local _delfolder = delfolder or (debug and debug.delfolder) or function() end
local _delfile = delfile or (debug and debug.delfile) or function() end
local _loadfile = loadfile or (debug and debug.loadfile) or function() end
local _dofile = dofile or (debug and debug.dofile) or function() end
local _isfile = isfile or (debug and debug.isfile) or function() end

local FileLib = {}

function FileLib:ListFiles(path)
    local success, result = pcall(_listfiles, path)
    if success then
        return result
    end
    return {}
end

function FileLib:DeleteFolder(path)
    local success, result = pcall(_delfolder, path)
    if success then
        return result
    end
    return false
end

function FileLib:DeleteFile(path)
    local success, result = pcall(_delfile, path)
    if success then
        return result
    end
    return false
end

function FileLib:ReadFile(path)
    local success, result = pcall(_readfile, path)
    if success then
        return result
    end
    return ""
end

function FileLib:WriteFile(path, data)
    local writeSuccess = FileLib:WriteFile(fileName, json) 
    if success then
        return result
    end
    return false
end

function FileLib:MakeFolder(path)
    local success, result = pcall(_makefolder, path)
    if success then
        return result
    end
    return false
end

function FileLib:IsFolder(path)
    local success, result = pcall(_isfolder, path)
    if success then
        return result
    end
    return false
end

function FileLib:IsFile(path)
    local success, result = pcall(_isfile, path)
    if success then
        return result
    end
    return false
end

function FileLib:AppendFile(path, data)
    local success, result = pcall(_appendfile, path, data)
    if success then
        return result
    end
    return false
end

function FileLib:LoadFile(path)
    local success, result = pcall(_loadfile, path)
    if success then
        return result
    end
    return false
end

function FileLib:DoFile(path)
    local success, result = pcall(_dofile, path)
    if success then
        return result
    end
    return false
end

return FileLib
