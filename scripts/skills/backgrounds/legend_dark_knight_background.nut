this.legend_dark_knight_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.dark_knight";
		this.m.Name = "Dark Knight";
		this.m.Icon = "ui/backgrounds/background_dark_knight.png";
		this.m.HiringCost = 3500;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			::Legends.Traits.getID(::Legends.Trait.Weasel),
			::Legends.Traits.getID(::Legends.Trait.NightBlind),
			::Legends.Traits.getID(::Legends.Trait.Swift),
			::Legends.Traits.getID(::Legends.Trait.Ailing),
			::Legends.Traits.getID(::Legends.Trait.Brute),
			::Legends.Traits.getID(::Legends.Trait.Greedy),
			::Legends.Traits.getID(::Legends.Trait.Gluttonous),
			::Legends.Traits.getID(::Legends.Trait.Dumb),
			::Legends.Traits.getID(::Legends.Trait.Clubfooted),
			::Legends.Traits.getID(::Legends.Trait.Irrational),
			::Legends.Traits.getID(::Legends.Trait.Hesistant),
			::Legends.Traits.getID(::Legends.Trait.Disloyal),
			::Legends.Traits.getID(::Legends.Trait.Tiny),
			::Legends.Traits.getID(::Legends.Trait.Fragile),
			::Legends.Traits.getID(::Legends.Trait.Clumsy),
			::Legends.Traits.getID(::Legends.Trait.Fainthearthed),
			::Legends.Traits.getID(::Legends.Trait.Craven),
			::Legends.Traits.getID(::Legends.Trait.Bleeder),
			::Legends.Traits.getID(::Legends.Trait.Dastard),
			::Legends.Traits.getID(::Legends.Trait.Insecure),
			::Legends.Traits.getID(::Legends.Trait.Asthmatic),
			::Legends.Traits.getID(::Legends.Trait.LegendLight),
			::Legends.Traits.getID(::Legends.Trait.Disloyal),
			::Legends.Traits.getID(::Legends.Trait.Optimist),
			::Legends.Traits.getID(::Legends.Trait.Teamplayer),
			::Legends.Traits.getID(::Legends.Trait.LegendSlack),
			::Legends.Traits.getID(::Legends.Trait.LegendFrail),
			::Legends.Traits.getID(::Legends.Trait.LegendGiftOfPeople),
			::Legends.Traits.getID(::Legends.Trait.LegendFearDark),
			::Legends.Traits.getID(::Legends.Trait.Fat),
			::Legends.Traits.getID(::Legends.Trait.EagleEyes),
			::Legends.Traits.getID(::Legends.Trait.NightOwl),
			::Legends.Traits.getID(::Legends.Trait.Lucky),
			// ::Legends.Traits.getID(::Legends.Trait.LegendSureShot)
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
			this.Const.Attributes.MeleeDefense
		];
		this.m.IsGuaranteed = ["tough_trait"];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.BeardChance = 75;
		this.m.Level = 3;
		this.m.BackgroundType = this.Const.BackgroundType.Crusader | this.Const.BackgroundType.Combat | this.Const.BackgroundType.OffendedByViolence | this.Const.BackgroundType.Untalented;
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[2];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.MaceTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.TwoHandedTree,
				this.Const.Perks.CleaverTree
				this.Const.Perks.PolearmTree,
				this.Const.Perks.ThrowingTree,
			],
			Defense = [
				this.Const.Perks.LightArmorTree,
				this.Const.Perks.MediumArmorTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.SturdyTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.ViciousTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.MartyrTree,
				this.Const.Perks.FitTree,
				// this.Const.Perks.DeviousTree,
				this.Const.Perks.TrainedTree,
			],
			Enemy = [
				this.Const.Perks.HexenTree,
				this.Const.Perks.NoblesTree
				this.Const.Perks.GhoulTree
			],
			Class = [
				this.Const.Perks.DarkKnightClassTree
			],
			Magic = []
		};
		this.m.CustomPerkTree = [
			[
				::Legends.Perk.Student,
				::Legends.Perk.Pathfinder,
				// ::Legends.Perk.BagsAndBelts,
				// ::Legends.Perk.LegendComposure,
				::Legends.Perk.Adrenaline,
			],
			[
				// ::Legends.Perk.Dodge,
				// ::Legends.Perk.RallyTheTroops,
				::Legends.Perk.LegendTrueBeliever,
			],
			[
				// ::Legends.Perk.LegendFavouredEnemySkeleton,
				// ::Legends.Perk.LegendFavouredEnemyZombie,
				// ::Legends.Perk.LegendFavouredEnemyVampire
			],
			[],
			[
				::Legends.Perk.LegendBattleheart,
				::Legends.Perk.LegendLionheart
			],
			[
				::Legends.Perk.Fearsome,
			],
			[
				::Legends.Perk.LegendPerfectFocus
			],
			[],
			[],
			[],
			[]
		];

	}

	//Default Male
	function setGender(_gender = -1)
	{
		if (_gender == -1) _gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() == "Disabled" ? 0 : ::Math.rand(0, 1);

		if (_gender != 1) return;
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}

	function onBuildDescription()
	{
		return "Wrath and destruction are a salve to %name%, lets hope he can keep those scary thoughts pointed in the right direction.";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				15,
				35
			],
			Bravery = [
				10,
				16
			],
			Stamina = [
				8,
				14
			],
			MeleeSkill = [
				10,
				13
			],
			RangedSkill = [
				-2,
				-3
			],
			MeleeDefense = [
				-5,
				5
			],
			RangedDefense = [
				-10,
				-5
			],
			Initiative = [
				0,
				10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("The Dark Knight");
		::Legends.Traits.grant(this, ::Legends.Trait.Loyal);
		// TODO: give LionHeart trait
		::Legends.Traits.grant(this, ::Legends.Trait.LegendLionheart);

	}

function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Hitpoints] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 3;
		talents[this.Const.Attributes.Bravery] = 1;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();

		items.equip(this.new("scripts/items/weapons/legend_longsword"));

		items.equip(this.Const.World.Common.pickArmor([
			[1, "mail_hauberk"],
			[1, "basic_mail_shirt"],
			[1, "scale_armor"],
			[1, "reinforced_mail_hauberk"],
			[1, "worn_mail_shirt"]
		]));

		local item = this.Const.World.Common.pickHelmet([
			[1, "nasal_helmet"],
			[1, "nasal_helmet_with_mail"],
			[1, "mail_coif"],
			[1, "bascinet_with_mail"],
			[1, "closed_flat_top_helmet"]
		]);
		if (item != null)
		{
			item.onPaint(this.Const.Items.Paint.None);
			items.equip(item);
		}

	}
});
