local ForgeHooks = {}
local Originals = {}

function ForgeHooks.EnableAutoMelt()
    local MeltMinigame = require(ReplicatedStorage.Controllers.ForgeController.MeltMinigame)
    if not Originals.MeltMinigame then 
        Originals.MeltMinigame = MeltMinigame.Start 
    end
    MeltMinigame.Start = function(self, p30)
        local startTime = workspace:GetServerTimeNow() - (p30.StartTime or 0)
        local requiredTime = p30.RequiredTime
        local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        local forgeGui = playerGui:WaitForChild("Forge")
        local meltUI = forgeGui:WaitForChild("MeltMinigame")
        meltUI.Visible = true
        meltUI.Bar.Area.Size = UDim2.fromScale(1, 0)
        local Knit = require(ReplicatedStorage.Shared.Packages.Knit)
        local UIController = Knit.GetController("UIController")
        local timeElapsed = 0
        local updateRate = 0.05
        while timeElapsed < requiredTime do
            task.wait(updateRate)
            timeElapsed = timeElapsed + updateRate
            local progress = math.min(timeElapsed / requiredTime, 1)
            meltUI.Bar.Area.Size = UDim2.fromScale(1, progress)
            meltUI.Bar.Area.BackgroundColor3 = Color3.fromRGB(255, 207, 85)
            if UIController.Modules.Forge.physicalOres then
                for _, ore in UIController.Modules.Forge.physicalOres do
                    if ore.PrimaryPart then
                        ore.PrimaryPart.Transparency = progress
                    end
                end
            end
        end
        meltUI.Bar.Area.Size = UDim2.fromScale(1, 1)
        if UIController.Modules.Forge.physicalOres then
            for _, ore in UIController.Modules.Forge.physicalOres do
                ore:Destroy()
            end
        end
        task.wait(0.5)
        meltUI.Visible = false   
        local totalTime = workspace:GetServerTimeNow() - startTime
        return totalTime
    end
end

function ForgeHooks.DisableAutoMelt()
    local MeltMinigame = require(ReplicatedStorage.Controllers.ForgeController.MeltMinigame)
    if Originals.MeltMinigame then
        MeltMinigame.Start = Originals.MeltMinigame
    end
end

function ForgeHooks.EnableAutoPour()
    local PourMinigame = require(ReplicatedStorage.Controllers.ForgeController.PourMinigame)
    if not Originals.PourMinigame then 
        Originals.PourMinigame = PourMinigame.Start 
    end
    PourMinigame.Start = function(self, p20)
        local startTime = workspace:GetServerTimeNow() - (p20.StartTime or 0)
        local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
        local forgeGui = playerGui:WaitForChild("Forge")
        local pourUI = forgeGui:WaitForChild("PourMinigame")
        local requiredTime = p20.RequiredTime
        pourUI.Visible = true
        pourUI.Frame.Position = UDim2.fromScale(0.893, 0.5)
        pourUI.Timer.Position = UDim2.fromScale(0.506, 0.871)
        pourUI.Timer.Bar.Size = UDim2.fromScale(0, 0.65)
        local Knit = require(ReplicatedStorage.Shared.Packages.Knit)
        local ForgeController = Knit.GetController("ForgeController")
        local crucible = ForgeController.Station.Crucible
        local originalLiquidSize = crucible.Liquid.Size
        local timeInZone = 0
        local timeElapsed = 0
        local updateRate = 0.05
        while timeInZone < requiredTime do
            task.wait(updateRate)
            timeElapsed = timeElapsed + updateRate
            timeInZone = timeInZone + updateRate
            
            local progress = math.min(timeInZone / requiredTime, 1)
            pourUI.Timer.Bar.Size = UDim2.fromScale(progress, 0.65)
            pourUI.Inside.TextColor3 = Color3.new(0.156863, 1, 0.027451)
            
            local newHeight = originalLiquidSize.Y * (1 - progress)
            crucible.Liquid.Size = Vector3.new(originalLiquidSize.X, newHeight, originalLiquidSize.Z)
            crucible.PrimaryPart.LiquidWeld.C0 = CFrame.new(0, newHeight / 2 - 1, -0.1)
        end
        pourUI.Timer.Bar.Size = UDim2.fromScale(1, 0.65)
        task.wait(0.5)
        pourUI.Visible = false
        local totalTime = workspace:GetServerTimeNow() - startTime
        return totalTime
    end
end

function ForgeHooks.DisableAutoPour()
    local PourMinigame = require(ReplicatedStorage.Controllers.ForgeController.PourMinigame)
    if Originals.PourMinigame then
        PourMinigame.Start = Originals.PourMinigame
    end
end

function ForgeHooks.EnableAutoHammer()
    local HammerMinigame = require(ReplicatedStorage.Controllers.ForgeController.HammerMinigame)
    if not Originals.HammerMinigame then 
        Originals.HammerMinigame = HammerMinigame.CreateNote 
    end
    HammerMinigame.CreateNote = function(self, p24, p_u_25, p_u_26)
        local lifetime = p24.Lifetime
        local perfectWindow = lifetime * 25 / 44
        local timingIntervals = p24.TimingIntervals
        local perfectInterval = timingIntervals[1]
        for _, interval in timingIntervals do
            if interval.Name == "Perfect" then
                perfectInterval = interval
                break
            end
        end
        task.wait(perfectWindow)
        return true
    end
end

function ForgeHooks.DisableAutoHammer()
    local HammerMinigame = require(ReplicatedStorage.Controllers.ForgeController.HammerMinigame)
    if Originals.HammerMinigame then
        HammerMinigame.CreateNote = Originals.HammerMinigame
    end
end

function ForgeHooks.EnableAll()
    ForgeHooks.EnableAutoMelt()
    ForgeHooks.EnableAutoPour()
    ForgeHooks.EnableAutoHammer()
end

function ForgeHooks.DisableAll()
    ForgeHooks.DisableAutoMelt()
    ForgeHooks.DisableAutoPour()
    ForgeHooks.DisableAutoHammer()
end

function ForgeHooks.ToggleAll(enable)
    if enable then
        ForgeHooks.EnableAll()
    else
        ForgeHooks.DisableAll()
    end
end

return ForgeHooks
