local PilgrimQuestTypes = {
    Delivery = {
        DeliverFruitCount = {
            Kind = "delivery",
            Unit = "count",
            CheckField = "FruitName",
            Description = "Submit X specific fruits"
        },
        DeliverFruitMutation = {
            Kind = "delivery",
            Unit = "count",
            CheckField = "Mutation",
            Description = "Submit X fruits with a specific mutation"
        },
        DeliverTier = {
            Kind = "delivery",
            Unit = "count",
            CheckField = "Tier",
            Description = "Submit X fruits belonging to a specific rarity tier"
        },
        DeliverAboveSize = {
            Kind = "delivery",
            Unit = "count",
            CheckField = "MinWeightKg",
            Description = "Submit X fruits weighing above a minimum kg threshold"
        },
        DeliverWeightKg = {
            Kind = "delivery",
            Unit = "kg",
            CheckField = "FruitName",
            Description = "Submit X total kg of a specific fruit"
        }
    },
    Passive = {
        TamePets = {
            Kind = "passive",
            PassiveType = "tame",
            Description = "Tame X pets"
        },
        StealPeople = {
            Kind = "passive",
            PassiveType = "steal",
            Description = "Steal from X different players"
        },
        GrowTallPlant = {
            Kind = "passive",
            PassiveType = "grow",
            Description = "Grow a plant to X ft height"
        }
    }
}

return PilgrimQuestTypes
