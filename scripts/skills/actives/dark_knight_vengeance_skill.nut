this.dark_knight_vengeance_skill <- this.inherit("scripts/skills/skill", {
	m = {
		HitpointCost = 10, // Cost in hitpoints to use the skill
	},
	function create()
	{
		this.m.ID = "actives.dark_knight_vengeance";
		this.m.Name = "Vengeance";
		this.m.Description = "Your pain fuels your wrath. Retaliate against enemies who hit you at the cost of hitpoints for a single round. Retaliation attacks from this skill deal bonus damage equal to your lost hitpoints.";
		this.m.Icon = "skills/dark_knight_vengeance.png";
		this.m.IconDisabled = "skills/dark_knight_vengeance_bw.png";
		this.m.Overlay = "active_vengeance";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		// this skill costs hitpoints to use, which is handled in onUse(). Might consider adding fatigue cost as well.
		this.m.MinRange = 0;
		this.m.MaxRange = 0;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
		return ret;
	}

	function isUsable() {
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local hasMelee = item.isItemType(this.Const.Items.ItemType.MeleeWeapon);
        return this.getContainer().getActor().getHitpoints() > this.m.HitpointCost && hasMelee && this.skill.isUsable() && !this.getContainer().hasSkill("effects.dark_knight_vengeance");
    }

	function onUse(_user, _targetTile)
	{
		local actor = this.getContainer().getActor();

		_user.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() - this.m.HitpointCost));

		this.getContainer().add(this.new("scripts/skills/effects/dark_knight_vengeance_effect"));
		return true;
	}

});

