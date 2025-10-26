local Module = {}
local HttpService = game:GetService("HttpService")
local config = HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/UBHub.json"))
local UBHubOT = {
    DC = "https://discord.gg/pn8xyhuSeV",
    Endpoint = "https://ubhub.pages.dev/",
    Lib = "https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/V2.lua",
    SaveManager = "https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/Legacy/Saver.lua",
    InterfaceManager = "https://raw.githubusercontent.com/rhuda21/Main/refs/heads/main/Library/V2.lua"
}
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
