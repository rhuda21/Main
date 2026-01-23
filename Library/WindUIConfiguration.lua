local Saver = {}
local savedData = {}
local Path
local function GetSavedVal(name,defaultVal)
    local sv = savedData[name]
    if sv == nil then return defaultVal end
    if type(defaultVal) == "table" and type(sv) ~= "table" then
        if type(sv) == "string" then
            return {sv}
        else
            return sv
        end
    end
    if type(defaultVal) == "number" then
        return tonumber(sv) or defaultVal
    elseif type(defaultVal) == "string" then
        return tostring(sv)
    elseif type(defaultVal) == "boolean" then
        return not not sv
    end
    return sv
end
Saver.InitSaver = function(Folder, File)
    local success, error = pcall(function()
        if not isfolder(Folder) then
            makefolder(Folder)
        end
        Path = Folder .. "/" .. File .. ".json"
        if not isfile(Path) then 
            writefile(Path, "{}") 
        end
        local content = readfile(Path)
        savedData = game:GetService("HttpService"):JSONDecode(content) or {}
    end)
    if not success then
        rconsoleprint("Failed to initialize saver:" .. error)
        return false
    end
    return true
end
Saver.Save = function()
    pcall(function()
        local json = game:GetService("HttpService"):JSONEncode(savedData)
        writefile(Path, json)
    end)
end
Saver.Load = function()
    pcall(function()
        local content = readfile(Path)
        savedData = game:GetService("HttpService"):JSONDecode(content) or {}
    end)
end
Saver.PatchElement = function(elementType, UI, originalMethod)
    local original = originalMethod or UI[elementType]
    UI[elementType] = function(self, config)
        local elementName = config.Title or "NO NAME"
        if elementType == "Toggle" then
            local savedValue = GetSavedVal(elementName, config.Value)
            config.Value = savedValue
            local originalCallback = config.Callback
            config.Callback = function(state)
                savedData[elementName] = state
                Saver.Save()
                if originalCallback then originalCallback(state) end
            end
        elseif elementType == "Dropdown" then
            local options = config.Values or {}
            local multi = config.Multi == true
            local savedValue = GetSavedVal(elementName, config.Value)
            if multi then
                if type(savedValue) ~= "table" then
                    savedValue = {tostring(savedValue)}
                end
                if not config.AllowNone and #savedValue == 0 and #options > 0 then
                    savedValue = {options[1]}
                end
            else
                savedValue = tostring(savedValue)
            end
            config.Value = savedValue
            local originalCallback = config.Callback
            config.Callback = function(selected)
                savedData[elementName] = selected
                Saver.Save()
                if originalCallback then originalCallback(selected) end
            end
        elseif elementType == "Slider" then
            local defaultValue = config.Value.Default
            local savedValue = GetSavedVal(elementName, defaultValue)
            config.Value.Default = savedValue
            local originalCallback = config.Callback
            config.Callback = function(value)
                savedData[elementName] = value
                Saver.Save()
                if originalCallback then originalCallback(value) end
            end
        end
        return original(self, config)
    end
end
Saver.PatchAll = function(UI)
    Saver.PatchElement("Toggle", UI)
    Saver.PatchElement("Dropdown", UI)
    Saver.PatchElement("Slider", UI)
end
return Saver
