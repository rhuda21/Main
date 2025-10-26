local httpService = game:GetService("HttpService")
local SaverVer = 11
local folderName = "UBHub//SaverX"
local fileName = folderName .. "//settings//default.json"
local SaveManager = {} do
    SaveManager.Folder = "UBHub//SaverX"
    SaveManager.Ignore = {}
    SaveManager.Parser = {
        Toggle = {
            Save = function(idx, object) 
                return { type = "Toggle", idx = idx, value = object.Value } 
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] then 
                    SaveManager.Options[idx]:SetValue(data.value)
                    SaveManager:Save("default")
                end
            end,
        },
        Slider = {
            Save = function(idx, object)
                return { type = "Slider", idx = idx, value = tostring(object.Value) }
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] then 
                    SaveManager.Options[idx]:SetValue(data.value)
                    SaveManager:Save("default")
                end
            end,
        },
        Dropdown = {
            Save = function(idx, object)
                return { type = "Dropdown", idx = idx, value = object.Value, mutli = object.Multi }
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] then 
                    SaveManager.Options[idx]:SetValue(data.value)
                    SaveManager:Save("default")
                end
            end,
        },
        Colorpicker = {
            Save = function(idx, object)
                return { type = "Colorpicker", idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] then 
                    SaveManager.Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)
                    SaveManager:Save("default")
                end
            end,
        },
        Keybind = {
            Save = function(idx, object)
                return { type = "Keybind", idx = idx, mode = object.Mode, key = object.Value }
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] then 
                    SaveManager.Options[idx]:SetValue(data.key, data.mode)
                    SaveManager:Save("default")
                end
            end,
        },
        Input = {
            Save = function(idx, object)
                return { type = "Input", idx = idx, text = object.Value }
            end,
            Load = function(idx, data)
                if SaveManager.Options[idx] and type(data.text) == "string" then
                    SaveManager.Options[idx]:SetValue(data.text)
                    SaveManager:Save("default")
                end
            end,
        },
    }

    function SaveManager:SetIgnoreIndexes(list)
        for _, key in next, list do
            self.Ignore[key] = true
        end
    end

    function SaveManager:SetFolder(folder)
        self.Folder = folder;
        self:BuildFolderTree()
    end

    local savingLock = false
    function SaveManager:Save(name)
        if savingLock then return false, "save in progress" end
        savingLock = true
        
        if not name then
            savingLock = false
            return false, "no config file is selected"
        end

        if name:match("[^%w _-]") then
            savingLock = false
            return false, "invalid characters in config name"
        end

        local fullPath = self.Folder .. "/settings/" .. name .. ".json"
        local data = { objects = {} }

        if not SaveManager.Options then
            savingLock = false
            return false, "SaveManager.Options is not initialized"
        end

        for idx, option in next, SaveManager.Options do
            if not self.Parser[option.Type] then continue end
            if self.Ignore[idx] then continue end
            table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
        end    

        local success, encoded = pcall(httpService.JSONEncode, httpService, data)
        if not success then
            savingLock = false
            return false, "failed to encode data"
        end

        local writeSuccess, writeErr = pcall(function()
            writefile(fullPath, encoded)
        end)
        if not writeSuccess then
            savingLock = false
            return false, "file write failed: " .. writeErr
        end

        savingLock = false
        return true
    end

    function SaveManager:Load(name)
        if not name then
            return false, "no config file is selected"
        end
        
        local file = self.Folder .. "/settings/" .. name .. ".json"
        if not isfile(file) then return false, "invalid file" end

        local content
        local success, err = pcall(function()
            content = readfile(file)
        end)
        if not success then return false, "read error: " .. err end

        local success, decoded = pcall(httpService.JSONDecode, httpService, content)
        if not success then return false, "decode error" end

        for _, option in next, decoded.objects do
            if self.Parser[option.type] then
                task.spawn(function() self.Parser[option.type].Load(option.idx, option) end)
            end
        end
        return true
    end

    function SaveManager:IgnoreThemeSettings()
        self:SetIgnoreIndexes({ 
            "InterfaceTheme", "AcrylicToggle", "TransparentToggle", "MenuKeybind"
        })
    end

    function SaveManager:BuildFolderTree()
        local paths = {
            self.Folder,
            self.Folder .. "/settings"
        }

        for i = 1, #paths do
            local str = paths[i]
            if not isfolder(str) then
                makefolder(str)
            end
        end
    end

    function SaveManager:RefreshConfigList()
        local list = listfiles(self.Folder .. "/settings")
        local out = {}
        for _, file in ipairs(list) do
            if file:sub(-5) == ".json" then
                local base = file:match("([^/\\]+)%.json$")
                if base and base ~= "options" then
                    table.insert(out, base)
                end
            end
        end
        table.sort(out)
        return out
    end

    function SaveManager:SetLibrary(library)
        assert(library and library.Options, "Invalid library structure")
        self.Library = library
        self.Options = library.Options
    end

    function SaveManager:LoadAutoloadConfig()
        local autoloadFile = self.Folder .. "/settings/autoload.txt"
        local name = isfile(autoloadFile) and readfile(autoloadFile) or "default"
        self:Load(name)
    end

    function SaveManager:BuildConfigSection(tab)
        assert(self.Library, "Must set SaveManager.Library")
        local section = tab:AddSection("Advanced Saver")

        section:AddButton({Title = "Reset Script Config", Description = "This will rejoin your game!", Callback = function()
            local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport 
            queueteleport("loadstring(game:HttpGet('https://gitlab.com/r_soft/main/-/raw/main/LoadUB.lua'))()")
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            local function rejoinserver()
                local Player = Players.LocalPlayer
                local placeId = game.PlaceId
                local jobId = game.JobId
                TeleportService:TeleportToPlaceInstance(placeId, jobId, Player)
            end
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "UB Hub | 🔃 Reset";
                Text = "The reseting has initiated!";
                Icon = "rbxassetid://94513440833543";
                Duration = 2;
            })
            for _, folder in next, {"UBHub"} do
                if isfolder(folder) then
                    delfolder(folder)
                end
            end
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "UB Hub | 🔃 Reset";
                Text = "The reseting was successfull \n You will rejoin game shortly";
                Icon = "rbxassetid://94513440833543";
                Duration = 5;
            })
            task.wait(5)
            rejoinserver()
        end})

        section:AddInput("SaveManager_ConfigName", { Title = "Config name" })
        section:AddDropdown("SaveManager_ConfigList", { Title = "Config list", Values = self:RefreshConfigList(), AllowNull = true })

        section:AddButton({
            Title = "Create config",
            Callback = function()
                local name = SaveManager.Options.SaveManager_ConfigName.Value
                if name:gsub(" ", "") == "" then 
                    return self.Library:Notify({
                        Title = "Interface",
                        Content = "Config loader",
                        SubContent = "Invalid config name (empty)",
                        Duration = 7
                    })
                end

                local success, err = self:Save(name)
                if not success then
                    return self.Library:Notify({
                        Title = "Interface",
                        Content = "Config loader",
                        SubContent = "Failed to save config: " .. err,
                        Duration = 7
                    })
                end

                self.Library:Notify({
                    Title = "Interface",
                    Content = "Config loader",
                    SubContent = string.format("Created config %q", name),
                    Duration = 7
                })

                SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
                SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
            end
        })

        section:AddButton({Title = "Load config", Callback = function()
            local name = SaveManager.Options.SaveManager_ConfigList.Value
            local success, err = self:Load(name)
            if not success then
                return self.Library:Notify({
                    Title = "Interface",
                    Content = "Config loader",
                    SubContent = "Failed to load config: " .. err,
                    Duration = 7
                })
            end

            self.Library:Notify({
                Title = "Interface",
                Content = "Config loader",
                SubContent = string.format("Loaded config %q", name),
                Duration = 7
            })
        end})

        section:AddButton({Title = "Refresh list", Callback = function()
            SaveManager.Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            SaveManager.Options.SaveManager_ConfigList:SetValue(nil)
        end})
        SaveManager:SetIgnoreIndexes({ "SaveManager_ConfigList", "SaveManager_ConfigName" })
    end

    function SaveManager:AutoSave()
        while true do
            self:Save("default")
            task.wait(20)
        end
    end
end

return SaveManager
