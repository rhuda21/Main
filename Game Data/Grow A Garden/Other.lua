local function CopyTableToClipboard(name)
    local items = {}
    local UI = game:GetService("Players").LocalPlayer.PlayerGui[name].Frame.ScrollingFrame
    for i, v in pairs(UI:GetChildren()) do
        if v:IsA("Frame") and not v.Name:find("Padding") then
            table.insert(items, '"' .. v.Name .. '"')
        end
    end
    local clipboardText = "{" .. table.concat(items, ", ") .. "}"
    setclipboard(clipboardText)
    return clipboardText
end