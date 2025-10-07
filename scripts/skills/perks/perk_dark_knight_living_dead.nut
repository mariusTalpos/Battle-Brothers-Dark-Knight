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

		::logInfo("[Dark Knight Mod] Living Dead perk taken.");

		// TODO: Create Living dead cheat death passive skill similar to 9 lives
		// if (!this.m.Container.hasSkill("actives.dark_knight_living_dead"))
		// {
		// 	// this.m.Container.add(this.new("scripts/skills/actives/dark_knight_living_dead"));
		// }
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
