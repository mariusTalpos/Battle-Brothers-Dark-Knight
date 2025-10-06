this.perk_dark_knight_abyssal_drain <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.dark_knight_abyssal_drain";
		this.m.Name = this.Const.Strings.PerkName.DarkKnightAbyssalDrain;
		this.m.Description = this.Const.Strings.PerkDescription.DarkKnightAbyssalDrain;
		this.m.Icon = "ui/perks/perk_dark_knight_abyssal_drain.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.SoundOnUse = [];
	}

	function onAdded()
	{
		// BBBUILDER_DEBUG_START
		::logInfo("[Dark Knight Mod] Abyssal Drain perk taken.");
		// BBBUILDER_DEBUG_STOP
		if (!this.m.Container.hasSkill("actives.dark_knight_abyssal_drain"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/dark_knight_abyssal_drain_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.dark_knight_abyssal_drain");
	}

	function onUpdate(_properties)
	{
		_properties.Hitpoints += 5;
	}

});