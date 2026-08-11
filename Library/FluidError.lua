local ts = game:GetService("TweenService")
local p = game:GetService("Players").LocalPlayer
local gui = p:WaitForChild("PlayerGui")
local ti = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local sg = Instance.new("ScreenGui")
sg.Name = "ErrGui"
sg.ResetOnSpawn = false
sg.Parent = gui
local mf = Instance.new("Frame")
mf.Size = UDim2.new(0, 0, 0, 0)
mf.Position = UDim2.new(0.5, 0, 0.5, 0)
mf.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
mf.BorderSizePixel = 0
mf.ClipsDescendants = true
mf.Parent = sg
local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 16)
mc.Parent = mf
local tb = Instance.new("Frame")
tb.Size = UDim2.new(1, 0, 0, 4)
tb.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
tb.BorderSizePixel = 0
tb.Parent = mf
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 16)
tc.Parent = tb
local tl = Instance.new("TextLabel")
tl.Size = UDim2.new(1, -40, 0, 28)
tl.Position = UDim2.new(0, 20, 0, 32)
tl.BackgroundTransparency = 1
tl.Text = "Something Went Wrong"
tl.TextColor3 = Color3.fromRGB(244, 244, 245)
tl.TextSize = 20
tl.Font = Enum.Font.GothamBold
tl.Parent = mf
local ds = Instance.new("TextLabel")
ds.Size = UDim2.new(1, -40, 0, 50)
ds.Position = UDim2.new(0, 20, 0, 68)
ds.BackgroundTransparency = 1
ds.Text = "We encountered an unexpected error while processing your request. Please try again or join our community for updates."
ds.TextColor3 = Color3.fromRGB(161, 161, 170)
ds.TextSize = 13
ds.Font = Enum.Font.Gotham
ds.TextWrapped = true
ds.Parent = mf
local rt = Instance.new("TextButton")
rt.Size = UDim2.new(0.45, -5, 0, 42)
rt.Position = UDim2.new(0, 20, 1, -62)
rt.BackgroundColor3 = Color3.fromRGB(39, 39, 42)
rt.Text = "Try Again"
rt.TextColor3 = Color3.fromRGB(244, 244, 245)
rt.TextSize = 14
rt.Font = Enum.Font.GothamMedium
rt.AutoButtonColor = true
rt.Parent = mf
local rc = Instance.new("UICorner")
rc.CornerRadius = UDim.new(0, 10)
rc.Parent = rt
local dc = Instance.new("TextButton")
dc.Size = UDim2.new(0.45, -5, 0, 42)
dc.Position = UDim2.new(0.55, -15, 1, -62)
dc.BackgroundColor3 = Color3.fromRGB(144, 5, 142)
dc.Text = "Join Discord"
dc.TextColor3 = Color3.fromRGB(255, 255, 255)
dc.TextSize = 14
dc.Font = Enum.Font.GothamBold
dc.AutoButtonColor = true
dc.Parent = mf
local dcc = Instance.new("UICorner")
dcc.CornerRadius = UDim.new(0, 10)
dcc.Parent = dc
local tIn = ts:Create(mf, ti, {Size = UDim2.new(0, 420, 0, 200), Position = UDim2.new(0.5, -210, 0.5, -100)})
local tOut = ts:Create(mf, ti, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
tIn:Play()
rt.MouseButton1Click:Connect(function()
	tOut:Play()
	tOut.Completed:Wait()
	sg:Destroy()
end)
dc.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/v4K8tvwW8q")
	dc.Text = "Link Copied!"
	task.wait(2)
	dc.Text = "Join Discord"
end)
