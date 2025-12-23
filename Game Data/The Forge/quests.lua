local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage_upvr:WaitForChild("Shared")
local _ = Shared:WaitForChild("Packages")
local Proximity = workspace:WaitForChild("Proximity")
local module = {}
local tbl_20 = {
	Name = "Getting Started!";
	Description = "Talk to 'Sensei Moro' to get started.";
	AutoComplete = true;
}
local tbl_54 = {}
local tbl_7 = {
	Type = "Talk";
	Target = "Sensei Moro";
}
local Sensei_Moro_3 = Proximity:FindFirstChild("Sensei Moro")
if Sensei_Moro_3 then
	Sensei_Moro_3 = Proximity:FindFirstChild("Sensei Moro").PrimaryPart
end
tbl_7.Marker = Sensei_Moro_3
tbl_7.MarkerWaitForQuest = true
tbl_7.BeamTarget = Proximity:FindFirstChild("Sensei Moro")
tbl_54[1] = tbl_7
tbl_20.Objectives = tbl_54
tbl_20.Rewards = {
	XP = 5;
}
tbl_20.Prerequisites = nil
tbl_20.Npc = "Sensei Moro"
module.Introduction0 = tbl_20
module.Introduction1 = {
	Name = "First Pickaxe!";
	Description = "Equip the given stone pickaxe to get started with your journey.";
	AutoComplete = true;
	Objectives = {{
		Type = "UI";
		Target = "Equipments";
	}, {
		Type = "Equip";
		Target = "Pickaxe";
		Description = "Equip Stone Pickaxe";
		IncludeProgress = true;
	}, {
		Type = "Collect";
		Target = "Ore";
		Amount = 6;
		Marker = workspace:WaitForChild("Debris"):WaitForChild("Markers"):FindFirstChild("Introduction1");
		BeamTarget = require(script:WaitForChild("ActivatePebbleTargetQuest")).Activate;
	}};
	Rewards = {
		XP = 50;
		Gold = 25;
		Quest = "Introduction2";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro";
}
module.Introduction2 = {
	Name = "Learning to Forge!";
	Description = "Let's learn to forge.";
	AutoComplete = true;
	Objectives = {{
		Type = "Forge";
		Target = "Weapon";
		Amount = 2;
		BeamTarget = Proximity:FindFirstChild("Forge"):FindFirstChild("Attachment");
	}};
	Rewards = {
		XP = 125;
		Gold = 125;
		Quest = "Introduction3";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro";
}
module.Introduction3 = {
	Name = "Getting Equipped!";
	Description = "Equip one of the weapons, then sell the other.";
	AutoComplete = true;
	Objectives = {{
		Type = "EquipWeapon";
		Target = "Weapon";
		Amount = 1;
		Description = "Equip Weapon";
	}, {
		Type = "Sell";
		Target = "Weapon";
		Amount = 1;
		Description = "Sell Weapon";
		BeamTarget = Proximity:FindFirstChild("Marbles");
	}};
	Rewards = {
		XP = 125;
		Gold = 0;
		Quest = "Introduction4";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro";
}
local tbl_14 = {
	Name = "New Pickaxe!";
	Description = "Grab your new pickaxe and get to mining.";
	AutoComplete = true;
}
local tbl_9 = {}
local tbl_33 = {
	Type = "Collect";
	Target = "Bronze Pickaxe";
	Amount = 1;
	Description = "Purchase 'Bronze Pickaxe'";
}
local Bronze_Pickaxe = Proximity:FindFirstChild("Bronze Pickaxe")
if Bronze_Pickaxe then
	Bronze_Pickaxe = Proximity:FindFirstChild("Bronze Pickaxe").PrimaryPart
end
tbl_33.Marker = Bronze_Pickaxe
tbl_33.IncludeProgress = true
tbl_33.BeamTarget = Proximity:FindFirstChild("Bronze Pickaxe")
tbl_9[1] = tbl_33
tbl_9[2] = {
	Type = "Collect";
	Target = "Ore";
	Amount = 10;
	BeamTarget = require(script:WaitForChild("ActivateRockTargetQuest")).Activate;
}
tbl_9[3] = {
	Type = "Kill";
	Target = "Zombie";
	Amount = 1;
}
tbl_14.Objectives = tbl_9
tbl_14.Rewards = {
	XP = 175;
	Gold = 500;
	Quest = "Introduction5";
}
tbl_14.Prerequisites = nil
tbl_14.Npc = "Sensei Moro"
module.Introduction4 = tbl_14
module.Introduction5 = {
	Name = "Preparing For Battle";
	Description = "Forge armors to improve your defense.";
	AutoComplete = true;
	Objectives = {{
		Type = "Forge";
		Target = "Armor";
		Amount = 2;
		BeamTarget = Proximity:FindFirstChild("Forge"):FindFirstChild("Attachment");
	}};
	Rewards = {
		XP = 200;
		Gold = 250;
		Quest = "Introduction6";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro";
}
local tbl_50 = {
	Name = "Forging Under Pressure";
	Description = "Battle enemies, gather materials, and prove your forging prowess.";
	AutoComplete = true;
}
local tbl_11 = {}
local tbl_30 = {
	Type = "Collect";
	Target = "Iron Pickaxe";
	Amount = 1;
	Description = "Purchase 'Iron Pickaxe'";
}
local Iron_Pickaxe = Proximity:FindFirstChild("Iron Pickaxe")
if Iron_Pickaxe then
	Iron_Pickaxe = Proximity:FindFirstChild("Iron Pickaxe").PrimaryPart
end
tbl_30.Marker = Iron_Pickaxe
tbl_30.IncludeProgress = true
tbl_30.BeamTarget = Proximity:FindFirstChild("Iron Pickaxe")
tbl_11[1] = tbl_30
tbl_11[2] = {
	Type = "Kill";
	Target = "Zombie";
	Amount = 3;
}
tbl_11[3] = {
	Type = "Forge";
	Target = "Any";
	Amount = 3;
}
tbl_11[4] = {
	Type = "Collect";
	Target = "Ore";
	Amount = 35;
}
tbl_50.Objectives = tbl_11
tbl_50.Rewards = {
	XP = 300;
	Gold = 1500;
	Quest = "Introduction7";
}
tbl_50.Prerequisites = nil
tbl_50.Npc = "Sensei Moro"
module.Introduction6 = tbl_50
local tbl = {
	Name = "Reporting In";
	Description = "Return and report your progress.";
	AutoComplete = true;
}
local tbl_35 = {}
local tbl_36 = {
	Type = "Talk";
	Target = "Sensei Moro";
	Amount = 1;
}
local Sensei_Moro_4 = Proximity:FindFirstChild("Sensei Moro")
if Sensei_Moro_4 then
	Sensei_Moro_4 = Proximity:FindFirstChild("Sensei Moro").PrimaryPart
end
tbl_36.Marker = Sensei_Moro_4
tbl_36.BeamTarget = Proximity:FindFirstChild("Sensei Moro")
tbl_35[1] = tbl_36
tbl.Objectives = tbl_35
tbl.Rewards = {
	XP = 75;
	Gold = 50;
	Material = {
		["Tiny Essence"] = 20;
		["Small Essence"] = 15;
		["Medium Essence"] = 10;
		["Large Essence"] = 6;
	};
	Quest = "Introduction8";
}
tbl.Prerequisites = nil
tbl.Npc = "Sensei Moro"
module.Introduction7 = tbl
local tbl_26 = {
	Name = "The First Upgrade";
	Description = "Enhance any piece to +3 and prepare for the trials ahead.";
	AutoComplete = true;
}
local tbl_53 = {}
local tbl_24 = {
	Type = "Enhance";
	Target = "Any";
	Amount = 1;
	Description = "Enhance any item to +3.";
}
local Enhancer = Proximity:FindFirstChild("Enhancer")
if Enhancer then
	Enhancer = Proximity:FindFirstChild("Enhancer").PrimaryPart
end
tbl_24.Marker = Enhancer
tbl_24.BeamTarget = Proximity:FindFirstChild("Enhancer")
function tbl_24.SpecialCondition(arg1) -- Line 187
	local var64
	if 3 > arg1.Level then
		var64 = false
	else
		var64 = true
	end
	return var64
end
tbl_53[1] = tbl_24
tbl_26.Objectives = tbl_53
tbl_26.Rewards = {
	XP = 100;
	Gold = 50;
	Rune = {
		Pickaxe_T1 = 1;
		Fire_T1 = 1;
		Shield_T1 = 1;
	};
	Quest = "Introduction9";
}
tbl_26.Prerequisites = nil
tbl_26.Npc = "Sensei Moro"
module.Introduction8 = tbl_26
local tbl_28 = {
	Name = "Runes of Power";
	Description = "Apply a rune to your equipment and unlock its strength.";
	AutoComplete = true;
}
local tbl_58 = {}
local tbl_56 = {
	Type = "RuneAttach";
	Target = "Any";
	Amount = 1;
	Description = "Attach a rune to any equipment.";
}
local Runemaker = Proximity:FindFirstChild("Runemaker")
if Runemaker then
	Runemaker = Proximity:FindFirstChild("Runemaker").PrimaryPart
end
tbl_56.Marker = Runemaker
tbl_56.BeamTarget = Proximity:FindFirstChild("Runemaker")
tbl_58[1] = tbl_56
tbl_28.Objectives = tbl_58
tbl_28.Rewards = {
	XP = 100;
	Gold = 50;
	Quest = "Introduction10";
}
tbl_28.Prerequisites = nil
tbl_28.Npc = "Sensei Moro"
module.Introduction9 = tbl_28
local tbl_59 = {
	Name = "End of the Beginning";
	Description = "Return and talk to Sensei Moro.";
	AutoComplete = true;
}
local tbl_49 = {}
local tbl_19 = {
	Type = "Talk";
	Target = "Sensei Moro";
	Amount = 1;
}
local Sensei_Moro = Proximity:FindFirstChild("Sensei Moro")
if Sensei_Moro then
	Sensei_Moro = Proximity:FindFirstChild("Sensei Moro").PrimaryPart
end
tbl_19.Marker = Sensei_Moro
tbl_19.BeamTarget = Proximity:FindFirstChild("Sensei Moro")
tbl_49[1] = tbl_19
tbl_59.Objectives = tbl_49
tbl_59.Rewards = {
	XP = 75;
	Gold = 50;
	Quest = "Introduction11";
}
tbl_59.Prerequisites = nil
tbl_59.Npc = "Sensei Moro"
module.Introduction10 = tbl_59
local tbl_43 = {
	Name = "Everything starts now.";
	Description = "Visit Wizard's Tower and talk with him.";
	AutoComplete = false;
}
local tbl_23 = {}
local tbl_17 = {
	Type = "Talk";
	Target = "Wizard";
	Amount = 1;
	Description = "Talk to the Wizard.";
}
local Wizard = Proximity:FindFirstChild("Wizard")
if Wizard then
	Wizard = Proximity:FindFirstChild("Wizard").PrimaryPart
end
tbl_17.Marker = Wizard
tbl_17.BeamTarget = Proximity:FindFirstChild("Wizard")
tbl_23[1] = tbl_17
tbl_43.Objectives = tbl_23
tbl_43.Rewards = {
	XP = 150;
	Gold = 250;
	Spins = 2;
}
tbl_43.Prerequisites = nil
tbl_43.Npc = "Wizard"
module.Introduction11 = tbl_43
module["..."] = {
	Objectives = {{
		Type = "Kill";
		Target = "Orc";
		Amount = 5;
	}};
	Progress = {};
}
local tbl_52 = {
	Name = "The Basics of Mining";
	Description = "Collect various resources through mining.";
	AutoComplete = true;
	Repeatable = true;
}
local tbl_40 = {}
local tbl_38 = {
	Type = "Collect";
	Target = "Stone";
}
local function Amount(arg1, arg2) -- Line 275
	--[[ Upvalues[1]:
		[1]: random_state_upvr (readonly)
	]]
	return random_state_upvr:NextInteger(3, 8)
end
tbl_38.Amount = Amount
local tbl_61 = {
	Type = "Collect";
}
local module_2_upvr = require(Shared:WaitForChild("RerollModule"))
function tbl_61.Target(arg1, arg2) -- Line 281
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	for i_2, v_2 in arg1.Possibilities do
		if not table.find(arg2, i_2) and v_2.Chance then
			({})[i_2] = {
				Chance = v_2.Chance;
			}
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return module_2_upvr:Reroll({}, nil, nil, true)
end
local function Amount(arg1, arg2) -- Line 289
	--[[ Upvalues[1]:
		[1]: random_state_upvr (readonly)
	]]
	return random_state_upvr:NextInteger(math.min(arg2.Possibilities[arg1].Max, 3), arg2.Possibilities[arg1].Max)
end
tbl_61.Amount = Amount
tbl_40[1] = tbl_38
tbl_40[2] = tbl_61
tbl_40[3] = {
	Type = "Collect";
	Target = "Copper";
	Amount = 5;
}
tbl_52.Objectives = tbl_40
tbl_52.Possibilities = {
	Stone = {
		Max = 5;
		MultiplierPerAmount = 1;
	};
	["Sand Stone"] = {
		Chance = 1;
		Max = 5;
		MultiplierPerAmount = 1;
	};
	Copper = {
		Max = 5;
		MultiplierPerAmount = 2;
	};
	Tin = {
		Chance = 2;
		Max = 5;
		MultiplierPerAmount = 3;
	};
	Iron = {
		Chance = 3;
		Max = 5;
		MultiplierPerAmount = 5;
	};
	Silver = {
		Chance = 6;
		Max = 2;
		MultiplierPerAmount = 10;
	};
	Poopite = {
		Chance = 10;
		Max = 1;
		MultiplierPerAmount = 15;
	};
	Bananite = {
		Chance = 10;
		Max = 1;
		MultiplierPerAmount = 15;
	};
	Cardboardite = {
		Chance = 10;
		Max = 1;
		MultiplierPerAmount = 30;
	};
}
local function Rewards(arg1, arg2) -- Line 313
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = {}
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [61] 46. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [61] 46. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 8. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.12]
	if nil then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.15]
		local function INLINED() -- Internal function, doesn't exist in bytecode
			-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.11]
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return nil < nil
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return nil
		end
		if nil and INLINED() or not INLINED_2() then
			-- KONSTANTWARNING: GOTO [61] #46
		end
	else
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [61.13]
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
			return nil < nil
		end
		local function INLINED_4() -- Internal function, doesn't exist in bytecode
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			return nil
		end
		if nil and INLINED_3() or not INLINED_4() then
		end
	end
	-- KONSTANTERROR: [8] 8. Error Block 30 end (CF ANALYSIS FAILED)
end
tbl_52.Rewards = Rewards
tbl_52.Progress = {}
tbl_52.Npc = "Nord"
module.Mining1 = tbl_52
local tbl_29 = {
	Name = "Rotten Depths";
	Description = "Clear out the zombies infesting the cave.";
	Repeatable = true;
	Objectives = {{
		Type = "Kill";
		Target = "Zombie";
		Amount = function() -- Line 358, Named "Amount"
			--[[ Upvalues[1]:
				[1]: random_state_upvr (readonly)
			]]
			return random_state_upvr:NextInteger(3, 8)
		end;
	}};
}
function tbl_29.Rewards(arg1) -- Line 363
	local var108 = arg1[1].requiredAmount / 3
	return {
		XP = math.floor(15 * var108);
		Gold = math.floor(15 * var108);
	}
end
tbl_29.Progress = {}
tbl_29.Npc = "UmutTheBrave"
module.Zombie1 = tbl_29
local tbl_34 = {
	Name = "Lost Guitar";
	Description = "Find Bard's Guitar.";
	AutoComplete = true;
}
local tbl_60 = {}
local tbl_22 = {
	Type = "Extra";
	Target = "Bard";
	Description = "Bring the Guitar.";
}
local Bard = Proximity:FindFirstChild("Bard")
if Bard then
	Bard = Proximity:FindFirstChild("Bard").PrimaryPart
end
tbl_22.Marker = Bard
tbl_22.MarkerWaitForQuest = true
tbl_60[1] = tbl_22
tbl_34.Objectives = tbl_60
tbl_34.Rewards = {
	XP = 250;
	Gold = 500;
	Badge = "TheGuitarFinder";
}
tbl_34.Prerequisites = nil
tbl_34.Npc = "Bard"
tbl_34.StateFunctions = {
	NotStartedFunction = tbl_47.BardQuest.NotStartedFunction;
	StartedFunction = tbl_47.BardQuest.StartedFunction;
	FinishedFunction = tbl_47.BardQuest.FinishedFunction;
}
module.BardQuest = tbl_34
module.Daily1 = {
	Name = "The Old Manâ€™s Request";
	Description = "The old man needs your help to get started. Buy a stone pickaxe and equip it to begin your adventure.";
	Objectives = {{
		Type = "Collect";
		Target = "Ore";
		Amount = 100;
	}};
	Rewards = {
		XP = 150;
		Gold = 300;
	};
	Prerequisites = nil;
	Cooldown = 86400;
	Npc = "Ceypai ( Daily Quest )";
}
module.Weekly1 = {
	Name = "The Minerâ€™s Challenge";
	Description = "A seasoned miner has heard of your skills and challenges you to collect 100 ores. Prove your worth and receive a mighty reward!";
	Objectives = {{
		Type = "Collect";
		Target = "Ore";
		Amount = 500;
	}};
	Rewards = {
		XP = 500;
		Gold = 1000;
	};
	Prerequisites = nil;
	Cooldown = 604800;
	Npc = "Not Real Ceypai";
}
module.Daily_SkeletalThreat = {
	Name = "Skeletal Threat";
	Description = "Eliminate undead forces.";
	AutoComplete = true;
	Objectives = {{
		Type = "Kill";
		Target = "Skeleton Rogue";
		Amount = 50;
	}, {
		Type = "Kill";
		Target = "Axe Skeleton";
		Amount = 30;
	}, {
		Type = "Kill";
		Target = "Deathaxe Skeleton";
		Amount = 15;
	}, {
		Type = "Kill";
		Target = "Bomber";
		Amount = 5;
	}};
	Rewards = {
		XP = 1250;
		Gold = 2500;
		Material = {
			["Epic Essence"] = 5;
		};
	};
	Prerequisites = nil;
	Cooldown = 86400;
	Npc = "Masked Stranger";
}
module.Daily_EliteHunt = {
	Name = "Elite Threat";
	Description = "Help Amber deal with elite threats.";
	AutoComplete = true;
	Objectives = {{
		Type = "Kill";
		Target = "Elite Rogue Skeleton";
		Amount = 30;
	}, {
		Type = "Kill";
		Target = "Elite Deathaxe Skeleton";
		Amount = 15;
	}, {
		Type = "Kill";
		Target = "Blazing Slime";
		Amount = 10;
	}, {
		Type = "Kill";
		Target = "Reaper";
		Amount = 5;
	}};
	Rewards = {
		XP = 1750;
		Gold = 6500;
		Material = {
			["Epic Essence"] = 10;
		};
		Rune = {
			Fire_T1 = 1;
		};
	};
	Prerequisites = nil;
	Cooldown = 86400;
	Npc = "Amber";
}
module.Daily_Mine = {
	Name = "Basalt Extraction";
	Description = "Barakkulf needs help clearing basalt deposits.";
	AutoComplete = true;
	Objectives = {{
		Type = "Mine";
		Target = "Basalt Rock";
		Amount = 150;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 50;
	}};
	Rewards = {
		XP = 1750;
		Gold = 5000;
		Ore = {
			Titanium = 10;
			Cobalt = 8;
			["Lapis Lazuli"] = 5;
		};
	};
	Prerequisites = nil;
	Cooldown = 86400;
	Npc = "Barakkulf";
}
local tbl_39 = {
	Name = "Getting to Forgotten Kingdom";
	Description = "Meet with Sensei Moro in Forgotten Kingdom.";
	AutoComplete = true;
}
local tbl_16 = {}
local tbl_8 = {
	Type = "Talk";
	Target = "Sensei Moro 2";
	Description = "Talk to 'Sensei Moro'.";
}
local Sensei_Moro_2 = Proximity:FindFirstChild("Sensei Moro 2")
if Sensei_Moro_2 then
	Sensei_Moro_2 = Proximity:FindFirstChild("Sensei Moro 2").PrimaryPart
end
tbl_8.Marker = Sensei_Moro_2
tbl_8.MarkerWaitForQuest = true
tbl_8.BeamTarget = require(script:WaitForChild("ActivateSenseiMoro2Path")).Activate
tbl_16[1] = tbl_8
tbl_39.Objectives = tbl_16
tbl_39.Rewards = {
	XP = 250;
	Gold = 750;
}
tbl_39.Prerequisites = nil
tbl_39.Npc = "Sensei Moro 2"
module.Island2Quest0 = tbl_39
local tbl_18 = {
	Name = "New Island!";
	Description = "Deliver the boxes to 'Captain Rowan'.";
	AutoComplete = true;
}
local tbl_5 = {}
local tbl_10 = {
	Type = "Talk";
	Target = "Captain Rowan";
}
local Captain_Rowan = Proximity:FindFirstChild("Captain Rowan")
if Captain_Rowan then
	Captain_Rowan = Proximity:FindFirstChild("Captain Rowan").PrimaryPart
end
tbl_10.Marker = Captain_Rowan
tbl_10.MarkerWaitForQuest = true
tbl_10.BeamTarget = require(script:WaitForChild("ActivateCaptainRowanPath")).Activate
tbl_5[1] = tbl_10
tbl_18.Objectives = tbl_5
tbl_18.Rewards = {
	XP = 1250;
	Gold = 1500;
}
tbl_18.Prerequisites = nil
tbl_18.Npc = "Sensei Moro 2"
local tbl_55 = {
	StartedFunction = function() -- Line 530, Named "StartedFunction"
		--[[ Upvalues[1]:
			[1]: ReplicatedStorage_upvr (readonly)
		]]
		task.spawn(function() -- Line 531
			--[[ Upvalues[1]:
				[1]: ReplicatedStorage_upvr (copied, readonly)
			]]
			local Character = game.Players.LocalPlayer.Character
			if not Character then
				Character = game.Players.LocalPlayer.CharacterAdded:Wait()
			end
			if Character:FindFirstChild("DeliveryBox") then
			else
				local clone = ReplicatedStorage_upvr.Assets.QuestAssets.DeliveryBox:Clone()
				clone.Parent = Character
				clone.PrimaryPart.Weld.Part1 = Character:WaitForChild("Torso")
			end
		end)
	end;
}
local function FinishedFunction() -- Line 544
	local Character_2 = game.Players.LocalPlayer.Character
	if not Character_2 then
		Character_2 = game.Players.LocalPlayer.CharacterAdded:Wait()
	end
	if Character_2:FindFirstChild("DeliveryBox") then
		Character_2.DeliveryBox:Destroy()
	end
end
tbl_55.FinishedFunction = FinishedFunction
tbl_18.StateFunctions = tbl_55
module.Island2Quest1 = tbl_18
module.Island2Quest2 = {
	Name = "Sensei Moro 2";
	Description = "Mine Rocks and bring Cobalt.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Cobalt";
		Amount = 3;
	}, {
		Type = "Mine";
		Target = "Basalt Rock";
		Amount = 10;
	}};
	Rewards = {
		XP = 500;
		Gold = 2500;
		Quest = "Island2Quest3";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest3 = {
	Name = "Sensei Moro 3";
	Description = "Bring more rare ores.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Titanium";
		Amount = 5;
	}, {
		Type = "Collect";
		Target = "Lapis Lazuli";
		Amount = 3;
	}, {
		Type = "Mine";
		Target = "Basalt Rock";
		Amount = 25;
	}};
	Rewards = {
		XP = 1000;
		Gold = 4500;
		Quest = "Island2Quest4";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest4 = {
	Name = "Sensei Moro 4";
	Description = "The path of the true forger";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Quartz";
		Amount = 5;
	}, {
		Type = "Collect";
		Target = "Amethyst";
		Amount = 5;
	}, {
		Type = "Collect";
		Target = "Topaz";
		Amount = 5;
	}, {
		Type = "Mine";
		Target = "Basalt Rock";
		Amount = 35;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 25;
	}};
	Rewards = {
		XP = 1750;
		Gold = 5500;
		Quest = "Island2Quest5";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest5 = {
	Name = "Sensei Moro 5";
	Description = "Epic Ores requires epic work.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Diamond";
		Amount = 3;
	}, {
		Type = "Collect";
		Target = "Sapphire";
		Amount = 3;
	}, {
		Type = "Mine";
		Target = "Basalt Rock";
		Amount = 25;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 40;
	}};
	Rewards = {
		XP = 2350;
		Gold = 6500;
		Quest = "Island2Quest6";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest6 = {
	Name = "Sensei Moro 6";
	Description = "Bigger the rocks, rarer the ores.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Cuprite";
		Amount = 2;
	}, {
		Type = "Collect";
		Target = "Emerald";
		Amount = 2;
	}, {
		Type = "Collect";
		Target = "Eye Ore";
		Amount = 1;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 25;
	}, {
		Type = "Mine";
		Target = "Basalt Vein";
		Amount = 5;
	}};
	Rewards = {
		XP = 3250;
		Gold = 7500;
		Quest = "Island2Quest7";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest7 = {
	Name = "Sensei Moro 7";
	Description = "Moro needs more ores.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Ruby";
		Amount = 3;
	}, {
		Type = "Collect";
		Target = "Rivalite";
		Amount = 2;
	}, {
		Type = "Collect";
		Target = "Uranium";
		Amount = 1;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 30;
	}, {
		Type = "Mine";
		Target = "Basalt Vein";
		Amount = 15;
	}};
	Rewards = {
		XP = 4750;
		Gold = 8500;
		Quest = "Island2Quest8";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest8 = {
	Name = "Sensei Moro 8";
	Description = "Mine the core of the earth and the gate of inferno.";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Mythril";
		Amount = 5;
	}, {
		Type = "Collect";
		Target = "Lightite";
		Amount = 1;
	}, {
		Type = "Mine";
		Target = "Basalt Vein";
		Amount = 15;
	}, {
		Type = "Mine";
		Target = "Volcanic Rock";
		Amount = 5;
	}};
	Rewards = {
		XP = 5500;
		Gold = 9500;
		Quest = "Island2Quest9";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2Quest9 = {
	Name = "Sensei Moro 9";
	Description = "Mine the deepest parts of the Volcanic Dpeth";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Volcanic Rock";
		Amount = 15;
	}, {
		Type = "Collect";
		Target = "Obsidian";
		Amount = 5;
	}, {
		Type = "Mine";
		Target = "Basalt Vein";
		Amount = 50;
	}, {
		Type = "Mine";
		Target = "Volcanic Rock";
		Amount = 25;
	}};
	Rewards = {
		XP = 7500;
		Gold = 12500;
		Quest = "Island2QuestFinal";
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2QuestFinal = {
	Name = "Sensei Moro Final";
	Description = "Find the rarest ores to the forge!";
	AutoComplete = true;
	Objectives = {{
		Type = "Collect";
		Target = "Fireite";
		Amount = 3;
	}, {
		Type = "Collect";
		Target = "Magmaite";
		Amount = 2;
	}, {
		Type = "Collect";
		Target = "Demonite";
		Amount = 1;
	}, {
		Type = "Collect";
		Target = "Darkryte";
		Amount = 1;
	}, {
		Type = "Mine";
		Target = "Basalt Core";
		Amount = 125;
	}, {
		Type = "Mine";
		Target = "Basalt Vein";
		Amount = 75;
	}, {
		Type = "Mine";
		Target = "Volcanic Rock";
		Amount = 50;
	}};
	Rewards = {
		XP = 10000;
		Gold = 25000;
		Spins = 1;
	};
	Prerequisites = nil;
	Npc = "Sensei Moro 2";
}
module.Island2SideQuestIsaac = {
	Name = "Cure for Isaac";
	Description = "Isaac needs your help.";
	AutoComplete = true;
	Objectives = {{
		Type = "Extra";
		Target = "None";
		Description = "Bring 1 'Health Potion' to Isaac.";
	}};
	Rewards = {
		XP = 1000;
		Badge = "CureForIsaac";
	};
	Prerequisites = nil;
	Npc = "Isaac";
	StateFunctions = {
		FinishedFunction = function() -- Line 744, Named "FinishedFunction"
			local Isaac = workspace.Proximity:FindFirstChild("Isaac")
			if Isaac then
				if Isaac:FindFirstChild("Bandage") and Isaac.Bandage:FindFirstChild("Handle") then
					Isaac.Bandage.Handle.Transparency = 1
				end
				if Isaac:FindFirstChild("Bandage2") and Isaac.Bandage:FindFirstChild("Handle") then
					Isaac.Bandage2.Handle.Transparency = 1
				end
			end
		end;
	};
}
module.Island2SideQuestLine = {
	Name = "Line's Needs";
	Description = "Line needs special ores for a potion recipe.";
	AutoComplete = true;
	Objectives = {{
		Type = "Extra";
		Target = "None";
		Description = "Bring 3 Fireite to Line.";
	}};
	Rewards = {
		XP = 3500;
		Badge = "YouPassedLinesStandards";
	};
	Prerequisites = nil;
	Npc = "Link";
	StateFunctions = {};
}
module.MonkeQuest = {
	Name = "Monke need Bananite";
	Description = "Monke is hungry, find some food for it.";
	AutoComplete = true;
	Objectives = {{
		Type = "Extra";
		Target = "None";
		Description = "Bring Monke 30 bananite";
	}};
	Rewards = {
		XP = 5000;
		Gold = 10000;
		Badge = "MonkeBusiness";
	};
	Prerequisites = nil;
	Npc = "Monke";
	StateFunctions = {};
}
local tbl_37 = {
	Name = "Goblin King 1";
	Description = "Give items to 'Goblin King'.";
	AutoComplete = true;
}
local tbl_4 = {}
local tbl_51 = {
	Type = "Extra";
	Target = "Goblin King";
	Description = "Bring 5000 gold.";
}
local Goblin_King_5 = Proximity:FindFirstChild("Goblin King")
if Goblin_King_5 then
	Goblin_King_5 = Proximity:FindFirstChild("Goblin King").PrimaryPart
end
tbl_51.Marker = Goblin_King_5
tbl_51.MarkerWaitForQuest = true
tbl_4[1] = tbl_51
tbl_37.Objectives = tbl_4
tbl_37.Rewards = {
	XP = 1000;
	Quest = "GoblinKingQuest2";
}
tbl_37.Prerequisites = nil
tbl_37.Npc = "Goblin King"
module.GoblinKingQuest1 = tbl_37
local tbl_15 = {
	Name = "Goblin King 2";
	Description = "Give items to 'Goblin King'.";
	AutoComplete = true;
}
local tbl_3 = {}
local tbl_46 = {
	Type = "Extra";
	Target = "Goblin King";
	Description = "Bring 3 Topaz and 10000 gold.";
}
local Goblin_King = Proximity:FindFirstChild("Goblin King")
if Goblin_King then
	Goblin_King = Proximity:FindFirstChild("Goblin King").PrimaryPart
end
tbl_46.Marker = Goblin_King
tbl_46.MarkerWaitForQuest = true
tbl_3[1] = tbl_46
tbl_15.Objectives = tbl_3
tbl_15.Rewards = {
	XP = 1500;
	Quest = "GoblinKingQuest3";
}
tbl_15.Prerequisites = nil
tbl_15.Npc = "Goblin King"
module.GoblinKingQuest2 = tbl_15
local tbl_45 = {
	Name = "Goblin King 3";
	Description = "Give items to 'Goblin King'.";
	AutoComplete = true;
}
local tbl_21 = {}
local tbl_6 = {
	Type = "Extra";
	Target = "Goblin King";
	Description = "Bring 5 Diamond and 15000 gold.";
}
local Goblin_King_3 = Proximity:FindFirstChild("Goblin King")
if Goblin_King_3 then
	Goblin_King_3 = Proximity:FindFirstChild("Goblin King").PrimaryPart
end
tbl_6.Marker = Goblin_King_3
tbl_6.MarkerWaitForQuest = true
tbl_21[1] = tbl_6
tbl_45.Objectives = tbl_21
tbl_45.Rewards = {
	XP = 2500;
	Quest = "GoblinKingQuest4";
}
tbl_45.Prerequisites = nil
tbl_45.Npc = "Goblin King"
module.GoblinKingQuest3 = tbl_45
local tbl_48 = {
	Name = "Goblin King 4";
	Description = "Give items to 'Goblin King'.";
	AutoComplete = true;
}
local tbl_44 = {}
local tbl_2 = {
	Type = "Extra";
	Target = "Goblin King";
	Description = "Bring 5 Emerald and 20000 gold.";
}
local Goblin_King_2 = Proximity:FindFirstChild("Goblin King")
if Goblin_King_2 then
	Goblin_King_2 = Proximity:FindFirstChild("Goblin King").PrimaryPart
end
tbl_2.Marker = Goblin_King_2
tbl_2.MarkerWaitForQuest = true
tbl_44[1] = tbl_2
tbl_48.Objectives = tbl_44
tbl_48.Rewards = {
	XP = 4500;
	Quest = "GoblinKingQuestFinal";
}
tbl_48.Prerequisites = nil
tbl_48.Npc = "Goblin King"
module.GoblinKingQuest4 = tbl_48
local tbl_13 = {
	Name = "Let's get over it!";
	Description = "Give last items to 'Goblin King'.";
	AutoComplete = true;
}
local tbl_12 = {}
local tbl_57 = {
	Type = "Extra";
	Target = "Goblin King";
	Description = "Bring 5 Ruby and 25000 gold.";
}
local Goblin_King_4 = Proximity:FindFirstChild("Goblin King")
if Goblin_King_4 then
	Goblin_King_4 = Proximity:FindFirstChild("Goblin King").PrimaryPart
end
tbl_57.Marker = Goblin_King_4
tbl_57.MarkerWaitForQuest = true
tbl_12[1] = tbl_57
tbl_13.Objectives = tbl_12
tbl_13.Rewards = {
	XP = 7500;
	Badge = "ScammedByTheKing";
}
tbl_13.Prerequisites = nil
tbl_13.Npc = "Goblin King"
tbl_13.StateFunctions = {
	FinishedFunction = tbl_47.GoblinKingQuestFinal.FinishedFunction;
}
module.GoblinKingQuestFinal = tbl_13
local tbl_42 = {
	Name = "Lost Cat :(";
	Description = "Find Tomo's Cat.";
	AutoComplete = true;
}
local tbl_41 = {}
local tbl_25 = {
	Type = "Extra";
	Target = "Tomo";
	Description = "Bring the Cat.";
}
local Tomo = Proximity:FindFirstChild("Tomo")
if Tomo then
	Tomo = Proximity:FindFirstChild("Tomo").PrimaryPart
end
tbl_25.Marker = Tomo
tbl_25.MarkerWaitForQuest = true
tbl_41[1] = tbl_25
tbl_42.Objectives = tbl_41
tbl_42.Rewards = {
	XP = 7500;
	Gold = 12500;
	Title = "CatLover";
	Badge = "ProfessionalRescuer";
}
tbl_42.Prerequisites = nil
tbl_42.Npc = "Tomo"
tbl_42.StateFunctions = {
	NotStartedFunction = tbl_47.TomoQuest.NotStartedFunction;
	StartedFunction = tbl_47.TomoQuest.StartedFunction;
	FinishedFunction = tbl_47.TomoQuest.FinishedFunction;
}
module.TomoQuest = tbl_42
module.CaptainRowanQuest1 = {
	Name = "Captain Rowan 1";
	Description = "Help captain to save the town.";
	Objectives = {{
		Type = "Kill";
		Target = "Skeleton Rogue";
		Amount = 10;
	}};
	Rewards = {
		XP = 500;
		Gold = 1250;
		Quest = "CaptainRowanQuest2";
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
module.CaptainRowanQuest2 = {
	Name = "Captain Rowan 2";
	Description = "Defeat undead enemies of the Forgotten Cave.";
	Objectives = {{
		Type = "Kill";
		Target = "Skeleton Rogue";
		Amount = 15;
	}, {
		Type = "Kill";
		Target = "Axe Skeleton";
		Amount = 5;
	}};
	Rewards = {
		XP = 1250;
		Gold = 2500;
		Quest = "CaptainRowanQuest3";
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
module.CaptainRowanQuest3 = {
	Name = "Captain Rowan 3";
	Description = "High risk = High reward";
	AutoComplete = true;
	Objectives = {{
		Type = "Kill";
		Target = "Skeleton Rogue";
		Amount = 35;
	}, {
		Type = "Kill";
		Target = "Axe Skeleton";
		Amount = 15;
	}, {
		Type = "Kill";
		Target = "Deathaxe Skeleton";
		Amount = 5;
	}, {
		Type = "Extra";
		Target = "Eye Ore";
		Description = "Bring 1 Eye Ore.";
	}};
	Rewards = {
		XP = 2250;
		Gold = 5750;
		Quest = "CaptainRowanQuest4";
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
module.CaptainRowanQuest4 = {
	Name = "Captain Rowan 4";
	Description = "It gets hotter down there.";
	Objectives = {{
		Type = "Kill";
		Target = "Axe Skeleton";
		Amount = 35;
	}, {
		Type = "Kill";
		Target = "Deathaxe Skeleton";
		Amount = 45;
	}, {
		Type = "Kill";
		Target = "Elite Rogue Skeleton";
		Amount = 10;
	}, {
		Type = "Kill";
		Target = "Elite Deathaxe Skeleton";
		Amount = 1;
	}};
	Rewards = {
		XP = 4250;
		Gold = 9500;
		Quest = "CaptainRowanQuest5";
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
module.CaptainRowanQuest5 = {
	Name = "Captain Rowan 5";
	Description = "Help captain to clear out the Volcanic Depths.";
	Objectives = {{
		Type = "Kill";
		Target = "Elite Rogue Skeleton";
		Amount = 35;
	}, {
		Type = "Kill";
		Target = "Elite Deathaxe Skeleton";
		Amount = 25;
	}, {
		Type = "Kill";
		Target = "Blazing Slime";
		Amount = 5;
	}};
	Rewards = {
		XP = 6500;
		Gold = 14500;
		Quest = "CaptainRowanQuestFinal";
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
module.CaptainRowanQuestFinal = {
	Name = "Captain Rowan Final";
	Description = "Captain's last task, you're a true hero.";
	AutoComplete = true;
	Objectives = {{
		Type = "Kill";
		Target = "Elite Rogue Skeleton";
		Amount = 50;
	}, {
		Type = "Kill";
		Target = "Elite Deathaxe Skeleton";
		Amount = 40;
	}, {
		Type = "Kill";
		Target = "Blazing Slime";
		Amount = 25;
	}, {
		Type = "Kill";
		Target = "Reaper";
		Amount = 5;
	}, {
		Type = "Extra";
		Target = "Epic Essence";
		Description = "Bring 30 Epic Essence.";
	}};
	Rewards = {
		XP = 12500;
		Gold = 25500;
		Spins = 1;
	};
	Prerequisites = nil;
	Npc = "Captain Rowan";
}
local tbl_27 = {
	Name = "Demonite Key";
	Description = "Bring in what 'Skal' asked for.";
	AutoComplete = true;
}
local tbl_32 = {}
local tbl_31 = {
	Type = "Extra";
	Target = "Skal";
	Description = "Bring 3 Demonites.";
}
local Skal = Proximity:FindFirstChild("Skal")
if Skal then
	Skal = Proximity:FindFirstChild("Skal").PrimaryPart
end
tbl_31.Marker = Skal
tbl_31.MarkerWaitForQuest = true
tbl_32[1] = tbl_31
tbl_27.Objectives = tbl_32
tbl_27.Rewards = {
	XP = 500;
	Gold = 1250;
}
tbl_27.Prerequisites = nil
tbl_27.Npc = "Skal"
tbl_27.StateFunctions = {
	FinishedFunction = tbl_47.SkalQuest.FinishedFunction;
}
module.SkalQuest = tbl_27
return module
