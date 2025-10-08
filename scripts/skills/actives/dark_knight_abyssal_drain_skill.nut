this.dark_knight_abyssal_drain_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ThreatOnHit: 0
	},
	function create() {
		this.m.ID = "actives.dark_knight_abyssal_drain";
		this.m.Name = "Abyssal Drain";
		this.m.Description = "Drain the smoldering embers of life from your slain enemies. Destroy a corpse on the battlefield to heal yourself for 5 + 0.2 per point of resolve, and remove all injuries. Triggers a morale check for nearby enemies.";
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
		_targetTile = _user.getTile();

		::logDebug("[Dark Knight Mod] Abyssal Drain skill used by " + _user.getName() + ".");

		if (_targetTile.IsVisibleForPlayer) {
			if (this.Const.Tactical.GruesomeFeastParticles.len() != 0) { // if we have particle effects defined
				for (local i = 0; i < this.Const.Tactical.GruesomeFeastParticles.len(); i = ++i) { // spawn all defined particle effects
					this.Tactical.spawnParticleEffect(false, this.Const.Tactical.GruesomeFeastParticles[i].Brushes, _targetTile, this.Const.Tactical.GruesomeFeastParticles[i].Delay, this.Const.Tactical.GruesomeFeastParticles[i].Quantity, this.Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, this.Const.Tactical.GruesomeFeastParticles[i].SpawnRate, this.Const.Tactical.GruesomeFeastParticles[i].Stages);
				}
			}

			if (_user.isDiscovered() && (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)) { // only log if the user is discovered and not hidden to player
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " feasts on a corpse");
			}
		}

		if (!_user.isHiddenToPlayer()) { // remove corpse
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onRemoveCorpse, _targetTile);
		} else {
			this.onRemoveCorpse(_targetTile);
		}

		// define resolve, heal amount and threat
		local resolve = _user.getBravery();
		local threatOnHit = this.Math.min(20, this.Math.max(0, resolve * 0.15));
		local healAmount = 5 + (resolve * 0.2); // Example: Heal 5 + 0.2 per point of resolve

		// heal the user and remove injuries
		_user.setHitpoints(this.Math.min(_user.getHitpoints() + healAmount, _user.getHitpointsMax()));

		local skills = _user.getSkills().getAllSkillsOfType(this.Const.SkillType.Injury);
		foreach(s in skills) {
			s.removeSelf();
		}

		_user.onUpdateInjuryLayer();

		// trigger a morale check for all actors on the map within 4 tiles
		local actors = this.Tactical.Entities.getAllInstances(); // get all actors on the map
		foreach(actor in actors) {
			if (actor.getMoraleState() == this.Const.MoraleState.Ignore || !actor.getCurrentProperties().IsAffectedByLosingHitpoints) { // ignore morale immune actors like undead
				continue;
			}
			if (_user.getTile().getDistanceTo(actor.getTile()) > 2)
			{
				continue;
			}
			this.spawnIcon("perk_27", actor.getTile());
			actor.checkMorale(-1, this.Const.Morale.OnHitBaseDifficulty * (1.0 - actor.getHitpoints() / actor.getHitpointsMax()) - threatOnHit);
		}


	}

	function onVerifyTarget(_originTile, _targetTile) {
		if (_targetTile.IsEmpty) {
			return false;
		}

		if (!_targetTile.IsCorpseSpawned) {
			return false;
		}

		if (!_targetTile.Properties.get("Corpse").IsConsumable) {
			return false;
		}

		return true;
	}

	function onRemoveCorpse(_tag) {
		this.Tactical.Entities.removeCorpse(_tag);
		_tag.clear(this.Const.Tactical.DetailFlag.Corpse);
		_tag.Properties.remove("Corpse");
		_tag.Properties.remove("IsSpawningFlies");
	}

});