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
Saver.RegisterDropdown = function(dropdown,UI)
    local dropdownName = dropdown.Title or "NO NAME"
    local options = dropdown.Values or {}
    local multi = dropdown.Multi == true
    local savedValue = GetSavedVal(dropdownName, dropdown.Value)
    if multi then
        if type(savedValue) ~= "table" then
            savedValue = {tostring(savedValue)}
        end
        if not dropdown.AllowNone and #savedValue == 0 and #options > 0 then
            savedValue = {options[1]}
        end
    else
        savedValue = tostring(savedValue)
    end
    dropdown.Value = savedValue
    local originalCallback = dropdown.Callback
    dropdown.Callback = function(selected)
        savedData[dropdownName] = selected
        pcall(function()
            local json = game:GetService("HttpService"):JSONEncode(savedData)
            writefile(Path, json)
        end)
        if originalCallback then
            originalCallback(selected)
        end
    end
    if UI then
        return UI:Dropdown(dropdown)
    else
        return Tab:Dropdown(dropdown)
    end
end
Saver.RegisterToggle = function(toggle, UI)
    local toggleName = toggle.Title or "NO NAME"
    local savedValue = GetSavedVal(toggleName, toggle.Value)
    toggle.Value = savedValue
    local originalCallback = toggle.Callback
    toggle.Callback = function(state)
        savedData[toggleName] = state
        pcall(function()
            local json = game:GetService("HttpService"):JSONEncode(savedData)
            writefile(Path, json)
        end)
        if originalCallback then
            originalCallback(state)
        end
    end
    if UI then
        return UI:Toggle(toggle)
    else
        return Tab:Toggle(toggle)
    end
end
Saver.InitSaver = function(Folder, File)
    local success, error = pcall(function()
        Path = Folder .. File .. ".json"
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
