this.perk_dark_knight_vengeance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.dark_knight_vengeance";
		this.m.Name = this.Const.Strings.PerkName.DarkKnightVengeance;
		this.m.Description = this.Const.Strings.PerkDescription.DarkKnightVengeance;
		this.m.Icon = "ui/perks/perk_dark_knight_vengeance.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.SoundOnUse = [];
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.dark_knight_vengeance"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/dark_knight_vengeance_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.dark_knight_vengeance");
	}

	function onUpdate(_properties)
	{
		_properties.Hitpoints += 15;
	}

});