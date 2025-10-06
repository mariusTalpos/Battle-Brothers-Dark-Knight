this.dark_knight_blood_weapon <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.dark_knight_blood_weapon";
		this.m.Name = "Blood Weapon";
		this.m.Description = "Infuse your weapon with the spite of your own injuries! Your next melee attack deals bonus damage at the cost of your own hitpoints. The bonus damage scales with your hitpoints.";
		this.m.Icon = "skills/dark_knight_blood_weapon.png";
		this.m.IconDisabled = "skills/dark_knight_blood_weapon_bw.png";
		this.m.Overlay = "active_blood_weapon";
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
		this.m.HitpointsCost = 10;
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
			},
			// {
			// 	id = 7,
			// 	type = "text",
			// 	icon = "ui/icons/special.png",
			// 	text = "Your next melee attack deals bonus damage equal to 25% of your current hitpoints, but you lose 10% of your current hitpoints."
			// }
		];

		return ret;
	}

	function isHidden()
	{
		// Hide if no melee weapon is equipped or if blood weapon is already active
		// local canUse = ::Legends.Effects.get(this, ::Legends.Effect.LegendKnockbackPrepared);
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local hasMelee = item == null || item.isItemType(this.Const.Items.ItemType.MeleeWeapon);
		return !((!this.Tactical.isActive() || canUse == null) && hasMelee);
	}

	function onUse(_user, _targetTile)
	{
		// BBBUILDER_DEBUG_START
		::logDebug("[Dark Knight Mod] Blood Weapon skill used by " + _user.getName() + ".");
		// BBBUILDER_DEBUG_STOP
		local myTile = _user.getTile();

		// Subtract hitpoints cost (TODO)
		// Add Blood Weapon effect
		this.getContainer().add(this.new("scripts/skills/effects/dark_knight_blood_weapon"));
		return true;
	}

});

