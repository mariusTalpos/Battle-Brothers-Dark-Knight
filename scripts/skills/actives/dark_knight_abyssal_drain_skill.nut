this.dark_knight_abyssal_drain_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ThreatOnHit = 0
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

	function onVerifyTarget(_originTile, _targetTile) {

		if (!_targetTile.IsCorpseSpawned) {
			return false;
		}

		if (!_targetTile.Properties.get("Corpse").IsConsumable) {
			return false;
		}

		return true;
	}

	function onUse(_user, _targetTile)
	{
		// _targetTile = _user.getTile();
		local userTile = _user.getTile();

		::logDebug("[Dark Knight Mod] Abyssal Drain skill used by " + _user.getName() + ".");

		if (_targetTile.IsVisibleForPlayer) {
			if (this.Const.Tactical.GruesomeFeastParticles.len() != 0) { // if we have particle effects defined
				for (local i = 0; i < this.Const.Tactical.GruesomeFeastParticles.len(); i = ++i) { // spawn all defined particle effects
					this.Tactical.spawnParticleEffect(false, this.Const.Tactical.GruesomeFeastParticles[i].Brushes, _targetTile, this.Const.Tactical.GruesomeFeastParticles[i].Delay, this.Const.Tactical.GruesomeFeastParticles[i].Quantity, this.Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, this.Const.Tactical.GruesomeFeastParticles[i].SpawnRate, this.Const.Tactical.GruesomeFeastParticles[i].Stages);
					this.Tactical.spawnParticleEffect(false, this.Const.Tactical.GruesomeFeastParticles[i].Brushes, userTile, this.Const.Tactical.GruesomeFeastParticles[i].Delay, this.Const.Tactical.GruesomeFeastParticles[i].Quantity, this.Const.Tactical.GruesomeFeastParticles[i].LifeTimeQuantity, this.Const.Tactical.GruesomeFeastParticles[i].SpawnRate, this.Const.Tactical.GruesomeFeastParticles[i].Stages);
				}
			}

			if (_user.isDiscovered() && (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)) { // only log if the user is discovered and not hidden to player
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " drains a corpse");
			}
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
		foreach(i in actors) {
			foreach (actor in i) {
				if (actor.getMoraleState() == this.Const.MoraleState.Ignore || !actor.getCurrentProperties().IsAffectedByLosingHitpoints) { // ignore morale immune actors like undead
					continue;
				}
				if (_targetTile.getDistanceTo(actor.getTile()) > 2 && _user.getTile().getDistanceTo(actor.getTile()) > 2) // only affect actors within 2 tiles of the corpse or user
				{
					continue;
				}
				// consider add a check to ignore self?

				this.spawnIcon("perk_27", actor.getTile());
				actor.checkMorale(-1, this.Const.Morale.OnHitBaseDifficulty * (1.0 - actor.getHitpoints() / actor.getHitpointsMax()) - threatOnHit);
				::logDebug("[Dark Knight Mod] Abyssal Drain: Morale check delivered to actor " + actor.getName());
			}
		}
		this.onRemoveCorpse(_targetTile);

	}

	function onRemoveCorpse(_tag) {
		this.Tactical.Entities.removeCorpse(_tag);
		_tag.clear(this.Const.Tactical.DetailFlag.Corpse);
		_tag.Properties.remove("Corpse");
		_tag.Properties.remove("IsSpawningFlies");
	}

});