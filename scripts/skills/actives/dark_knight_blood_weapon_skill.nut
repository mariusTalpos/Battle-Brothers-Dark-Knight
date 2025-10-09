this.dark_knight_blood_weapon_skill <- this.inherit("scripts/skills/skill", {
	m = {
		HitpointCost = 10, // Cost in hitpoints to use the skill
	},
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
		// this.m.IsStacking = false;
		this.m.IsAttack = false;
		// this.m.IsIgnoredAsAOO = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 0;
		// this.m.HitpointsCost = 10; TODO: Implement hitpoints cost on use
		this.m.FatigueCost = 0;
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
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Your next melee attack deals bonus damage equal to 0.2% of your missing total hitpoints, costs 10 of your current hitpoints. Does not work with unarmed"
			}
		];

		return ret;
	}

	function isUsable() {
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local hasMelee = item.isItemType(this.Const.Items.ItemType.MeleeWeapon);
        return this.getContainer().getActor().getHitpoints() > this.m.HitpointCost && hasMelee && this.skill.isUsable() && !this.getContainer().hasSkill("effects.dark_knight_blood_weapon");
    }

	function onUse(_user, _targetTile)
	{
		local actor = this.getContainer().getActor();

		_user.setHitpoints(this.Math.min(actor.getHitpointsMax(), actor.getHitpoints() - this.m.HitpointCost));

		this.getContainer().add(this.new("scripts/skills/effects/dark_knight_blood_weapon_effect"));
		return true;
	}

});

