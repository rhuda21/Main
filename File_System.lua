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
    pcall(function()
        return _listfiles(path)
    end)
    return {}
end

function FileLib:DeleteFolder(path)
    pcall(function()
        return _delfolder(path)
    end)
    return false
end

function FileLib:DeleteFile(path)
    pcall(function()
        return _delfile(path)
    end)
    return false
end

function FileLib:ReadFile(path)
    pcall(function()
        return _readfile(path)
    end)
    return ""
end

function FileLib:WriteFile(path, data)
    pcall(function()
        if not self:IsFolder(path) then
            self:MakeFolder(path)
        end
        return _writefile(path, data)
    end)
    return false
end

function FileLib:MakeFolder(path)
    pcall(function()
        return _makefolder(path)
    end)
    return false
end

function FileLib:IsFolder(path)
    pcall(function()
        return _isfolder(path)
    end)
    return false
end

function FileLib:IsFile(path)
    pcall(function()
        return _isfile(path)
    end)
    return false
end

function FileLib:AppendFile(path, data)
    pcall(function()
        if not self:IsFolder(path) then
            self:MakeFolder(path)
        end
        return _appendfile(path, data)
    end)
    return false
end

function FileLib:LoadFile(path)
    pcall(function()
        return _loadfile(path)
    end)
    return false
end

function FileLib:DoFile(path)
    pcall(function()
        return _dofile(path)
    end)
    return false
end

return FileLib
