::DarkKnightOrigin.HooksMod.hook("scripts/entity/tactical/actor", function(q) {
	q.onDamageReceived = @(__original) function(_attacker, _skill, _hitInfo)
	{
		local livingDeadSkill = this.m.Skills.getSkillByID("perk.dark_knight_living_dead");
		local livingDeadEffect = this.m.Skills.getSkillByID("effects.dark_knight_living_dead");
		local _this = this
		if (livingDeadSkill)
		{
			local originalGetSkillByID = this.m.Skills.getSkillByID
			this.m.Skills.getSkillByID = function(ID)
			{
				if (ID == "perk.nine_lives"){
					if (!livingDeadSkill.isSpent() && _hitInfo.BodyPart != this.Const.BodyPart.Head)
					{
						livingDeadSkill.setSpent(true);
						_hitInfo.BodyDamageMult = 0;
						_this.m.Hitpoints = 1;
						_this.getSkills().removeByType(this.Const.SkillType.DamageOverTime);
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_this) + " is too stubborn to die!");
						return null;
					}
					if (livingDeadSkill.isSpent() && livingDeadEffect != null && livingDeadEffect.isActive && _hitInfo.BodyPart != this.Const.BodyPart.Head)
					{
						_hitInfo.BodyDamageMult = 0;
						_this.m.Hitpoints = 1;
						local mockingMessages = [
							this.Const.UI.getColorizedEntityName(_this) + " slaps away the Reaper's hand!",
							this.Const.UI.getColorizedEntityName(_this) + " falls — and rises sharper than before.",
							this.Const.UI.getColorizedEntityName(_this) + " bears his wounds like a crown.",
							this.Const.UI.getColorizedEntityName(_this) + " is a wound that refuses to close.",
							this.Const.UI.getColorizedEntityName(_this) + " tells Death to wait.",
							this.Const.UI.getColorizedEntityName(_this) + " claws out of the abyss, screaming for vengeance!"
						];
						local msg = mockingMessages[this.Math.rand(0, mockingMessages.len() - 1)];
						this.Tactical.EventLog.logEx(msg);
						return null;
					}
					return originalGetSkillByID("perk.nine_lives")
				}
			}
			local ret = __original(_attacker, _skill, _hitInfo);
			this.m.Skills.getSkillByID = originalGetSkillByID;
			return ret
		}
		::logInfo("[Dark Knight Mod] Conditions for living-dead not met. Calling original onDamageReceived without overrIDe.");
		__original(_attacker, _skill, _hitInfo)
	}
});