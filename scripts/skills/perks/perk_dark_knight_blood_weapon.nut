this.perk_dark_knight_blood_weapon <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.dark_knight_blood_weapon";
		this.m.Name = "Blood Weapon";
		this.m.Description = "Infuse your weapon with the spite of your own injuries!.\n\n[color=#4f1800][u]Passive:[/u][/color]\n• Grants [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] hitpoints.\n\n[color=#4f1800][u]Active:[/u][/color]\n• Unlocks the \'Blood Weapon\' active skill which makes your next melee attack deal bonus damage at the cost of your own hitpoints. \n• The bonus damage scales with your hitpoints.";
		this.m.Icon = "ui/perks/perk_dark_knight_blood_weapon.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.SoundOnUse = [
			// get DRK sounds?
		];
	}

	function onAdded()
	{
		// BBBUILDER_DEBUG_START
		::logInfo("[Dark Knight Mod] Blood Weapon perk taken.");
		// BBBUILDER_DEBUG_STOP
		if (!this.m.Container.hasSkill("actives.dark_knight_blood_weapon"))
		{
			this.m.Container.add(this.new("scrips/skills/actives/dark_knight_blood_weapon_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.dark_knight_blood_weapon");
	}


	function onUpdate( _properties )
	{
		_properties.Hitpoints += 10;
	}


});

