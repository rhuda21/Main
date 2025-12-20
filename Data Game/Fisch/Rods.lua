local Rods = {
  {
    Name = "Necrotic Rod",
    Price = inf,
    Description = "Only obtainable during FischFright;
A rod infused with necrotic energy that saps the life from its prey, reeling in fish as their vitality withers away.",
    Stats = {
      Luck = 143,
      LureSpeed = 18,
      Strength = 400000,
      LineDistance = 50,
      Resilience = 66,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.13"
  },
  {
    Name = "Developers Rod",
    Price = inf,
    Description = "A rod made for developers not to have to suffer in fishing.",
    Stats = {
      Luck = 150,
      LureSpeed = 99,
      Strength = inf,
      LineDistance = 150,
      Resilience = 99,
      Control = 1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Dead Man's Rod",
    Price = inf,
    Description = "A rod possessed by the soul of Davy Jones [Developer Rod, for @Johnny_D3pp]",
    Stats = {
      Luck = 300,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 150,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Frost Warden Rod",
    Price = inf,
    Description = "A frigid rod wielded by fierce anglers. Built to fish in the coldest of waters.",
    Stats = {
      Luck = 45,
      LureSpeed = 90,
      Strength = 2200,
      LineDistance = 22,
      Resilience = 15,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Mystic Staff",
    Price = inf,
    Description = "A powerful staff once held by a mysterious witch who disappeared without a trace... Strangely, its magic seems to attract fish.",
    Stats = {
      Luck = 100,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 30,
      Control = 0.4
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Riptide Rod",
    Price = inf,
    Description = "The Riptide Rod fills its Tide Meter by 1/3 with each Perfect Catch. At max, it enters `High Tide` for 5 casts. This will boost Luck by 30%, & Lure Speed by 25%.",
    Stats = {
      Luck = 100,
      LureSpeed = 40,
      Strength = 3500,
      LineDistance = 50,
      Resilience = 20,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "HighTide"
  },
  {
    Name = "Original No-Life Rod",
    Price = 1,
    Description = "Fisching 24/7/365. Are you okay?",
    Stats = {
      Luck = 100,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "OriginalNoLifeRod"
  },
  {
    Name = "Courage Bat",
    Price = inf,
    Description = "cat ur dumb",
    Stats = {
      Luck = 150,
      LureSpeed = 35,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Scarlet Ravager",
    Price = inf,
    Description = "Forged in fury, this rod tears through the depths like a blade soaked in blood. [TOY-EXCLUSIVE]",
    Stats = {
      Luck = 125,
      LureSpeed = 10,
      Strength = 125000,
      LineDistance = 100,
      Resilience = 20,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.2"
  },
  {
    Name = "Tryhard Rod",
    Price = inf,
    Description = "Every cast is a challenge. Every catch, a victory. -RoReddo [Controlled/Herculean Enchant REQUIRED]",
    Stats = {
      Luck = 999,
      LureSpeed = 20,
      Strength = 999999999999999,
      LineDistance = 150,
      Resilience = -500,
      Control = -0.37
    },
    From = "",
    Worlds = {},
    Passive = "TryhardRod",
    ProgressEfficiency = "3"
  },
  {
    Name = "Bat Whisperer Rod",
    Price = inf,
    Description = "Only obtainable during FischFright;
A cursed rod that summons swarms of bats to snatch fish from the water; their numbers multiplying under unknown conditions...",
    Stats = {
      Luck = 96,
      LureSpeed = 14,
      Strength = 200000,
      LineDistance = 45,
      Resilience = 30,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "Bat Whisperer",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Cinderstring",
    Price = inf,
    Description = "We feel the pain of a lifetime lost in a thousand days...",
    Stats = {
      Luck = 175,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 200,
      Resilience = 70,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "Cinderstring",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Adventurer's Rod",
    Price = 0,
    Description = "It has a feeble, yet strangely familiar feel... Has a 5% chance to equally grant any natural mutation.",
    Stats = {
      Luck = 50,
      LureSpeed = 40,
      Strength = 104,
      LineDistance = 19,
      Resilience = 15,
      Control = 0
    },
    From = "Waveborne",
    Worlds = {},
    Passive = "AdventurersRod"
  },
  {
    Name = "Rose Rend",
    Price = inf,
    Description = "A thorn-kissed weapon that strikes with the elegance & cruelty of a wilting rose. [TOY-EXCLUSIVE]",
    Stats = {
      Luck = 115,
      LureSpeed = 15,
      Strength = 100000,
      LineDistance = 100,
      Resilience = 15,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Elder Mossripper",
    Price = inf,
    Description = "Ancient fangs lash at the hooked, forcing weight to rise by 45%. With a 20% rate for Shrouded, and 5% for Moss; the lurking Mossjaw waits to strike...",
    Stats = {
      Luck = 215,
      LureSpeed = 10,
      Strength = inf,
      LineDistance = 125,
      Resilience = 50,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "ElderMossripper",
    ProgressEfficiency = "0.3"
  },
  {
    Name = "Frostbane Rod",
    Price = 1500000,
    Description = "An unwieldy blade laced with frost magic, its true power dormant; until the darkest cold deepens, unlocking a surge of strength few can withstand.",
    Stats = {
      Luck = 85,
      LureSpeed = 20,
      Strength = 1500,
      LineDistance = 40,
      Resilience = 35,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "FrostbaneRod"
  },
  {
    Name = "Training Rod",
    Price = 300,
    Description = "Handy fishing rod for honing your fishing skills. Remember, stay calm.",
    Stats = {
      Luck = -70,
      LureSpeed = 90,
      Strength = 9,
      LineDistance = 20,
      Resilience = 20,
      Control = 0.2
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "???",
    Price = inf,
    Description = "a hot, presumably super-sharp blade of 67 [Admin Rod, for @yvlyf]",
    Stats = {
      Luck = 150,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 8623,
      Resilience = 40,
      Control = 0.35
    },
    From = "",
    Worlds = {},
    Passive = "???"
  },
  {
    Name = "Lobster Rod",
    Price = inf,
    Description = "As tough as a lobster's shell, built to withstand immense force. Has a 30% chance to apply the Lobster mutation.",
    Stats = {
      Luck = 110,
      LureSpeed = 40,
      Strength = 50000,
      LineDistance = 20,
      Resilience = 10,
      Control = 0.3
    },
    From = "Isle of New Beginnings",
    Worlds = {},
    Passive = "Lobster"
  },
  {
    Name = "Executive Rod",
    Price = inf,
    Description = "Game development is truly difficult..",
    Stats = {
      Luck = 0,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 0,
      Control = 0.4
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Voyager Rod",
    Price = inf,
    Description = "A rod forged by an ancient civilization, capable of mass destruction. All fish have a 35% chance to be fossilized. [Lasers fish with an orbital cannon].",
    Stats = {
      Luck = 85,
      LureSpeed = 55,
      Strength = 300000,
      LineDistance = 60,
      Resilience = 20,
      Control = 0.08
    },
    From = "",
    Worlds = {},
    Passive = "VoyagerRod"
  },
  {
    Name = "Smurf Rod",
    Price = inf,
    Description = "Smurf-themed rod with a smiling head and mushroom details. Cute and magical!",
    Stats = {
      Luck = 80,
      LureSpeed = 85,
      Strength = 200,
      LineDistance = 15,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Smurf"
  },
  {
    Name = "Fabulous Rod",
    Price = inf,
    Description = "As fabulous as possible! Actually, even more than that. [For @GreenResolve]",
    Stats = {
      Luck = 500,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 100,
      Resilience = 50,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "FabulousRod"
  },
  {
    Name = "Avalanche Rod",
    Price = 35000,
    Description = "A sleek rod with an icy blue spiral design and glowing blue accents, has a 25% chance for fish to be covered in Sleet.",
    Stats = {
      Luck = 68,
      LureSpeed = 60,
      Strength = 65000,
      LineDistance = 70,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "AvalancheRod"
  },
  {
    Name = "No-Life Rod",
    Price = inf,
    Description = "Fisching 24/7/365. Are you okay?",
    Stats = {
      Luck = 105,
      LureSpeed = 10,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.23
    },
    From = "",
    Worlds = {},
    Passive = "NoLifeRod"
  },
  {
    Name = "Event Horizon Rod",
    Price = inf,
    Description = "The powerful black hole within this rod decimates everything in its path. All fish have a 5% chance to be Lunar.",
    Stats = {
      Luck = 30,
      LureSpeed = 90,
      Strength = 1000,
      LineDistance = 20,
      Resilience = 5,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Peppermint Rod",
    Price = inf,
    Description = "Only obtainable during Fischmas;
A candy cane radiating icy cheer. All fish have a 25% chance to be Peppermint.",
    Stats = {
      Luck = 50,
      LureSpeed = -250,
      Strength = 10000,
      LineDistance = 20,
      Resilience = 12,
      Control = 0.12
    },
    From = "",
    Worlds = {},
    Passive = "PeppermintRod"
  },
  {
    Name = "Plastic Rod",
    Price = 750,
    Description = "Made of ABS plastic; You can trust this rod will last you.",
    Stats = {
      Luck = 15,
      LureSpeed = 80,
      Strength = 100,
      LineDistance = 15,
      Resilience = 10,
      Control = 0
    },
    From = "Moosewood",
    Worlds = {}
  },
  {
    Name = "Magnet Rod",
    Price = 15000,
    Description = "This rod has an advanced magnetic field, allowing it to quickly attract crates and loot.",
    Stats = {
      Luck = 0,
      LureSpeed = 110,
      Strength = 10000,
      LineDistance = 21,
      Resilience = 0,
      Control = 0.05
    },
    From = "Terrapin",
    Worlds = {}
  },
  {
    Name = "Magma Rod",
    Price = inf,
    Description = "Hot to the touch. Engulfed with a constant burning passion to fish. [Capable of fishing in lava, 35% chance for fish to become mutated with Ember]",
    Stats = {
      Luck = 55,
      LureSpeed = 55,
      Strength = 1200,
      LineDistance = 32,
      Resilience = 0,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "MagmaRod"
  },
  {
    Name = "Nates Blade",
    Price = inf,
    Description = "A sword wielded by the oneand only Nate The human. Created by Nates father, out of Kee-Oths Blood. [For @Woozynate]",
    Stats = {
      Luck = 444,
      LureSpeed = -19,
      Strength = inf,
      LineDistance = 444,
      Resilience = 44,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "BloodSword",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Illumina",
    Price = inf,
    Description = "Telamon's favorite weapon from Sword Fight on the Heights. It is light, agile, and deadly.",
    Stats = {
      Luck = 1000,
      LureSpeed = -900,
      Strength = inf,
      LineDistance = 1000,
      Resilience = 1000,
      Control = 1
    },
    From = "",
    Worlds = {},
    Passive = "Illumina",
    ProgressEfficiency = "10"
  },
  {
    Name = "ReRod",
    Price = inf,
    Description = "my mom keeps calling me ReRod :d [For @RoReddo]",
    Stats = {
      Luck = 2525.252525,
      LureSpeed = -2425.252525,
      Strength = 2525252525,
      LineDistance = 2525,
      Resilience = 25.25252525,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "ReRod"
  },
  {
    Name = "Rapid Rod",
    Price = 12000,
    Description = "Extremely fast rod that catches fish at record speeds! -It even has racing wings!",
    Stats = {
      Luck = 49,
      LureSpeed = 11,
      Strength = 800,
      LineDistance = 21,
      Resilience = 9,
      Control = 0
    },
    From = "Roslit",
    Worlds = {}
  },
  {
    Name = "Sunken Rod",
    Price = inf,
    Description = "An ancient, coral-encrusted rod found in shipwreck depths, radiating faint power to lure rare fish. Every 10 catches, gain a 25% higher chance to pull up a Treasure Map! All fish have a 8% chance to be Sunken.",
    Stats = {
      Luck = 150,
      LureSpeed = 50,
      Strength = 25000,
      LineDistance = 60,
      Resilience = 15,
      Control = 0.15
    },
    From = "Forsaken Shores",
    Worlds = {},
    Passive = "SunkenRod"
  },
  {
    Name = "Vineweaver Rod",
    Price = inf,
    Description = "Vines twist across the line, halting prey in its tracks. In the last 30%, the fish is bound, with a 30% chance of gaining a Vined form. [+10% Forced Progress Speed]",
    Stats = {
      Luck = 117,
      LureSpeed = 20,
      Strength = 50000,
      LineDistance = 15,
      Resilience = 40,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Vineweaver"
  },
  {
    Name = "Patience Rod",
    Price = inf,
    Description = "Endure the wait or catch nothing. -RoReddo",
    Stats = {
      Luck = 25,
      LureSpeed = 2525,
      Strength = 252525252525,
      LineDistance = 150,
      Resilience = 252525,
      Control = 0.95
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Fast Rod",
    Price = 4000,
    Description = "Quick rod that seems to catch fish in a fly! You can tell it's fast from the racing stripes.",
    Stats = {
      Luck = 10,
      LureSpeed = 30,
      Strength = 175,
      LineDistance = 20,
      Resilience = -5,
      Control = 0.05
    },
    From = "Moosewood",
    Worlds = {}
  },
  {
    Name = "CocoRod",
    Price = inf,
    Description = "The Coco-nut-nut is a giant nut. [For @Goober_ish]",
    Stats = {
      Luck = 250,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.65
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Firework Rod",
    Price = 35000,
    Description = "A rod imbued with festive magic. 15% chance for Firework Mutation (3.5x sell price). Reduces whale progress speed by 20% and gives a +0.2% whale encounter rate.",
    Stats = {
      Luck = 45,
      LureSpeed = 65,
      Strength = 25000,
      LineDistance = 100,
      Resilience = 15,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "FireworkRod"
  },
  {
    Name = "The Twig",
    Price = inf,
    Description = "I think it genuinely may break in two. [WoozyNate Only]",
    Stats = {
      Luck = 300,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 50,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Silly Fun Happy Rod",
    Price = inf,
    Description = ":P
[@newandreformedlyth]",
    Stats = {
      Luck = 250,
      LureSpeed = -inf,
      Strength = inf,
      LineDistance = inf,
      Resilience = inf,
      Control = -0.01
    },
    From = "",
    Worlds = {},
    Passive = "SillyFunHappyRod",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Rod Of The Exalted One",
    Price = inf,
    Description = "Originally created for the most magnificent royals, was lost in time and sealed away. Exalted Relics now have a 4x higher chance to be caught.",
    Stats = {
      Luck = 170,
      LureSpeed = 45,
      Strength = 57000,
      LineDistance = 70,
      Resilience = 20,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Clickbait Caster",
    Price = inf,
    Description = "Lights, camera, action—now bite already! [CC Only]",
    Stats = {
      Luck = 225,
      LureSpeed = 50,
      Strength = inf,
      LineDistance = 70,
      Resilience = 30,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "ContentCreatorEntity"
  },
  {
    Name = "Polaris Serenade",
    Price = inf,
    Description = "💫",
    Stats = {
      Luck = 400,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 250,
      Resilience = 40,
      Control = 0.4
    },
    From = "",
    Worlds = {},
    Passive = "ButterflyEntity",
    ProgressEfficiency = "0.3"
  },
  {
    Name = "Dusekkar Rod",
    Price = inf,
    Description = "Only obtainable during FischFright;
Haunted by the fireless spirit of Matt Dusek; this rod is haunted with a spectral blaze...",
    Stats = {
      Luck = 166,
      LureSpeed = 20,
      Strength = 700000,
      LineDistance = 30,
      Resilience = 80,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.25"
  },
  {
    Name = "Fischer's Rod",
    Price = inf,
    Description = "A fischer's starter rod to get started with Fisching! What else would you do with it?..",
    Stats = {
      Luck = 10,
      LureSpeed = 90,
      Strength = 100,
      LineDistance = 20,
      Resilience = 5,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Wind Elemental",
    Price = inf,
    Description = "May you slash with all the colors of the wind.",
    Stats = {
      Luck = 555,
      LureSpeed = -455,
      Strength = inf,
      LineDistance = 555,
      Resilience = 55,
      Control = 0.055
    },
    From = "",
    Worlds = {},
    Passive = "WindElemental"
  },
  {
    Name = "Paper Fan Rod",
    Price = 70000,
    Description = "Only obtainable during Fischfest; 
A lightweight paper fan rod that slices through the water, striking fish with swift, cutting blows.",
    Stats = {
      Luck = 75,
      LureSpeed = 30,
      Strength = 1500,
      LineDistance = 30,
      Resilience = 10,
      Control = -0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Dreambreaker",
    Price = inf,
    Description = "A rod born of torment and twilight, empowering night fishing with violent surges and larger prey; but twisting the mind with slower progress and unpredictable control.",
    Stats = {
      Luck = 215,
      LureSpeed = -20,
      Strength = inf,
      LineDistance = 30,
      Resilience = 66,
      Control = 0.23
    },
    From = "",
    Worlds = {},
    Passive = "Dreambreaker",
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Kings Rod",
    Price = 100000,
    Description = "All fish caught are 30% bigger.",
    Stats = {
      Luck = 85,
      LureSpeed = 70,
      Strength = inf,
      LineDistance = 13,
      Resilience = 35,
      Control = 0.15
    },
    From = "Keepers Altar",
    Worlds = {},
    Passive = "KingsRod"
  },
  {
    Name = "Scarlet Spincaster Rod",
    Price = 180000,
    Description = "A rod steeped in sanguine essence, pulsing with forbidden vigor and granting a 30% chance for the Crimson mutation.",
    Stats = {
      Luck = 170,
      LureSpeed = 50,
      Strength = 250000,
      LineDistance = 30,
      Resilience = 150,
      Control = -0.2
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Volcanic Rod",
    Price = 250000,
    Description = "A rod forged in the heart of molten fury, granting a 25% chance for the Ashen Fortune mutation.",
    Stats = {
      Luck = 90,
      LureSpeed = 60,
      Strength = 50000,
      LineDistance = 70,
      Resilience = 15,
      Control = 0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "UnRegistered",
    Price = 0,
    Description = "",
    Stats = {
      Luck = 0,
      LureSpeed = 0,
      Strength = 0,
      LineDistance = 0,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Demon-Slayer",
    Price = inf,
    Description = "Designed for cutting magic with its precise edges, although ineffective as a typical sword...",
    Stats = {
      Luck = -50,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 100,
      Resilience = 70,
      Control = 0
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Nico's Yarncaster",
    Price = inf,
    Description = "a kitty who trots by your side and sneakily snags extra fish when you're not looking!
[extra power with clownfish cat toy!]",
    Stats = {
      Luck = 75,
      LureSpeed = 35,
      Strength = 10000,
      LineDistance = 100,
      Resilience = 35,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Nico's Yarncaster"
  },
  {
    Name = "Ethereal Prism Rod",
    Price = 3500000,
    Description = "A rod infused with spectral essence and alluring gems, allowing for 50% of fish to become Prismized.",
    Stats = {
      Luck = 195,
      LureSpeed = 5,
      Strength = 250000,
      LineDistance = 70,
      Resilience = 40,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "EtherealPrismRod"
  },
  {
    Name = "Poseidon Rod",
    Price = 700000,
    Description = "Blessed by the God of the Seas himself, this trident-inspired rod commands the ocean's bounty. 25% chance of receiving 75% of your fish value as a bonus. 10% chance of spawning Poseidon's ghost, giving your fish the King's Blessing mutation which boosts weight by 75-150%.",
    Stats = {
      Luck = 165,
      LureSpeed = 50,
      Strength = 100000,
      LineDistance = 65,
      Resilience = 40,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "PoseidonRod"
  },
  {
    Name = "Cornucopia Rod",
    Price = inf,
    Description = "Only obtainable during Fischgiving;
A bountiful horn-of-plenty rod that spills Fischgiving treats onto fish, making them easy pickings!",
    Stats = {
      Luck = 112.7,
      LureSpeed = 10,
      Strength = 250000,
      LineDistance = 100,
      Resilience = 75,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "Cornucopia"
  },
  {
    Name = "Friendly Rod",
    Price = inf,
    Description = "Made for friends and good times!
While playing with a friend, provides a 10% chance to catch a Friend Fish.",
    Stats = {
      Luck = 105,
      LureSpeed = 15,
      Strength = inf,
      LineDistance = 50,
      Resilience = 40,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "FriendlyPassive"
  },
  {
    Name = "Noctone",
    Price = inf,
    Description = "Wherever we end up;
Know that you've made your mark...",
    Stats = {
      Luck = 155,
      LureSpeed = 15,
      Strength = 200000,
      LineDistance = 100,
      Resilience = 65,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "Noctone"
  },
  {
    Name = "Firefly Rod",
    Price = 9500,
    Description = "Humming with energy, and a line glowing like a trail of fireflies in the night. +15% Progress Speed at Night.",
    Stats = {
      Luck = 55,
      LureSpeed = 15,
      Strength = 175,
      LineDistance = 20,
      Resilience = 25,
      Control = -0.01
    },
    From = "Waveborne",
    Worlds = {},
    Passive = "FireflyRod",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Yin Yang Rod",
    Price = inf,
    Description = "i ate a piece of bark, and got poisoned - yvlyf",
    Stats = {
      Luck = 375,
      LureSpeed = -50,
      Strength = inf,
      LineDistance = 125,
      Resilience = 75,
      Control = 0.7
    },
    From = "",
    Worlds = {},
    Passive = "TreeRod"
  },
  {
    Name = "Luminescent Oath",
    Price = 1000000,
    Description = "Forged from the radiant crystals of the Luminescent Cavern, this blade hums with sealed brilliance; its true power is seemingly forbidden from awakening...",
    Stats = {
      Luck = 100,
      LureSpeed = 15,
      Strength = 25000,
      LineDistance = 150,
      Resilience = 12,
      Control = 0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Upside-Down Rod",
    Price = 0,
    Description = "what happened!",
    Stats = {
      Luck = 0,
      LureSpeed = 100,
      Strength = 10.4,
      LineDistance = 19,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "UpsideDownRod"
  },
  {
    Name = "Part",
    Price = inf,
    Description = "Instance.new("Part",workspace)",
    Stats = {
      Luck = 0,
      LureSpeed = 100,
      Strength = inf,
      LineDistance = 5,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "Part"
  },
  {
    Name = "Egg Rod",
    Price = inf,
    Description = "Cast your bobber for a bite sweeter than chocolate!",
    Stats = {
      Luck = 75,
      LureSpeed = 25,
      Strength = 20000,
      LineDistance = 25,
      Resilience = 15,
      Control = 0.15
    },
    From = "Isle of New Beginnings",
    Worlds = {},
    Passive = "EggRod"
  },
  {
    Name = "Cerulean Fang Rod",
    Price = 800000,
    Description = "Swift as the spirits, this rod carves through the sea with rapid, cutting precision; its fangs strike fast and unrelenting.
Has a 15% chance for the Nova mutation.",
    Stats = {
      Luck = 190,
      LureSpeed = 25,
      Strength = inf,
      LineDistance = 70,
      Resilience = 35,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "CeruleanFangRod",
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Evil Pitchfork",
    Price = inf,
    Description = "Cursed by the Deep Below, this twisted trident tempts fate with unnatural fortune. 50% chance to gain 5× your fish's base value, occasionally twisting the gain. 25% chance to summon Poseidon's shade, inflicting the Siren's Spite mutation to greatly increase weight.",
    Stats = {
      Luck = 120,
      LureSpeed = -50,
      Strength = inf,
      LineDistance = 100,
      Resilience = -10,
      Control = -0.1
    },
    From = "",
    Worlds = {},
    Passive = "EvilPitchfork",
    ProgressEfficiency = "0.35"
  },
  {
    Name = "Ruinous Oath",
    Price = 5000000,
    Description = "Born from radiant crystals scorched by crimson fury, this blade blazes with unbound strength; its power no longer knows restraint...",
    Stats = {
      Luck = 500,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 150,
      Resilience = 25,
      Control = 0.08
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Spooky Rod",
    Price = inf,
    Description = "Only obtainable during FischFright;
The rod is cursed with the constant energy of FischFright, allowing it to catch FischFright mutations all year round.",
    Stats = {
      Luck = 66,
      LureSpeed = 25,
      Strength = 150000,
      LineDistance = 20,
      Resilience = -10,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "Spooky",
    ProgressEfficiency = "0.05"
  },
  {
    Name = "Bone Blade",
    Price = 0,
    Description = "🦴",
    Stats = {
      Luck = 0,
      LureSpeed = 0,
      Strength = 1000000,
      LineDistance = 999,
      Resilience = 100,
      Control = -0.2
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Stone Hammer",
    Price = inf,
    Description = "i think nick dropped this...",
    Stats = {
      Luck = 100,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = inf,
      Resilience = 0,
      Control = 0.5
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Dave Rod",
    Price = inf,
    Description = "PLSS DAVE RODDDD!",
    Stats = {
      Luck = -1500,
      LureSpeed = 1600,
      Strength = inf,
      LineDistance = 10,
      Resilience = -1500,
      Control = -0.3
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Celestial Rod",
    Price = inf,
    Description = "After catching 15 fish, summon Celestial powers for 2 minutes, granting +100% Luck & +60% Lure Speed. Caught fish also get the Celestial mutation & +50% XP on them!",
    Stats = {
      Luck = 60,
      LureSpeed = 50,
      Strength = 350000,
      LineDistance = 70,
      Resilience = 25,
      Control = 0.21
    },
    From = "",
    Worlds = {},
    Passive = "CelestialPower"
  },
  {
    Name = "Paleontologist's Rod",
    Price = inf,
    Description = "You chose Paleontologist's Rod in your Jurassic missions!",
    Stats = {
      Luck = 150,
      LureSpeed = 40,
      Strength = 5000,
      LineDistance = 30,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Jurassic"
  },
  {
    Name = "Fixer's Rod",
    Price = inf,
    Description = "You chose Fixer's Rod in your Jurassic missions!",
    Stats = {
      Luck = 60,
      LureSpeed = 40,
      Strength = 5000,
      LineDistance = 30,
      Resilience = 10,
      Control = 0.3
    },
    From = "",
    Worlds = {},
    Passive = "Jurassic"
  },
  {
    Name = "Depthseeker Rod",
    Price = 40000,
    Description = "Engineered with deep-sea technology, this resilient rod thrives in challenging conditions.",
    Stats = {
      Luck = 70,
      LureSpeed = 45,
      Strength = 70000,
      LineDistance = 50,
      Resilience = 25,
      Control = 0.17
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.05"
  },
  {
    Name = "Brick Built Rod",
    Price = inf,
    Description = "Stacked with color, packed with fun! Fish have a 5% chance to become Awesome.",
    Stats = {
      Luck = 80,
      LureSpeed = 85,
      Strength = 200,
      LineDistance = 15,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Brick Built"
  },
  {
    Name = "Azure Of Lagoon",
    Price = 100000,
    Description = "Its delicate form belies a sharp, cutting force with an almost eerie precision. All caught fish become Glossy, & has a chance to slash fish.",
    Stats = {
      Luck = 105,
      LureSpeed = 25,
      Strength = 200000,
      LineDistance = 30,
      Resilience = 55,
      Control = -0.01
    },
    From = "Azure Lagoon",
    Worlds = {},
    Passive = "AzureOfLagoon"
  },
  {
    Name = "Kraken Rod",
    Price = 950000,
    Description = "Crafted from the tentacle of an ancient Kraken, this mysterious rod pulses with dark energy. Gives you a random Legendary/Mythical/Exotic fish every 5 catches. 20% chance of giving you 2x the amount of fish.  10% chance of giving you the Tentacle Surge mutation.",
    Stats = {
      Luck = 185,
      LureSpeed = 40,
      Strength = 115000,
      LineDistance = 60,
      Resilience = 15,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "KrakenRod"
  },
  {
    Name = "Jack-o-Blazer",
    Price = inf,
    Description = "Only obtainable during FischFright;
A flame-engulfed rod wreathed in halloween-spirit, launching blazing jack-o-lanterns that explode on impact; incinerating the waters and anything daring to swim within!",
    Stats = {
      Luck = 166.6,
      LureSpeed = 4,
      Strength = inf,
      LineDistance = 80,
      Resilience = 66,
      Control = 0.16
    },
    From = "",
    Worlds = {},
    Passive = "Pumpkin",
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Abyssal Spinecaster",
    Price = inf,
    Description = "Transformed from the spine of an ancient, unnatural being. Brimming with an enigmatic aura, its glowing spikes attract the most elusive fishes. [For @nekoanims]",
    Stats = {
      Luck = 200,
      LureSpeed = 100,
      Strength = inf,
      LineDistance = inf,
      Resilience = 25,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "ShadowEntity_Raven"
  },
  {
    Name = "Eidolon Rod",
    Price = 2000000,
    Description = "A spectral rod infused with phantom energy, hastening progress and drawing forth the Phantom mutation; even completing your catch as reality begins to fade...",
    Stats = {
      Luck = 50,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 30,
      Resilience = 0,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "Eidolon",
    ProgressEfficiency = "0.4"
  },
  {
    Name = "Pinion's Aria",
    Price = inf,
    Description = "All together, resonate once more.
[for @ceIeranis]",
    Stats = {
      Luck = 342,
      LureSpeed = -42,
      Strength = inf,
      LineDistance = 342,
      Resilience = 4.2,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "PinionsAria"
  },
  {
    Name = "Fallen Snowblade",
    Price = inf,
    Description = "Wielded by a lost soul, this divine blade now conjures snow and silence—a cursed echo of his eternal search for home. It's true strength may vary relative to the current Season... [For @rDevSno]",
    Stats = {
      Luck = 319,
      LureSpeed = 25,
      Strength = 21512406,
      LineDistance = 50,
      Resilience = 15,
      Control = 0.39
    },
    From = "",
    Worlds = {},
    Passive = "FallenSnowblade",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Eardrum",
    Price = inf,
    Description = "Is there no standard anymore?",
    Stats = {
      Luck = 125,
      LureSpeed = 10,
      Strength = 100000,
      LineDistance = 100,
      Resilience = 15,
      Control = 0.3
    },
    From = "",
    Worlds = {},
    Passive = "Eardrum"
  },
  {
    Name = "Krampus's Rod",
    Price = inf,
    Description = "Haunted with the evil spirit of Krampus himself. Every 10 catches, gain a random temporary buff.",
    Stats = {
      Luck = 15,
      LureSpeed = 70,
      Strength = 50000,
      LineDistance = 40,
      Resilience = 8,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "Krampus"
  },
  {
    Name = "Chrysalis",
    Price = inf,
    Description = "🍡",
    Stats = {
      Luck = 150,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 100,
      Resilience = 100,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "Chrysalis",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Rod of the Cosmos",
    Price = inf,
    Description = "Only obtainable during Continental Drift; 
Has a 15% chance for the Nova mutation, and +50% Progress Speed during Starfall; with a chance to catch Cosmic Relics.",
    Stats = {
      Luck = 135,
      LureSpeed = 50,
      Strength = 10000,
      LineDistance = 200,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "RodOfTheCosmos"
  },
  {
    Name = "Wingripper",
    Price = inf,
    Description = "name a few dimensions we can flow between with no obstructions, another timeline.",
    Stats = {
      Luck = 222,
      LureSpeed = -122,
      Strength = inf,
      LineDistance = 222,
      Resilience = 22,
      Control = 0.22
    },
    From = "",
    Worlds = {},
    Passive = "Wingripper",
    ProgressEfficiency = "0.22"
  },
  {
    Name = "Paintbrush",
    Price = inf,
    Description = "Awarded to only the best artists of Fisch! This rod shows that you have excelled and rose above everyone else.",
    Stats = {
      Luck = 333,
      LureSpeed = -1518,
      Strength = 123456789,
      LineDistance = 150,
      Resilience = 45,
      Control = 0.123
    },
    From = "",
    Worlds = {},
    Passive = "Paintbrush",
    ProgressEfficiency = "3.14"
  },
  {
    Name = "Fortune Rod",
    Price = 11000,
    Description = "Extremely lucky rod with an odd tendency to attract significantly rarer fish than usual.",
    Stats = {
      Luck = 200,
      LureSpeed = 70,
      Strength = 3000,
      LineDistance = 20,
      Resilience = 10,
      Control = 0.05
    },
    From = "Roslit",
    Worlds = {}
  },
  {
    Name = "Rod Of The Zenith",
    Price = 1500000,
    Description = "A legendary rod that defies limits, allowing a challenge for those seeking the ultimate reward. Has a 70% chance to apply the Wrath mutation to fish.",
    Stats = {
      Luck = 145,
      LureSpeed = 15,
      Strength = 250000,
      LineDistance = 70,
      Resilience = 12,
      Control = -0.1
    },
    From = "",
    Worlds = {},
    Passive = "RodOfTheZenith"
  },
  {
    Name = "Great Rod of Oscar",
    Price = 2500000,
    Description = "A relic of the Dead Mans Tale, with a moderate boost to experience... Has a 5% chance to apply the spirits of Oscar.",
    Stats = {
      Luck = 280,
      LureSpeed = 5,
      Strength = 100000,
      LineDistance = 150,
      Resilience = 20,
      Control = 0.1
    },
    From = "Isle of New Beginnings",
    Worlds = {},
    Passive = "OscarRod",
    ProgressEfficiency = "0.3"
  },
  {
    Name = "Evil Pitchfork of Doom Rod",
    Price = inf,
    Description = "lol im evil",
    Stats = {
      Luck = 120,
      LureSpeed = 50,
      Strength = inf,
      LineDistance = 100,
      Resilience = -10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "EvilPitchforkOfDoomRod",
    ProgressEfficiency = "0.25"
  },
  {
    Name = "Sovereign Doombringer",
    Price = inf,
    Description = "Obliterate fish with a huge hammer. [Developer-Exclusive]",
    Stats = {
      Luck = 150,
      LureSpeed = 35,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Santa's Miracle Rod",
    Price = inf,
    Description = "Only obtainable during Fischmas;
A festive rod blessed by Santa himself. Fish have a 20% chance to gain the Santa mutation, a 10% chance to gain any natural Fischmas mutation, and magically spawned presents. Each catch also has a 10% chance to be magically gifted your Fischmas pals!",
    Stats = {
      Luck = 125,
      LureSpeed = -25,
      Strength = inf,
      LineDistance = 25,
      Resilience = 25,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "Santa"
  },
  {
    Name = "Resourceful Rod",
    Price = inf,
    Description = "Doubles the effects of all bait, and has a 60% chance to not consume bait, increasing the efficiency of every catch.",
    Stats = {
      Luck = 60,
      LureSpeed = 70,
      Strength = 1000,
      LineDistance = 50,
      Resilience = 10,
      Control = -0.01
    },
    From = "",
    Worlds = {},
    Passive = "2xBaits"
  },
  {
    Name = "Tidal Wave Rod",
    Price = inf,
    Description = "Only obtainable during Fischfest; 
A crashing surge of power with a 20% chance to wash your fish in Beachy style, and a small chance to infuse it with the glow of Summer!",
    Stats = {
      Luck = 65,
      LureSpeed = 50,
      Strength = 8500,
      LineDistance = 30,
      Resilience = 20,
      Control = 0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Auric Rod",
    Price = inf,
    Description = "A rod forged with many valuable gemstones. Fish caught with this rod have a random sell value between 2-4x.",
    Stats = {
      Luck = 45,
      LureSpeed = 55,
      Strength = 25000,
      LineDistance = 20,
      Resilience = 20,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Starline Caster",
    Price = inf,
    Description = "☆ this guy called rick is a nerd and made the stats some stupid cipher [For @s1mplyrick]",
    Stats = {
      Luck = 333,
      LureSpeed = -566,
      Strength = 407,
      LineDistance = 69,
      Resilience = 111,
      Control = 0.7
    },
    From = "",
    Worlds = {},
    Passive = "StarlineCaster",
    ProgressEfficiency = "7.77"
  },
  {
    Name = "Great Dreamer Rod",
    Price = 700000,
    Description = "Pulsing with energy and madness, some say the Dreamer himself occasionally awakens to seize a fish, with a 50% chance of Cursed Touch.",
    Stats = {
      Luck = 147,
      LureSpeed = 25,
      Strength = 15000,
      LineDistance = 60,
      Resilience = 17,
      Control = 0.17
    },
    From = "Cursed Isle",
    Worlds = {},
    Passive = "GreatDreamerRod"
  },
  {
    Name = "Midas Rod",
    Price = 55000,
    Description = "Blessed with the power of Midas. All caught fish will be golden.",
    Stats = {
      Luck = 79,
      LureSpeed = 30,
      Strength = 4000,
      LineDistance = 15,
      Resilience = -30,
      Control = 0.2
    },
    From = "The Travelling Merchant",
    Worlds = {},
    Passive = "MidasRod"
  },
  {
    Name = "Aurora Rod",
    Price = 70000,
    Description = "Enhanced by the Aurora Borealis' energy. All fish have a 15% chance to have the Aurora mutation.
Chances increase to 30% during the Aurora Borealis.",
    Stats = {
      Luck = 60,
      LureSpeed = 55,
      Strength = 6000,
      LineDistance = 20,
      Resilience = 16,
      Control = 0.06
    },
    From = "Vertigo",
    Worlds = {},
    Passive = "AuroraRod"
  },
  {
    Name = "Precision Rod",
    Price = inf,
    Description = "Counterpart to the Rapid Rod, with much better resilience!",
    Stats = {
      Luck = 150,
      LureSpeed = 80,
      Strength = 12000,
      LineDistance = 100,
      Resilience = 15,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Abyssal Specter Rod",
    Price = 850000,
    Description = "Forged in the darkest depths of the ocean's trenches, this spectral rod radiates an otherworldly strength. Its phantom line reaches impossible depths, while its ghostly power grants the ability to haul in catches that would snap lesser rods. All fish are 20% larger, & have a 25% chance to be Abyssal.",
    Stats = {
      Luck = 90,
      LureSpeed = 40,
      Strength = inf,
      LineDistance = 80,
      Resilience = 70,
      Control = 0.3
    },
    From = "",
    Worlds = {},
    Passive = "AbyssalSpecterRod"
  },
  {
    Name = "nilCaster",
    Price = inf,
    Description = "oops my data corrupt",
    Stats = {
      Luck = 101,
      LureSpeed = -1,
      Strength = 1010101,
      LineDistance = inf,
      Resilience = 10.1,
      Control = 0.101
    },
    From = "",
    Worlds = {},
    Passive = "nilCaster",
    ProgressEfficiency = "1.01010101"
  },
  {
    Name = "Seraphic Rod",
    Price = inf,
    Description = "TOUCH SOME GRASS BUDDY",
    Stats = {
      Luck = 150,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 130,
      Resilience = 20,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "SeraphicRod"
  },
  {
    Name = "Amygdala",
    Price = inf,
    Description = "(っ҂ •)っ poison, or antidote ? [For @kittydiets - lea]",
    Stats = {
      Luck = 333,
      LureSpeed = -3333,
      Strength = 3333333333,
      LineDistance = 333,
      Resilience = -33333,
      Control = 0.7
    },
    From = "",
    Worlds = {},
    Passive = "Amygdala",
    ProgressEfficiency = "3.33"
  },
  {
    Name = "Steady Rod",
    Price = 7000,
    Description = "Insanely stiff and strong. Can withstand immense pressure and tension. [Increases shake UI size]",
    Stats = {
      Luck = 35,
      LureSpeed = 160,
      Strength = 250000,
      LineDistance = 25,
      Resilience = 30,
      Control = 0.05
    },
    From = "Roslit",
    Worlds = {}
  },
  {
    Name = "Patriot Rod",
    Price = inf,
    Description = "Happy 4th of July!",
    Stats = {
      Luck = 100,
      LureSpeed = 30,
      Strength = 742025,
      LineDistance = 74,
      Resilience = 7,
      Control = 0.04
    },
    From = "",
    Worlds = {},
    Passive = "PatriotRod"
  },
  {
    Name = "Toxic Spire Rod",
    Price = inf,
    Description = "Tainted power seeps into the catch, slowing it with each struggle. A 15% toxic strike will paralyze it completely, granting 70% faster progress.",
    Stats = {
      Luck = 248,
      LureSpeed = 13,
      Strength = 100000,
      LineDistance = 75,
      Resilience = -20,
      Control = 0.3
    },
    From = "",
    Worlds = {},
    Passive = "Toxic",
    ProgressEfficiency = "0.2"
  },
  {
    Name = "Cryolash",
    Price = 3500000,
    Description = "A brutal cryogenic rod that hurls icicle spears at hooked prey, trading stability for explosive frozen progress.",
    Stats = {
      Luck = 149,
      LureSpeed = 13,
      Strength = 150000,
      LineDistance = 30,
      Resilience = 75,
      Control = -0.1
    },
    From = "Boreal Pines",
    Worlds = {},
    Passive = "Cryolash"
  },
  {
    Name = "Mission Specialist's Rod",
    Price = inf,
    Description = "You chose the Mission Specialist's Rod in your Jurassic missions!",
    Stats = {
      Luck = 60,
      LureSpeed = 40,
      Strength = 5000,
      LineDistance = 30,
      Resilience = 40,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "Jurassic"
  },
  {
    Name = "Champions Rod",
    Price = 90000,
    Description = "Wielded by legendary tournament winners, this balanced rod embodies competitive excellence.",
    Stats = {
      Luck = 65,
      LureSpeed = 55,
      Strength = 100000,
      LineDistance = 20,
      Resilience = 20,
      Control = 0.25
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Carrot Rod",
    Price = 75000,
    Description = "Rich in nutrients!",
    Stats = {
      Luck = 125,
      LureSpeed = 15,
      Strength = 10000,
      LineDistance = 35,
      Resilience = 25,
      Control = 0.15
    },
    From = "Carrot Garden",
    Worlds = {},
    Passive = "CarrotRod"
  },
  {
    Name = "View Smasher",
    Price = inf,
    Description = "HIT THAT FOLLOW BUTTON!! [CC Only]",
    Stats = {
      Luck = 230,
      LureSpeed = 40,
      Strength = inf,
      LineDistance = 100,
      Resilience = 25,
      Control = 0.25
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Blade Of Glorp",
    Price = inf,
    Description = "A sharp Blade & friendly UFO crafted by Glorp harnesses the power of Lasers. Be careful, it is hot and will melt your hands if touched. [For @uhvanni]",
    Stats = {
      Luck = 888,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 100,
      Resilience = 45,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "GlorpBlade"
  },
  {
    Name = "Phoenix Rod",
    Price = 50000,
    Description = "Embued with the spirit of the graceful Phoenix. All fish have a 40% chance to be set ablaze, with 10% possessing the power of the Eclipse.",
    Stats = {
      Luck = 80,
      LureSpeed = 45,
      Strength = 8000,
      LineDistance = 20,
      Resilience = 15,
      Control = 0.02
    },
    From = "Ancient Isle",
    Worlds = {},
    Passive = "PhoenixRod"
  },
  {
    Name = "Merchant Rod",
    Price = 20000,
    Description = "A rod designed for Merchants! Has a 50% chance to create a whirlpool, allowing for random bait to be caught.",
    Stats = {
      Luck = 60,
      LureSpeed = 25,
      Strength = 5000,
      LineDistance = 25,
      Resilience = 18,
      Control = 0.05
    },
    From = "Treasure Island",
    Worlds = {},
    Passive = "WhirlpoolBait"
  },
  {
    Name = "Popsicle Rod",
    Price = inf,
    Description = "Only obtainable during Fischfest; 
A frozen delight with a 15% chance to feed a fish a popsicle, and greatly increased progress speed during Summer!",
    Stats = {
      Luck = 150,
      LureSpeed = 0,
      Strength = 100,
      LineDistance = 30,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "PopsicleRod"
  },
  {
    Name = "Relic Rod",
    Price = inf,
    Description = "A really old rod, found from the tombs of ancient isles, crafted out of ancient bone, but does it hold a mysterious power within it?",
    Stats = {
      Luck = 125,
      LureSpeed = 20,
      Strength = 250000,
      LineDistance = 20,
      Resilience = 35,
      Control = -0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Stone Rod",
    Price = 2000,
    Description = "A rock-hard rod made purely from stone, which also makes it quite heavy.",
    Stats = {
      Luck = 40,
      LureSpeed = 105,
      Strength = 50000,
      LineDistance = 24,
      Resilience = 5,
      Control = 0.2
    },
    From = "Ancient Isle",
    Worlds = {}
  },
  {
    Name = "Treasure Rod",
    Price = 30000,
    Description = "A radiant rod with shimmmering gems, has a 20% chance for Coinfall.",
    Stats = {
      Luck = 130,
      LureSpeed = 30,
      Strength = 10000,
      LineDistance = 20,
      Resilience = 5,
      Control = 0.12
    },
    From = "Treasure Island",
    Worlds = {},
    Passive = "Coinfall",
    ProgressEfficiency = "0.05"
  },
  {
    Name = "Fish Photographer",
    Price = inf,
    Description = "If I catch you fishy.. if I catch you [CC Only]",
    Stats = {
      Luck = 250,
      LureSpeed = 30,
      Strength = inf,
      LineDistance = 125,
      Resilience = 40,
      Control = 0.3
    },
    From = "",
    Worlds = {},
    Passive = "ContentCreatorEntity"
  },
  {
    Name = "Frostfire Rod",
    Price = inf,
    Description = "A sleek fishing rod wreathed in flames and frost, designed to tackle the toughest catches with elemental flair.",
    Stats = {
      Luck = 35,
      LureSpeed = 80,
      Strength = 2200,
      LineDistance = 22,
      Resilience = 12,
      Control = 0.08
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Free Spirit Rod",
    Price = 200000,
    Description = "A rod infused with untamed blooming spirits. Occasional slashes, & all caught fish have a 30% chance to be mutated with Bloom.",
    Stats = {
      Luck = 150,
      LureSpeed = 45,
      Strength = 5000,
      LineDistance = 60,
      Resilience = 10,
      Control = 0.15
    },
    From = "Isle of New Beginnings",
    Worlds = {},
    Passive = "FreeSpiritRod"
  },
  {
    Name = "Fischmas Rod",
    Price = inf,
    Description = "A festive fishing rod wrapped in holiday cheer, perfect for reeling in seasonal treasures.",
    Stats = {
      Luck = 45,
      LureSpeed = 90,
      Strength = 2200,
      LineDistance = 22,
      Resilience = 15,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Oblivion Doombreaker",
    Price = inf,
    Description = "Obliterate fish with a huge flame-engulfed hammer. [Developer-Exclusive]",
    Stats = {
      Luck = 150,
      LureSpeed = 150,
      Strength = inf,
      LineDistance = 1000,
      Resilience = 100,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Summit Rod",
    Price = 500000,
    Description = "A refined rod with snow-white highlights and shimmering blue effects. Has a 40% chance for fish to be Frozen, 20% chance for Sleet, & a 15% chance for Blighted.",
    Stats = {
      Luck = 75,
      LureSpeed = 55,
      Strength = 200000,
      LineDistance = 70,
      Resilience = 15,
      Control = 0.25
    },
    From = "",
    Worlds = {},
    Passive = "SummitRod",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Candy Cane Rod",
    Price = inf,
    Description = "A sweet and minty rod with a festive pattern. All fish have a 10% chance to be Festive.",
    Stats = {
      Luck = 25,
      LureSpeed = 90,
      Strength = 150,
      LineDistance = 14,
      Resilience = -2,
      Control = 0.01
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Heaven's Rod",
    Price = 1750000,
    Description = "A heavenly rod with glowing floating parts and a divine halo, emitting mythical particles and celestial animations. Has a 35% chance for fish to become Heavenly.",
    Stats = {
      Luck = 225,
      LureSpeed = 60,
      Strength = 200000,
      LineDistance = 70,
      Resilience = 30,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "HeavenRod"
  },
  {
    Name = "Ice Warpers Rod",
    Price = 65000,
    Description = "A frost-themed rod with glowing blue accents and icy particle effects. Has a 25% chance to mutate fish with Blighted.",
    Stats = {
      Luck = 60,
      LureSpeed = 50,
      Strength = 75000,
      LineDistance = 70,
      Resilience = 20,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "IceWarpers"
  },
  {
    Name = "Crystalized Rod",
    Price = 35000,
    Description = "A luminous rod with a bright yellow glow and crystal-like effects. Has a 20% chance to Crystalize fish.",
    Stats = {
      Luck = 45,
      LureSpeed = 65,
      Strength = 25000,
      LineDistance = 100,
      Resilience = 15,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "CrystalizedRod"
  },
  {
    Name = "Brother's Rod",
    Price = inf,
    Description = "Built from a brother's bond, grants a 20% chance to duplicate and mutate fish.",
    Stats = {
      Luck = 70,
      LureSpeed = 30,
      Strength = 3000,
      LineDistance = 25,
      Resilience = 10,
      Control = 0.1
    },
    From = "Isle of New Beginnings",
    Worlds = {},
    Passive = "Brothers"
  },
  {
    Name = "Christmas Tree Rod",
    Price = inf,
    Description = "Only obtainable during Fischmas;
A festively lit tree repurposed as a rod! All fish have a 25% chance to be Merry.",
    Stats = {
      Luck = 75,
      LureSpeed = 50,
      Strength = inf,
      LineDistance = 20,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "ChristmasTree"
  },
  {
    Name = "Merlin's Staff",
    Price = inf,
    Description = "Channels Merlin's rift-woven magic to trap unsuspecting fish between realms...",
    Stats = {
      Luck = 102.54,
      LureSpeed = 20,
      Strength = inf,
      LineDistance = 20,
      Resilience = 50,
      Control = 0.1
    },
    From = "Sunstone Island",
    Worlds = {},
    Passive = "MerlinMagic"
  },
  {
    Name = "Arctic Rod",
    Price = 25000,
    Description = "A white rod with frost effects and a cool blue glow, all fish become Frozen.",
    Stats = {
      Luck = 45,
      LureSpeed = 75,
      Strength = 7500,
      LineDistance = 70,
      Resilience = 15,
      Control = 0.06
    },
    From = "",
    Worlds = {},
    Passive = "ArcticRod"
  },
  {
    Name = "North-Star Rod",
    Price = inf,
    Description = "Powered by the intensely bright shine of the Northern Star.",
    Stats = {
      Luck = 30,
      LureSpeed = 95,
      Strength = 875,
      LineDistance = 19,
      Resilience = 12,
      Control = 0.04
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Flimsy Rod",
    Price = 0,
    Description = "Quite the weak and unreliable rod. But, it can get the job done!",
    Stats = {
      Luck = 0,
      LureSpeed = 100,
      Strength = 10.4,
      LineDistance = 19,
      Resilience = 0,
      Control = 0
    },
    From = "Moosewood",
    Worlds = {}
  },
  {
    Name = "Haunted Rod",
    Price = inf,
    Description = "Only obtainable during FischFright; The rod is cursed with the constant energy of FischFright, allowing it to catch FischFright mutations all year round.",
    Stats = {
      Luck = 50,
      LureSpeed = 50,
      Strength = 1000,
      LineDistance = 30,
      Resilience = 0,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Astral Rod",
    Price = inf,
    Description = "An intergalactic rod, powered by the harmonious essence of all the stars in the night sky. All fish have a 5% chance to be Lunar.",
    Stats = {
      Luck = 30,
      LureSpeed = 90,
      Strength = 1000,
      LineDistance = 20,
      Resilience = 5,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "The Lost Rod",
    Price = inf,
    Description = "After a Perfect Catch, there is a 36% chance for the next catch to become Lost.",
    Stats = {
      Luck = 90,
      LureSpeed = 55,
      Strength = 55000,
      LineDistance = 70,
      Resilience = 20,
      Control = 0.08
    },
    From = "",
    Worlds = {},
    Passive = "PerfectCatch"
  },
  {
    Name = "Verdant Shear Rod",
    Price = 40000,
    Description = "A rod entwined with nature's will. Has a 20% chance to sprout a tree, blessing each catch with triple its worth.",
    Stats = {
      Luck = 75,
      LureSpeed = 30,
      Strength = 2000,
      LineDistance = 15,
      Resilience = 20,
      Control = 0.1
    },
    From = "Lushgrove",
    Worlds = {},
    Passive = "VerdantShearRod"
  },
  {
    Name = "Tempest Rod",
    Price = 500000,
    Description = "Born from the essence of a perpetual storm, this rod moves faster than the eye can follow.",
    Stats = {
      Luck = 120,
      LureSpeed = 10,
      Strength = 80000,
      LineDistance = 20,
      Resilience = 40,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Wisdom Rod",
    Price = inf,
    Description = "A mystical rod that rewards skilled fishers, granting a stackable 5% XP bonus for every perfect catch in a row up to 80%.",
    Stats = {
      Luck = 80,
      LureSpeed = 45,
      Strength = 2000,
      LineDistance = 50,
      Resilience = 40,
      Control = -0.02
    },
    From = "",
    Worlds = {},
    Passive = "WisdomPassive"
  },
  {
    Name = "Seasons Rod",
    Price = inf,
    Description = "Boosts fish luck by 40% for the current season. It also has a 50% chance to grant a "Seasonal" mutation that changes the fish's colors based on the season it was caught. Seasonal Mutation Buffs -> Spring: 4.5x Sell Price, Summer: +25% Size, Autumn: 4x Sell Price, Winter: 2.5x Sell Price",
    Stats = {
      Luck = 70,
      LureSpeed = 75,
      Strength = 8000,
      LineDistance = 50,
      Resilience = 20,
      Control = 0.03
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Rod Of The Eternal King",
    Price = inf,
    Description = "Every 30 seconds, a 5% chance summons a 'Royal Escort', boosting luck by 150% for 45 seconds. If you miss a catch, there's a 15% chance of immediately catching a higher rarity fish. All fish have a 60% chance to be Greedy.",
    Stats = {
      Luck = 160,
      LureSpeed = 50,
      Strength = 75000,
      LineDistance = 80,
      Resilience = 15,
      Control = 0.175
    },
    From = "",
    Worlds = {},
    Passive = "RoyalEscort"
  },
  {
    Name = "Challenger's Rod",
    Price = 750000,
    Description = "An ice-imbued rod for the most dedicated fishers.",
    Stats = {
      Luck = 110,
      LureSpeed = 5,
      Strength = 200000,
      LineDistance = 70,
      Resilience = 20,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    ProgressEfficiency = "0.25"
  },
  {
    Name = "Duskwire",
    Price = inf,
    Description = "Intertwined with souls of the masses; a reminder that we are all human after all.",
    Stats = {
      Luck = 175,
      LureSpeed = 0,
      Strength = -757575,
      LineDistance = 75,
      Resilience = 175,
      Control = -0.2
    },
    From = "",
    Worlds = {},
    Passive = "Duskwire",
    ProgressEfficiency = "0.25"
  },
  {
    Name = "Random Rod",
    Price = inf,
    Description = "?",
    Stats = {
      Luck = 1000,
      LureSpeed = 20,
      Strength = inf,
      LineDistance = 25,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "RandomRod"
  },
  {
    Name = "Rod Of The Forgotten Fang",
    Price = inf,
    Description = "All caught fish have a 25% chance for Tidal mutation
After 3 perfect catches, triggers a special mode where a Meg jumps out of the Deeps with a higher-tier fish. Boasting a 25-50% size buff and the Tidal mutation.",
    Stats = {
      Luck = 145,
      LureSpeed = 20,
      Strength = 300000,
      LineDistance = 100,
      Resilience = 25,
      Control = 0.22
    },
    From = "",
    Worlds = {},
    Passive = "Shark"
  },
  {
    Name = "Test Rod",
    Price = inf,
    Description = "Test Rod Description",
    Stats = {
      Luck = 150,
      LureSpeed = -50,
      Strength = 150000,
      LineDistance = 150,
      Resilience = 15,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "TestRod"
  },
  {
    Name = "Gingerbread Rod",
    Price = 5000,
    Description = "Only obtainable during Fischmas;
A delicious and festive gingerbread cookie built rod! All fish have a 25% chance to be Gingerbread.",
    Stats = {
      Luck = 65,
      LureSpeed = 50,
      Strength = 2000,
      LineDistance = 20,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {},
    Passive = "GingerbreadRod"
  },
  {
    Name = "Fang of the Eclipse",
    Price = inf,
    Description = "A quiet antique under normal conditions... Under the presence of an Eclipse, it becomes a power beyond comprehension—an intricate yet worthy challenge.",
    Stats = {
      Luck = 80,
      LureSpeed = 20,
      Strength = 25000,
      LineDistance = 100,
      Resilience = 20,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "EclipseFangKhopeshrod"
  },
  {
    Name = "North Pole",
    Price = inf,
    Description = "Only obtainable during Fischmas;
A mercilessly precise rod forged for mastery, rewarding unyielding freezing strength...",
    Stats = {
      Luck = 177,
      LureSpeed = 10,
      Strength = inf,
      LineDistance = 80,
      Resilience = 25,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "NorthPole"
  },
  {
    Name = "Miku's Melody",
    Price = inf,
    Description = "Blue hair, blue tie, hiding in your wifi! [For @.const]",
    Stats = {
      Luck = 39,
      LureSpeed = -3839,
      Strength = 393939393,
      LineDistance = 3939,
      Resilience = 3939,
      Control = 0.39
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Shamrock Rod",
    Price = inf,
    Description = "Surely the pot of gold at the end of the rainbow is real... Right?",
    Stats = {
      Luck = 150,
      LureSpeed = 75,
      Strength = 5000,
      LineDistance = 60,
      Resilience = 10,
      Control = 0.15
    },
    From = "None",
    Worlds = {},
    Passive = "Clover"
  },
  {
    Name = "Lucid Rod",
    Price = inf,
    Description = "A radiant rod that channels the power of dreams, granting the Lucid mutation and rarely cloning catches; particularly under clear skies.",
    Stats = {
      Luck = 100,
      LureSpeed = 20,
      Strength = 500000,
      LineDistance = 30,
      Resilience = 45,
      Control = -0.05
    },
    From = "",
    Worlds = {},
    Passive = "Lucid Rod",
    ProgressEfficiency = "0.1"
  },
  {
    Name = "Rod Of Time",
    Price = inf,
    Description = "A time rod!",
    Stats = {
      Luck = 25,
      LureSpeed = 80,
      Strength = 2500,
      LineDistance = 20,
      Resilience = 20,
      Control = 0.05
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Scurvy Rod",
    Price = 40000,
    Description = "This rod has been on every pirate ship imaginable. Decent at everything, bad at nothing. Just like a pirate should! Has a 16% chance for fish to become Greedy.",
    Stats = {
      Luck = 50,
      LureSpeed = 75,
      Strength = 2000,
      LineDistance = 20,
      Resilience = 15,
      Control = 0
    },
    From = "Forsaken Shores",
    Worlds = {},
    Passive = "ScurvyRod"
  },
  {
    Name = "Long Rod",
    Price = 3000,
    Description = "Not the strongest, but it’s sure the longest! Is this really needed?",
    Stats = {
      Luck = 80,
      LureSpeed = 80,
      Strength = 250,
      LineDistance = 1000,
      Resilience = 20,
      Control = -0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Buddy Bond Rod",
    Price = inf,
    Description = "A friendly rod!
While playing with a friend, fish weight is increased by 30%.",
    Stats = {
      Luck = 5,
      LureSpeed = 100,
      Strength = 300,
      LineDistance = 20,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Cinder Block Rod",
    Price = 50000,
    Description = "seems a little heavy...",
    Stats = {
      Luck = 1000,
      LureSpeed = 150,
      Strength = 100000000000,
      LineDistance = 15,
      Resilience = 1000,
      Control = 0.7
    },
    From = "",
    Worlds = {},
    Passive = "CinderBlockRod"
  },
  {
    Name = "Spiritbinder",
    Price = inf,
    Description = "Spirits occasionally leave fish behind...
Their presence subtly draws high-rarity fish closer...",
    Stats = {
      Luck = 25,
      LureSpeed = 10,
      Strength = 150000,
      LineDistance = 100,
      Resilience = 5,
      Control = 0.03
    },
    From = "",
    Worlds = {},
    Passive = "Spiritbinder"
  },
  {
    Name = "Rainbow Cluster Rod",
    Price = 250000,
    Description = "Enhanced by the Rainbow energy! (20% chance for Rainbow mutation) Rainbow weather grants a 35% chance for the Rainbow mutation & +50% Progress Speed.",
    Stats = {
      Luck = 180,
      LureSpeed = 35,
      Strength = 50000,
      LineDistance = 50,
      Resilience = 25,
      Control = 0
    },
    From = "Castaway Cliffs",
    Worlds = {},
    Passive = "RainbowClusterRod"
  },
  {
    Name = "Fungal Rod",
    Price = inf,
    Description = "Has a 30% chance for fish to be Fungal, & a 70% chance for the rod to sprout suspicious spores, giving you Luck X for 45 seconds! Prettyy funky!",
    Stats = {
      Luck = 45,
      LureSpeed = 60,
      Strength = 200,
      LineDistance = 15,
      Resilience = 20,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "FungalRod"
  },
  {
    Name = "Electric Guitar",
    Price = inf,
    Description = "WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!",
    Stats = {
      Luck = 444,
      LureSpeed = -344,
      Strength = 444444444,
      LineDistance = 444,
      Resilience = 44,
      Control = 0.14
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Brick Rod",
    Price = 13337,
    Description = "Wait.. it's real?",
    Stats = {
      Luck = 75,
      LureSpeed = 100,
      Strength = inf,
      LineDistance = 200,
      Resilience = 35,
      Control = 0.35
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Mythical Rod",
    Price = 90000,
    Description = "Blessed with the power of The Keepers. All fish have a 30% chance to be rainbow.",
    Stats = {
      Luck = 60,
      LureSpeed = 60,
      Strength = 2500,
      LineDistance = 20,
      Resilience = 15,
      Control = 0.05
    },
    From = "The Travelling Merchant",
    Worlds = {},
    Passive = "MythicalRod"
  },
  {
    Name = "Pen Rod",
    Price = inf,
    Description = "Given to editors of the Official Fisch Wiki for their continued contributions!
[Originally for @ZooWeeMamaMoment]",
    Stats = {
      Luck = 150,
      LureSpeed = 35,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "SOULREAPER",
    Price = inf,
    Description = "Vampires will never hurt you. [Dev rod, for @049492]",
    Stats = {
      Luck = 888.888,
      LureSpeed = -899.999,
      Strength = inf,
      LineDistance = 999,
      Resilience = 666.666,
      Control = 0.777
    },
    From = "",
    Worlds = {},
    Passive = "SOULREAPER"
  },
  {
    Name = "Sanguine Spire",
    Price = 10000000,
    Description = "i am emo rod!",
    Stats = {
      Luck = 100,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 100,
      Resilience = 25,
      Control = 0.125
    },
    From = "",
    Worlds = {},
    Passive = "SanguineSpire",
    ProgressEfficiency = "0.3"
  },
  {
    Name = "Vinefang Rod",
    Price = inf,
    Description = "Only obtainable during Jungle's Echo Bone Hunt; 
A fragile rod of bone and vine, hiding absurd, untamed power that awakens only in the Jungle.",
    Stats = {
      Luck = 117,
      LureSpeed = 20,
      Strength = 25000,
      LineDistance = 20,
      Resilience = -16,
      Control = -0.11
    },
    From = "",
    Worlds = {},
    Passive = "VinefangRod",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Wildflower Rod",
    Price = 40000,
    Description = "Entwined with blooming vines and the essence of the wild. Fish have a 30% chance to be drawn to nature.",
    Stats = {
      Luck = 75,
      LureSpeed = 30,
      Strength = 700,
      LineDistance = 15,
      Resilience = 17,
      Control = 0.17
    },
    From = "Terrapin",
    Worlds = {},
    Passive = "WildflowerRod"
  },
  {
    Name = "Lucky Rod",
    Price = 4500,
    Description = "Seems to attract a handful of rare fish. Not sure why?.. Maybe I should buy a lottery ticket?",
    Stats = {
      Luck = 177,
      LureSpeed = 80,
      Strength = 175,
      LineDistance = 20,
      Resilience = 7,
      Control = 0.07
    },
    From = "Moosewood",
    Worlds = {}
  },
  {
    Name = "Prismatic Rod",
    Price = inf,
    Description = "Feel my unstoppable daggers! [For @moonysquared]",
    Stats = {
      Luck = 250,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.65
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Astralhook Rod",
    Price = inf,
    Description = "Tempered from the silence within descending stars, it draws from the power of the Milky Way to assemble powers beyond conceivability.",
    Stats = {
      Luck = 200,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 150,
      Resilience = 20,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "Astralhook",
    ProgressEfficiency = "0.15"
  },
  {
    Name = "Onirifalx",
    Price = inf,
    Description = "Tempered in dreams and sharpened by peril, the Onirifalx reaps catches with unrivaled speed for those who can hold their ground.
[For @animepunk]",
    Stats = {
      Luck = 777,
      LureSpeed = -677,
      Strength = inf,
      LineDistance = 777,
      Resilience = -inf,
      Control = 0.17
    },
    From = "",
    Worlds = {},
    Passive = "Onirifalx",
    ProgressEfficiency = "0.7"
  },
  {
    Name = "Classic Polaris Serenade",
    Price = inf,
    Description = "💫",
    Stats = {
      Luck = 1000,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 250,
      Resilience = 100,
      Control = 0.55
    },
    From = "",
    Worlds = {},
    Passive = "OldButterflyEntity",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Sword of Darkness",
    Price = inf,
    Description = "Dare to reach out your hand into the darkness, to pull another hand into the dark from the light. 
[Black Market Exclusive]",
    Stats = {
      Luck = 250,
      LureSpeed = -150,
      Strength = 1000000,
      LineDistance = 100,
      Resilience = -50,
      Control = -0.17
    },
    From = "",
    Worlds = {},
    Passive = "SwordOfDarkness"
  },
  {
    Name = "Katana Rod",
    Price = inf,
    Description = "Good at cutting fruit. 
[Black Market Exclusive]",
    Stats = {
      Luck = 150,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Maelstrom",
    Price = 3250000,
    Description = "Only obtainable during Fischmas;
A glacial bow of overwhelming power, capable of locking the sea in its grasp...",
    Stats = {
      Luck = 85,
      LureSpeed = 20,
      Strength = inf,
      LineDistance = 13,
      Resilience = 35,
      Control = 0.15
    },
    From = "",
    Worlds = {},
    Passive = "Mael",
    ProgressEfficiency = "-0.1"
  },
  {
    Name = "The Boom Ball",
    Price = 50000,
    Description = "how could this possibly be a good idea?",
    Stats = {
      Luck = 0,
      LureSpeed = 100,
      Strength = 500000000,
      LineDistance = 20,
      Resilience = -500,
      Control = 0.5
    },
    From = "",
    Worlds = {},
    Passive = "TheBoomBall"
  },
  {
    Name = "Superstar Rod",
    Price = inf,
    Description = "It glows with unmatched shopping energy!",
    Stats = {
      Luck = 70,
      LureSpeed = 50,
      Strength = 10000,
      LineDistance = 200,
      Resilience = 15,
      Control = 0.1
    },
    From = "Isle of New Beginnings",
    Worlds = {}
  },
  {
    Name = "Antler Rod",
    Price = inf,
    Description = "A rod bearing the magnificent antlers of a reindeer. All fish have a 25% chance to be Jolly.",
    Stats = {
      Luck = 45,
      LureSpeed = 75,
      Strength = 200,
      LineDistance = 24,
      Resilience = -4,
      Control = 0.02
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Destiny Rod",
    Price = 190000,
    Description = "The Destiny Rod pulses continuously with the pure essence of luck. (10% Higher chance of Shiny & Sparkling fish)",
    Stats = {
      Luck = 250,
      LureSpeed = 55,
      Strength = 77777,
      LineDistance = 25,
      Resilience = 10,
      Control = 0.2
    },
    From = "Caleia",
    Worlds = {},
    Passive = "DestinyRod"
  },
  {
    Name = "Rex Umbrarum",
    Price = inf,
    Description = "Beeg Heavy Sord [For @Plutoly]",
    Stats = {
      Luck = 150,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.35
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Nocturnal Rod",
    Price = 11000,
    Description = "Seems to wake up fish just by throwing the bobber in!-- Can catch nocturnal and diurnal fish at any time!",
    Stats = {
      Luck = 70,
      LureSpeed = 50,
      Strength = 10000,
      LineDistance = 15,
      Resilience = 0,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Trident Rod",
    Price = 150000,
    Description = "Was originally the King of the Sea's way of defending his kingdom. All fish have a 30% chance to be Atlantean. [Has a chance to stab a fish while catching it, briefly stunning it and increasing progress]",
    Stats = {
      Luck = 150,
      LureSpeed = 65,
      Strength = 6000,
      LineDistance = 100,
      Resilience = 0,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "TridentRod"
  },
  {
    Name = "Zeus Rod",
    Price = 850000,
    Description = "Forged in the heart of Mount Olympus, this divine rod crackles with Zeus's lightning. Its power grants the ability to command storms, with a 90% chance to inflict the Electric Shock mutation on fish; all others are Charred.",
    Stats = {
      Luck = 90,
      LureSpeed = 30,
      Strength = 65000,
      LineDistance = 70,
      Resilience = 20,
      Control = 0.05
    },
    From = "",
    Worlds = {},
    Passive = "ZeusRod"
  },
  {
    Name = "Angel of Death",
    Price = inf,
    Description = "Your wings will show eventually.",
    Stats = {
      Luck = 222,
      LureSpeed = -11,
      Strength = inf,
      LineDistance = 111,
      Resilience = 22,
      Control = 0.2
    },
    From = "",
    Worlds = {},
    Passive = "AngelOfDeath",
    ProgressEfficiency = "0.5"
  },
  {
    Name = "Tetra Rod",
    Price = inf,
    Description = "A rod that belongs to the hands of the Tetrapede. [For @voaj77]",
    Stats = {
      Luck = 150,
      LureSpeed = 35,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Rod Of The Depths",
    Price = 750000,
    Description = "This Rod was crafted by the Legendary King of The Depths... Legends say, every once in a while the Spirit of the King visits you to hand you a gift from the deep waters!",
    Stats = {
      Luck = 130,
      LureSpeed = 35,
      Strength = 30000,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.15
    },
    From = "The Depths",
    Worlds = {},
    Passive = "ShadowEntity"
  },
  {
    Name = "Frog Rod",
    Price = 12000,
    Description = "A peculiar rod infused with amphibian magic. Frogs appear applying a stacking luck boost for every perfect catch.",
    Stats = {
      Luck = 100,
      LureSpeed = 40,
      Strength = 650,
      LineDistance = 15,
      Resilience = 15,
      Control = 0.15
    },
    From = "Waveborne",
    Worlds = {},
    Passive = "Frog"
  },
  {
    Name = "Reinforced Rod",
    Price = 20000,
    Description = "Crafted by a metal stronger than diamond, making it capable of fishing in any harmful liquid.",
    Stats = {
      Luck = 65,
      LureSpeed = 60,
      Strength = inf,
      LineDistance = 32,
      Resilience = 15,
      Control = 0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Hubert Rod",
    Price = inf,
    Description = ":3",
    Stats = {
      Luck = 350,
      LureSpeed = 0,
      Strength = inf,
      LineDistance = 350,
      Resilience = 35,
      Control = 0.35
    },
    From = "",
    Worlds = {},
    Passive = "Hubert"
  },
  {
    Name = "Ultratech Rod",
    Price = inf,
    Description = "A rod of Unknown origin, feels pretty heavy. The rod has a pressed-in text on it's bottom which says "Ultratech v.3." A scratched out name next to it which reads as: ZIK [For @Zik_isi].",
    Stats = {
      Luck = 150,
      LureSpeed = 80,
      Strength = 10000,
      LineDistance = 100,
      Resilience = 10,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Boreal Rod",
    Price = 18000,
    Description = "A frostbitten rod carved from northern pines, imbuing catches with quiet, creeping cold.",
    Stats = {
      Luck = 50,
      LureSpeed = 40,
      Strength = 14000,
      LineDistance = 30,
      Resilience = 25,
      Control = 0.05
    },
    From = "Boreal Pines",
    Worlds = {},
    Passive = "BorealRod"
  },
  {
    Name = "Carbon Rod",
    Price = 2000,
    Description = "Stiff, strong, and easier to handle than other rods out there, however it is slightly shorter.",
    Stats = {
      Luck = 25,
      LureSpeed = 85,
      Strength = 600,
      LineDistance = 15,
      Resilience = 10,
      Control = 0.05
    },
    From = "Moosewood",
    Worlds = {}
  },
  {
    Name = "The Brick Rod",
    Price = inf,
    Description = "It's real. [For @LiamGame09]",
    Stats = {
      Luck = 250,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.65
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "ROBLOX Explorer",
    Price = inf,
    Description = "Once a Guitar Hero controller, it has been adorned with stickers from it's previous owner. It is now re-modelled into a multi-purpose instrument of precision and power.",
    Stats = {
      Luck = 125,
      LureSpeed = 20,
      Strength = inf,
      LineDistance = 150,
      Resilience = 60,
      Control = 0
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Jinglestar Rod",
    Price = inf,
    Description = "Only obtainable during Fischmas;
A legendary rod of starlight and bells, its full strength will return when real Christmas magic awakens...",
    Stats = {
      Luck = 122.5,
      LureSpeed = 15,
      Strength = inf,
      LineDistance = 100,
      Resilience = 5,
      Control = 0.4
    },
    From = "",
    Worlds = {},
    Passive = "Jinglestar",
    ProgressEfficiency = "0.25"
  },
  {
    Name = "Leviathan's Fang Rod",
    Price = 350000,
    Description = "A weaponized rod forged to withstand the wrath of Scylla, carving through its relentless assaults with unyielding force.",
    Stats = {
      Luck = 180,
      LureSpeed = 15,
      Strength = 230000,
      LineDistance = 70,
      Resilience = 10,
      Control = 0.1
    },
    From = "",
    Worlds = {}
  },
  {
    Name = "Wicked Fang Rod",
    Price = 400000,
    Description = "Forged in malice, its fangs bite slow but devastatingly deep; every strike leaves ruin in its wake.
Has a 30% chance for the Solarblaze mutation.",
    Stats = {
      Luck = 140,
      LureSpeed = 5,
      Strength = inf,
      LineDistance = 75,
      Resilience = 15,
      Control = 0
    },
    From = "",
    Worlds = {},
    Passive = "WickedFangRod",
    ProgressEfficiency = "0.2"
  },
  {
    Name = "Experimental Rod",
    Price = 0,
    Description = "Something seems off...",
    Stats = {
      Luck = 123.4567,
      LureSpeed = 87.7654,
      Strength = 123.4567,
      LineDistance = 123.4567,
      Resilience = 12.3456,
      Control = 0.1234
    },
    From = "",
    Worlds = {},
    Passive = "ExperimentalRod"
  },
  {
    Name = "Blazebringer Rod",
    Price = 70000,
    Description = "A flaming rod with power that builds with every perfect catch, yielding a variety of unique mutations & a luck boost.",
    Stats = {
      Luck = 90,
      LureSpeed = 20,
      Strength = 5000,
      LineDistance = 25,
      Resilience = 15,
      Control = 0.15
    },
    From = "Emberreach",
    Worlds = {},
    Passive = "BlazebringerRod"
  },
  {
    Name = "Venomfang Rod",
    Price = inf,
    Description = "From the bowels of an ancient temple. [For @kylecat11]",
    Stats = {
      Luck = 250,
      LureSpeed = 1,
      Strength = inf,
      LineDistance = 100,
      Resilience = 10,
      Control = 0.65
    },
    From = "",
    Worlds = {}
  }
}

return Rods
