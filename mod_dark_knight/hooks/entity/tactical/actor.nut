::DarkKnightOrigin.HooksMod.hook("scripts/entity/tactical/actor", function(q)
{
    q.onDamageReceived = @(__original) function(_attacker, _skill, _hitInfo) {
        local livingDeadSkill = this.m.Skills.getSkillByID("perk.dark_knight_living_dead");
        local livingDeadEffect = this.m.Skills.getSkillByID("effects.dark_knight_living_dead");

        ::logInfo("[Dark Knight Mod] Actor HP: " + this.m.Hitpoints);
		if (this.m.CurrentProperties.IsImmuneToCriticals || this.m.CurrentProperties.IsImmuneToHeadshots)
		{
			_hitInfo.BodyDamageMult = 1.0;
		}

		local p = this.m.Skills.buildPropertiesForBeingHit(_attacker, _skill, _hitInfo);
		this.m.Items.onBeforeDamageReceived(_attacker, _skill, _hitInfo, p);
		local dmgMult = p.DamageReceivedTotalMult;

		if (_skill != null)
		{
			dmgMult = dmgMult * (_skill.isRanged() ? p.DamageReceivedRangedMult : p.DamageReceivedMeleeMult);
		}

		_hitInfo.DamageRegular -= p.DamageRegularReduction;
		_hitInfo.DamageArmor -= p.DamageArmorReduction;
		_hitInfo.DamageRegular *= p.DamageReceivedRegularMult * dmgMult;
		_hitInfo.DamageArmor *= p.DamageReceivedArmorMult * dmgMult;
		local armor = 0;
		local armorDamage = 0;

		if (_hitInfo.DamageDirect < 1.0)
		{
			armor = p.Armor[_hitInfo.BodyPart] * p.ArmorMult[_hitInfo.BodyPart];
			armorDamage = this.Math.min(armor, _hitInfo.DamageArmor);
			armor = armor - armorDamage;
			_hitInfo.DamageInflictedArmor = this.Math.max(0, armorDamage);
		}

		_hitInfo.DamageFatigue *= p.FatigueEffectMult;
		this.m.Fatigue = this.Math.min(this.getFatigueMax(), this.Math.round(this.m.Fatigue + _hitInfo.DamageFatigue * p.FatigueReceivedPerHitMult * this.m.CurrentProperties.FatigueLossOnAnyAttackMult));
		local damage = 0;
		damage = damage + this.Math.maxf(0.0, _hitInfo.DamageRegular * _hitInfo.DamageDirect * p.DamageReceivedDirectMult - armor * this.Const.Combat.ArmorDirectDamageMitigationMult);

		if (armor <= 0 || _hitInfo.DamageDirect >= 1.0)
		{
			damage = damage + this.Math.max(0, _hitInfo.DamageRegular * this.Math.maxf(0.0, 1.0 - _hitInfo.DamageDirect * p.DamageReceivedDirectMult) - armorDamage);
		}

		damage = damage * _hitInfo.BodyDamageMult;
		damage = this.Math.max(0, this.Math.max(this.Math.round(damage), this.Math.min(this.Math.round(_hitInfo.DamageMinimum), this.Math.round(_hitInfo.DamageMinimum * p.DamageReceivedTotalMult))));

		if (armorDamage > 0 && !this.isHiddenToPlayer() && _hitInfo.IsPlayingArmorSound)
		{
			local armorHitSound = this.m.Items.getAppearance().ImpactSound[_hitInfo.BodyPart];

			if (armorHitSound.len() > 0)
			{
				this.Sound.play(armorHitSound[this.Math.rand(0, armorHitSound.len() - 1)], this.Const.Sound.Volume.ActorArmorHit, this.getPos());
			}

			if (damage < this.Const.Combat.PlayPainSoundMinDamage)
			{
				this.playSound(this.Const.Sound.ActorEvent.NoDamageReceived, this.Const.Sound.Volume.Actor * this.m.SoundVolume[this.Const.Sound.ActorEvent.NoDamageReceived] * this.m.SoundVolumeOverall);
			}
		}

		::logInfo("[Dark Knight Mod] Calculated Damage: " + damage);

		this.m.Hitpoints = this.Math.round(this.m.Hitpoints - damage);

		::logInfo("[Dark Knight Mod] Actor HP after damage: " + this.m.Hitpoints);

        if (this.m.Hitpoints <= 0){
            ::logDebug("[Dark Knight Mod] Actor HP <= 0, checking Living Dead logic...");
            if (livingDeadSkill != null && !livingDeadSkill.isSpent()) {
                ::logDebug("[Dark Knight Mod] LivingDeadSkill is not spent, setting spent to true.");
                livingDeadSkill.setSpent(true);
                this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + " is too stubborn to die!");
            }
			// This logic does not trigger on subsequent death checks because the IsAbleToDie property makes it impossible to get hit & sets HP to 1
            if (livingDeadSkill != null && livingDeadSkill.isSpent() && livingDeadEffect != null && livingDeadEffect.isActive) {
                local mockingMessages = [
                    this.Const.UI.getColorizedEntityName(this) + " slaps away the Reaper's hand!",
                    this.Const.UI.getColorizedEntityName(this) + " falls — and rises sharper than before.",
                    this.Const.UI.getColorizedEntityName(this) + " bears his wounds like a crown.",
                    this.Const.UI.getColorizedEntityName(this) + " is a wound that refuses to close.",
                    this.Const.UI.getColorizedEntityName(this) + " tells Death to wait.",
                    this.Const.UI.getColorizedEntityName(this) + " claws out of the abyss, screaming for vengeance!"
                ];
                local msg = mockingMessages[this.Math.rand(0, mockingMessages.len() - 1)];
                this.Tactical.EventLog.logEx(msg);
            }
        }
        __original( _attacker, _skill, _hitInfo );
    }
});
