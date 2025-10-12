this.wretch_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.wretch";
		this.m.Name = "Wretch";
		this.m.Icon = "ui/backgrounds/background_54.png"; // fractured psyche TODO
		this.m.BackgroundDescription = "Twisted by pain and shaped by dark whispers, the Wretch is both victim and vessel. Whatever they were before, only hunger and hate remain.";
		this.m.GoodEnding = "%name% began %their% journey a broken soul, chained by nightmares that would have shattered most. Yet through slaughter and suffering, %they% learned to master the voice instead of obey it. In the end, %they% vanished from your company, and rumor speaks of a hooded figure who kills the corrupted with the same curse that ruined them.";
		this.m.BadEnding = "After the company’s end, %name% wandered back into the wilds, driven by the voice that promised freedom. When winter came, hunters found a clearing of blackened corpses—and a trail of footprints that led nowhere.";
		this.m.HiringCost = 0;
		this.m.DailyCost = 5;
		this.m.Titles = [
			"the Broken",
			"the Hollow",
			"the Withered",
			"the Shamed",
			"the Afflicted",
			"the Bound",
			"the Mad",
			"the Cursed",
			"the Veiled",
			"the Pale",
			"the Forsworn",
			"the Whispering"
		];
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Gluttonous),
			::Legends.Traits.getID(::Legends.Trait.Lucky),
			::Legends.Traits.getID(::Legends.Trait.Cocky),
			::Legends.Traits.getID(::Legends.Trait.Fat),
			::Legends.Traits.getID(::Legends.Trait.Dastard),
			::Legends.Traits.getID(::Legends.Trait.Insecure),
			::Legends.Traits.getID(::Legends.Trait.Fearless),
			::Legends.Traits.getID(::Legends.Trait.Brave),
			::Legends.Traits.getID(::Legends.Trait.FearUndead),
			::Legends.Traits.getID(::Legends.Trait.Drunkard),
			::Legends.Traits.getID(::Legends.Trait.Determined),
			::Legends.Traits.getID(::Legends.Trait.Greedy),
			::Legends.Traits.getID(::Legends.Trait.Athletic),
			::Legends.Traits.getID(::Legends.Trait.HateBeasts),
			::Legends.Traits.getID(::Legends.Trait.HateGreenskins),
			::Legends.Traits.getID(::Legends.Trait.LegendHateNobles),
			::Legends.Traits.getID(::Legends.Trait.LegendSlack)
		];
		this.m.IsGuaranteed = ["hate_undead_trait"];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.BackgroundType = this.Const.BackgroundType.Combat | this.Const.BackgroundType.Crusader | this.Const.BackgroundType.OffendedByViolence;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Terrain =  [
				0.0, // ?
				0.0, //ocean
				0.01,//plains
				0.0, //swamp
				0.02, //hills
				0.02, //forest
				0.02, //forest
				0.02, //forest_leaves
				0.02, //autumn_forest
				0.01, //mountains
				0.0, // ?
				0.01, //farmland
				0.0, // snow
				0.02, // badlands
				0.02, //highlands
				0.02, //stepps
				0.0, //ocean
				0.0, //desert
				0.0 //oasis
			];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.HammerTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.ShieldTree,
				this.Const.Perks.SlingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.FitTree,
				this.Const.Perks.SturdyTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree
			],
			Enemy = [
				this.Const.Perks.ZombieTree,
				this.Const.Perks.SkeletonTree
			],
			Class = [
				this.Const.Perks.FaithClassTree
			],
			Magic = []
		}
	}
})