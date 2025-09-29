local Module = {}
local HttpService = game:GetService("HttpService")
local JSON = game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/UBHub.json")
local config = HttpService:JSONDecode(JSON)
local Optionsurl = "https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/Legacy/Configuration.lua"
local response = game:HttpGet(Optionsurl)
local UBHubOT = loadstring(response)()
local Library = loadstring(game:HttpGetAsync(UBHubOT.Lib))()
local SaveManager = loadstring(game:HttpGetAsync(UBHubOT.SaveManager))()
local InterfaceManager = loadstring(game:HttpGetAsync(UBHubOT.InterfaceManager))()
local WebhookLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/WebhookLibrary.lua"))()

local Window = Library:CreateWindow{
    Title = config.Name .. tostring(_G.currentVersion),
    SubTitle = "",
    TabWidth = 170,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = false,
    Theme = "UBHub",
    MinimizeKey = Enum.KeyCode.RightShift
}
Module.config = config
Module.Library = Library
Module.SaveManager = SaveManager
Module.InterfaceManager = InterfaceManager
Module.WebhookLib = WebhookLib
Module.Window = Window

return Module
