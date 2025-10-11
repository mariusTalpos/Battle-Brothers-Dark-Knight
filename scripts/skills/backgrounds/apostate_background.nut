this.apostate_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.apostate";
		this.m.Name = "Apostate";
		this.m.Icon = "ui/backgrounds/background_54.png"; // flip it upside down and change colors to black and red
		this.m.BackgroundDescription = "Once a devoted disciple, %name% now walks the world free of divine chains. To the Apostate, faith is just another leash—and power belongs to those strong enough to take it.";
		this.m.GoodEnding = "%name% began %their% journey with you as a scholar of heresies, seeking forbidden truths. In the wars that followed, %they% found what the gods had hidden: that fear itself is a kind of worship. When the crusades returned to ash, %name% vanished into the frontier, where the weak still whisper prayers to gods who no longer answer.";
		this.m.BadEnding = "When your company fell apart, %name% continued the search alone, delving into catacombs where even zealots feared to tread. Months later, travelers found the ruins collapsed inward, as if the world itself had swallowed the blasphemer whole.";
		this.m.HiringCost = 50;
		this.m.DailyCost = 10;
		this.m.Titles = [
			"the Heretic",
			"the Defiant",
			"the Blasphemer",
			"the Unbound",
			"the Seeker of Shadows",
			"the Profane",
			"the Truthless",
			"the Breaker of Oaths",
			"the Unhallowed",
			"the Godless",
			"the Betrayer",
			"the Iconoclast"
		];
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Teamplayer),
			::Legends.Traits.getID(::Legends.Trait.FearUndead),
			::Legends.Traits.getID(::Legends.Trait.Gluttonous),
			::Legends.Traits.getID(::Legends.Trait.NightBlind),
			::Legends.Traits.getID(::Legends.Trait.Fat),
			::Legends.Traits.getID(::Legends.Trait.Insecure),
			::Legends.Traits.getID(::Legends.Trait.FearUndead),
			::Legends.Traits.getID(::Legends.Trait.Drunkard),
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
				this.Const.Perks.CleaverTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SlingTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.ClothArmorTree
			],
			Traits = [
				this.Const.Perks.MartyrTree,
			],
			Enemy = [
				// what enemies do these guys hate?
			],
			Class = [],
			Magic = [
				// what can these guys do?
			]
		}
	}

	function getTooltip()
	{
		local ret = this.character_background.getTooltip();

		return ret;
	}

	function onBuildDescription()
	{
		return "";
	}

	function setGender(_gender = -1)
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 19);

		if (_gender != 1) return;

		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-8,
				8
			],
			Bravery = [
				10,
				20
			],
			Stamina = [
				-8,
				8
			],
			MeleeSkill = [
				-8,
				8
			],
			RangedSkill = [
				-8,
				8
			],
			MeleeDefense = [
				-5,
				5
			],
			RangedDefense = [
				-5,
				5
			],
			Initiative = [
				-6,
				12
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();

		if (this.Math.rand(1, 100) <= 66)
		{
			local body = actor.getSprite("body");
			local tattoo_body = actor.getSprite("tattoo_body");
			tattoo_body.setBrush("scar_01_" + body.getBrush().Name);
			tattoo_body.Color = body.Color;
			tattoo_body.Saturation = body.Saturation;
			tattoo_body.Visible = true;
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		local weapons = [
			"weapons/legend_staff",
			"weapons/legend_tipstaff"
		];

		items.equip(this.Const.World.Common.pickArmor([
			[1, "leather_tunic"],
			[1, "tattered_sackcloth"],
			[1, "padded_surcoat"],
			[1, "gambeson"],
			[1, "linen_tunic"]
		]));

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "aketon_cap"],
			[1, "full_aketon_cap"],
			[1, "open_leather_cap"],
			[1, "full_leather_cap"],
			[1, "straw_hat"]
		]));
	}

	function onUpdate( _properties )
	{
	}

});

