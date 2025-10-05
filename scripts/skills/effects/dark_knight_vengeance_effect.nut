this.dark_knight_vengeance_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.dark_knight_vengeance";
		this.m.Name = "Vengeance";
		this.m.Icon = "ui/perks/perk_dark_knight_vengeance.png";
		this.m.IconMini = "dark_knight_vengeance";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character will retaliate against enemies who hit them, dealing bonus damage equal to lost hitpoints.";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}

	function onAdded() {
		if (this.getContainer().getActor().isPlacedOnMap())
			this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());
		this.onRefresh();
	}

	function onDamageReceived(_attacker, _damageHitpoints, _damageArmor)
	{
		local actor = this.getContainer().getActor();
		if (actor == null)
			return;
		// Careful or your own allies might catch a retaliatory strike
		if (_attacker == null || ::Tactical.TurnSequenceBar.isActiveEntity(actor) || actor.getTile().getDistanceTo(_attacker.getTile()) != 1)
			return;

		if (_damageHitpoints >= actor.getHitpoints())
			return;

		if (::Legends.S.skillEntityAliveCheck(actor))
			return;

		// Always retaliate
		local payback = this.getContainer().getAttackOfOpportunity();
		if (payback != null)
		{
			this.getContainer().setBusy(true);
			local attackinfo = {
				User = actor,
				Skill = payback,
				TargetTile = _attacker.getTile(),
				Container = this.getContainer(),
			};
			this.Time.scheduleEvent(this.TimeUnit.Virtual, this.Const.Combat.RiposteDelay, this.onPerformPayback.bindenv(this), attackinfo);
		}
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || ("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
			return;
		if (this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == actor.getID())
			return;
		if (this.m.isPerformingPayback == true)
		{
			// Damage bonus based on missing hitpoints
			local missingHP = actor.getHitpointsMax() - actor.getHitpoints();
			local bonusMult = 1.0 + (missingHP * 0.01); // Example: +1% damage per missing HP
			_properties.DamageTotalMult *= bonusMult;
		}
	}

	function onPerformPayback(_attackinfo)
	{
		_attackinfo.Container.setBusy(false);
		this.m.isPerformingPayback = true;
		if (_attackinfo.User.isAlive() && _attackinfo.TargetTile.getEntity().isAlive())
		{
			return _attackinfo.Skill.attackEntity(_attackinfo.User, _attackinfo.TargetTile.getEntity());
		}
		this.m.isPerformingPayback = false;
	}

});
