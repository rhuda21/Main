local r = game:GetService("ReplicatedStorage").Modules.Library.FuseDurations
local m = game:GetService("ReplicatedStorage").Modules.Library.BrainrotMutations
local rarity = {}
for name,d in pairs(require(r)) do
    table.insert(rarity, name)
end
local mutation = {}
for name, data in pairs(require(m).mutation) do
    table.insert(mutation, name)
end
