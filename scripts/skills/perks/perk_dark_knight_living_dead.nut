this.perk_dark_knight_living_dead <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.dark_knight_living_dead";
		this.m.Name = this.Const.Strings.PerkName.DarkKnightLivingDead;
		this.m.Description = this.Const.Strings.PerkDescription.DarkKnightLivingDead;
		this.m.Icon = "ui/perks/perk_dark_knight_living_dead.png";
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
		::logInfo("[Dark Knight Mod] Living Dead perk taken.");
		// BBBUILDER_DEBUG_STOP
		if (!this.m.Container.hasActive("actives.dark_knight_living_dead"))
		{
			this.m.Container.addActive(this.new("scripts/skills/actives/dark_knight_living_dead"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.dark_knight_living_dead");
	}

	function onUpdate(_properties)
	{
		_properties.Hitpoints += 20;
	}

});
