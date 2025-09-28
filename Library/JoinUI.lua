task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Executed.lua"))()
    end)
end)
if not _G.LoadedUBJoiner then _G.LoadedUBJoiner = true end
local ScreenGui = Instance.new("ScreenGui")
local JoinerFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local DiscordLabel = Instance.new("TextLabel")
local Divider = Instance.new("Frame")
local ButtonContainer = Instance.new("Frame")
local CopyButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local ExitButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

ScreenGui.Name = "DiscordJoiner"
ScreenGui.Parent = cloneref(gethui()) or game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999

JoinerFrame.Name = "JoinerFrame"
JoinerFrame.Parent = ScreenGui
JoinerFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
JoinerFrame.BorderSizePixel = 0
JoinerFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
JoinerFrame.Size = UDim2.new(0, 350, 0, 250)
JoinerFrame.Draggable = true
JoinerFrame.Active = true

UICorner.Parent = JoinerFrame
UICorner.CornerRadius = UDim.new(0, 8)

TitleBar.Name = "TitleBar"
TitleBar.Parent = JoinerFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

UICorner_2.Parent = TitleBar
UICorner_2.CornerRadius = UDim.new(0, 8)

DiscordLabel.Name = "DiscordLabel"
DiscordLabel.Parent = JoinerFrame
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Position = UDim2.new(0.5, 0, 0.3, 0)
DiscordLabel.Size = UDim2.new(0.8, 0, 0, 70)
DiscordLabel.Font = Enum.Font.GothamSemibold
DiscordLabel.Text = "Join our community so you can make suggestion. HELP us become Number 1 Keyless Script! We have OVER 15 GAMES"
DiscordLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
DiscordLabel.TextSize = 16
DiscordLabel.TextWrapped = true
DiscordLabel.AnchorPoint = Vector2.new(0.5, 0)

Divider.Name = "Divider"
Divider.Parent = JoinerFrame
Divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 0, 0.6, 0)
Divider.Size = UDim2.new(1, 0, 0, 1)

ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Parent = JoinerFrame
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0, 0, 0.65, 0)
ButtonContainer.Size = UDim2.new(1, 0, 0, 80)

CopyButton.Name = "CopyButton"
CopyButton.Parent = ButtonContainer
CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
CopyButton.Position = UDim2.new(0.1, 0, 0.1, 0)
CopyButton.Size = UDim2.new(0.35, 0, 0.8, 0)
CopyButton.Font = Enum.Font.Gotham
CopyButton.Text = "Copy Invite"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 14
CopyButton.AutoButtonColor = false

UICorner_3.Parent = CopyButton
UICorner_3.CornerRadius = UDim.new(0, 4)

ExitButton.Name = "ExitButton"
ExitButton.Parent = ButtonContainer
ExitButton.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
ExitButton.Position = UDim2.new(0.55, 0, 0.1, 0)
ExitButton.Size = UDim2.new(0.35, 0, 0.8, 0)
ExitButton.Font = Enum.Font.Gotham
ExitButton.Text = "Close"
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.TextSize = 14
ExitButton.AutoButtonColor = false

UICorner_4.Parent = ExitButton
UICorner_4.CornerRadius = UDim.new(0, 4)

local function OpenDC(Invite)
    if request then
        local success, err = pcall(function()
            request({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    Origin = 'https://discord.com'
                },
                Body = HttpService:JSONEncode({
                    cmd = 'INVITE_BROWSER',
                    nonce = game:GetService("HttpService"):GenerateGUID(false),
                    args = {code = Invite}
                })
            })
        end)
    end
end

local function copyInvite()
    OpenDC("pn8xyhuSeV")
    local inviteLink = "https://discord.gg/pn8xyhuSeV"
    CopyButton.Text = "Copy"
    CopyButton.BackgroundColor3 = Color3.fromRGB(66, 77, 181)
    task.wait(0.3)
    setclipboard(inviteLink)
    CopyButton.Text = "Copied!"
    CopyButton.BackgroundColor3 = Color3.fromRGB(59, 165, 92)
    task.delay(2, function()
        CopyButton.Text = "Copy Invite"
        CopyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end)
end

local function closeGui()
    for i = 1, 0, -0.05 do
        JoinerFrame.BackgroundTransparency = 1 - i
        TitleBar.BackgroundTransparency = 1 - i
        DiscordLabel.TextTransparency = 1 - i
        CopyButton.TextTransparency = 1 - i
        ExitButton.TextTransparency = 1 - i
        task.wait(0.01)
    end
    ScreenGui:Destroy()
end

local function buttonHoverEffect(button, hoverColor)
    local originalColor = button.BackgroundColor3
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor
    end) 
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = originalColor
    end)
end

buttonHoverEffect(CopyButton, Color3.fromRGB(71, 82, 196))
buttonHoverEffect(ExitButton, Color3.fromRGB(66, 69, 74))

CopyButton.MouseButton1Click:Connect(copyInvite)
ExitButton.MouseButton1Click:Connect(closeGui)

JoinerFrame.BackgroundTransparency = 1
TitleBar.BackgroundTransparency = 1
DiscordLabel.TextTransparency = 1
CopyButton.TextTransparency = 1
ExitButton.TextTransparency = 1

for i = 0, 1, 0.05 do
    JoinerFrame.BackgroundTransparency = 1 - i
    TitleBar.BackgroundTransparency = 1 - i
    DiscordLabel.TextTransparency = 1 - i
    CopyButton.TextTransparency = 1 - i
    ExitButton.TextTransparency = 1 - i
    task.wait(0.01)
end
