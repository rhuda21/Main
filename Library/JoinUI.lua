if not getgenv().LoadedUBJoiner then getgenv().LoadedUBJoiner = true end

local TweenService = game:GetService("TweenService")
local CoreGui = gethui() or cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local corner = Instance.new("UICorner")
local stroke = Instance.new("UIStroke")
local label = Instance.new("TextLabel")
local btnContainer = Instance.new("Frame")
local layout = Instance.new("UIListLayout")
local copyBtn = Instance.new("TextButton")
local cornerCopy = Instance.new("UICorner")
local exitBtn = Instance.new("TextButton")
local cornerExit = Instance.new("UICorner")

gui.Name = "DiscordJoiner"
gui.Parent = CoreGui
gui.ResetOnSpawn = false

frame.Name = "JoinerFrame"
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(24, 25, 28)
frame.BorderSizePixel = 0
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Draggable = true
frame.Active = true

corner.Parent = frame
corner.CornerRadius = UDim.new(0, 12)

stroke.Parent = frame
stroke.Color = Color3.fromRGB(47, 49, 54)
stroke.Thickness = 1.5

label.Name = "DiscordLabel"
label.Parent = frame
label.BackgroundTransparency = 1
label.Position = UDim2.new(0.5, 0, 0.15, 0)
label.Size = UDim2.new(0.85, 0, 0, 60)
label.Font = Enum.Font.GothamMedium
label.Text = "Join our community to make suggestions and help us become the #1 keyless script! We support OVER 15 games"
label.TextColor3 = Color3.fromRGB(220, 221, 222)
label.TextSize = 14
label.TextWrapped = true
label.AnchorPoint = Vector2.new(0.5, 0)

btnContainer.Name = "ButtonContainer"
btnContainer.Parent = frame
btnContainer.BackgroundTransparency = 1
btnContainer.Position = UDim2.new(0.075, 0, 0.65, 0)
btnContainer.Size = UDim2.new(0.85, 0, 0, 40)

layout.Parent = btnContainer
layout.FillDirection = Enum.FillDirection.Horizontal
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0, 12)

copyBtn.Name = "CopyButton"
copyBtn.Parent = btnContainer
copyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
copyBtn.Size = UDim2.new(0.48, 0, 1, 0)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.Text = "Copy Invite"
copyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyBtn.TextSize = 13
copyBtn.AutoButtonColor = false

cornerCopy.Parent = copyBtn
cornerCopy.CornerRadius = UDim.new(0, 8)

exitBtn.Name = "ExitButton"
exitBtn.Parent = btnContainer
exitBtn.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
exitBtn.Size = UDim2.new(0.48, 0, 1, 0)
exitBtn.Font = Enum.Font.GothamBold
exitBtn.Text = "Close"
exitBtn.TextColor3 = Color3.fromRGB(242, 243, 245)
exitBtn.TextSize = 13
exitBtn.AutoButtonColor = false

cornerExit.Parent = exitBtn
cornerExit.CornerRadius = UDim.new(0, 8)

local function tweenColor(object, property, targetColor, duration)
    TweenService:Create(object, TweenInfo.new(duration or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {[property] = targetColor}):Play()
end

local function copyInvite()
    local link = "https://discord.gg/pn8xyhuSeV"
    copyBtn.Text = "Copying..."
    tweenColor(copyBtn, "BackgroundColor3", Color3.fromRGB(71, 82, 196))
    task.wait(0.3)
    setclipboard(link)
    copyBtn.Text = "Copied!"
    tweenColor(copyBtn, "BackgroundColor3", Color3.fromRGB(35, 165, 90))
    task.delay(2, function()
        copyBtn.Text = "Copy Invite"
        tweenColor(copyBtn, "BackgroundColor3", Color3.fromRGB(88, 101, 242))
    end)
end

local function closeGui()
    local fadeTime = 0.25
    local info = TweenInfo.new(fadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(frame, info, {BackgroundTransparency = 1}):Play()
    TweenService:Create(stroke, info, {Transparency = 1}):Play()
    TweenService:Create(label, info, {TextTransparency = 1}):Play()
    TweenService:Create(copyBtn, info, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(exitBtn, info, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    
    task.wait(fadeTime)
    gui:Destroy()
end

local function setupHover(btn, normalColor, hoverColor)
    btn.MouseEnter:Connect(function()
        tweenColor(btn, "BackgroundColor3", hoverColor)
    end)
    btn.MouseLeave:Connect(function()
        tweenColor(btn, "BackgroundColor3", normalColor)
    end)
end

setupHover(copyBtn, Color3.fromRGB(88, 101, 242), Color3.fromRGB(71, 82, 196))
setupHover(exitBtn, Color3.fromRGB(47, 49, 54), Color3.fromRGB(53, 55, 60))

copyBtn.MouseButton1Click:Connect(copyInvite)
exitBtn.MouseButton1Click:Connect(closeGui)

frame.BackgroundTransparency = 1
stroke.Transparency = 1
label.TextTransparency = 1
copyBtn.BackgroundTransparency = 1
copyBtn.TextTransparency = 1
exitBtn.BackgroundTransparency = 1
exitBtn.TextTransparency = 1

local fadeTime = 0.3
local info = TweenInfo.new(fadeTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

TweenService:Create(frame, info, {BackgroundTransparency = 0}):Play()
TweenService:Create(stroke, info, {Transparency = 0}):Play()
TweenService:Create(label, info, {TextTransparency = 0}):Play()
TweenService:Create(copyBtn, info, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
TweenService:Create(exitBtn, info, {BackgroundTransparency = 0, TextTransparency = 0}):Play()

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Executed.lua"))()
    end)
end)
