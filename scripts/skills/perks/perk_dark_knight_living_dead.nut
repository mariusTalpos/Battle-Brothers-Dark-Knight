this.perk_dark_knight_living_dead <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false,
	},

	function isSpent()
	{
		return this.m.IsSpent;
	}

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
	}

	function setSpent( _f )
	{
		if (_f && !this.m.IsSpent)
		{
			this.getContainer().add(this.new("scripts/skills/effects/dark_knight_living_dead_effect"));
		}

		this.m.IsSpent = _f;
	}

	function onCombatStarted()
	{
		this.m.IsSpent = false;
	}

	function onCombatFinished()
	{
		this.m.IsSpent = false;
		this.skill.onCombatFinished();
	}

	function onAdded()
	{
		::logInfo("[Dark Knight Mod] Living Dead perk taken.");
	}

	function onUpdate(_properties)
	{
		_properties.Hitpoints += 20;
	}

});
