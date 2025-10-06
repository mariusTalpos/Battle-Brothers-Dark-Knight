this.dark_knight_vengeance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.dark_knight_vengeance";
		this.m.Name = "Vengeance";
		this.m.Description = "Your pain fuels your wrath. Retaliate against enemies who hit you at the cost of defence for a single round. Retaliation attacks from this skill deal bonus damage equal to your lost hitpoints.";
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
		this.m.ActionPointCost = 0;
		this.m.HitpointsCost = 0;
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

	function isHidden()
	{
		// Hide if no melee weapon is equipped or if vengeance is already active (TODO)
		// local canUse = ::Legends.Effects.get(this, ::Legends.Effect.LegendKnockbackPrepared);
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local hasMelee = item == null || item.isItemType(this.Const.Items.ItemType.MeleeWeapon);
		return !((!this.Tactical.isActive() || canUse == null) && hasMelee);
	}

	function onUse(_user, _targetTile)
	{
		// BBBUILDER_DEBUG_START
		::logDebug("[Dark Knight Mod] Vengeance skill used by " + _user.getName() + ".");
		// BBBUILDER_DEBUG_STOP
		local myTile = _user.getTile();

		// Subtract hitpoints cost (TODO)
		// Add Vengeance effect
		this.getContainer().add(this.new("scripts/skills/effects/dark_knight_vengeance"));
		return true;
	}

});

