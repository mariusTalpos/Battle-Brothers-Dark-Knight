this.dark_knight_abyssal_drain <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.dark_knight_abyssal_drain";
		this.m.Name = "Abyssal Drain";
		this.m.Description = "Drain the smoldering embers of life from your slain enemies. Destroy a corpse on the battlefield, healing yourself scaling with resolve.";
		this.m.Icon = "skills/dark_knight_abyssal_drain.png";
		this.m.IconDisabled = "skills/dark_knight_abyssal_drain_bw.png";
		this.m.Overlay = "active_abyssal_drain";
		this.m.SoundOnUse = [];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 0;
		this.m.MaxRange = 4;
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

	// TODO: Consume a corpse on the battlefield to heal based on resolve

	function onUse(_user, _targetTile)
	{
		// BBBUILDER_DEBUG_START
		::logDebug("[Dark Knight Mod] Abyssal Drain skill used by " + _user.getName() + ".");
		// BBBUILDER_DEBUG_STOP
		// ...existing code...
	}

});