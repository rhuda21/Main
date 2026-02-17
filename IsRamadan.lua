local Config = {
    RamadanEnabled = false,
    AssetId = "138563654068249",
    Theme = {
        Primary = Color3.fromRGB(15, 8, 25),
        Secondary = Color3.fromRGB(10, 5, 15),
        Accent = Color3.fromRGB(45, 20, 70),  
        ThemeHighlight = Color3.fromRGB(255, 190, 60),
        Text = Color3.fromRGB(180, 170, 190),         
        Background = Color3.fromRGB(5, 2, 10),        
        Stroke = Color3.fromRGB(255, 190, 60), 
    },
}
return function(LibraryCfg)
    if Config.RamadanEnabled then
        LibraryCfg.Themes.UB = Config.Theme
    end
end
