::DarkKnightOrigin.HooksMod.hook("scripts/entity/tactical/actor", function(q) {
	q.onDamageReceived = @(__original) function(_attacker, _skill, _hitInfo)
	{
		local livingDeadSkill = this.m.Skills.getSkillByID("perk.dark_knight_living_dead");
		local livingDeadEffect = this.m.Skills.getSkillByID("effects.dark_knight_living_dead");
		local _this = this
		if (livingDeadSkill && _hitInfo.BodyPart != this.Const.BodyPart.Head)
		{
			::logInfo("[Dark Knight Mod] Condition passed: livingDeadSkill present AND hit is not head. Entering living-dead protection block.");
			local originalGetSkillById = this.m.Skills.getSkillByID
			this.m.Skills.getSkillByID = function(id)
			{
				if (id == "effects.lorekeeper_potion"){
					if (!livingDeadSkill.isSpent())
					{
						livingDeadSkill.setSpent(true);
						_hitInfo.BodyDamageMult = 0;
						_this.m.Hitpoints = 1;
						_this.getSkills().removeByType(this.Const.SkillType.DamageOverTime);
						this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(_this) + " is too stubborn to die!");
					}
					if (livingDeadSkill.isSpent() && livingDeadEffect != null && livingDeadEffect.isActive)
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
					}
					return null;
				}
			}
			local ret = __original(_attacker, _skill, _hitInfo); // call original hook
			this.m.Skills.getSkillByID = originalGetSkillById // restore function we switcharoo hooked
			return ret
		}
		::logInfo("[Dark Knight Mod] Conditions for living-dead not met. Calling original onDamageReceived without override.");
		__original(_attacker, _skill, _hitInfo)
	}
});

// if HP <= 0
// if attack is not headshot | _hitInfo.BodyPart != this.Const.BodyPart.Head
// trigger living dead & return null for original

// if living dead active & is headshot trigger original
// if living dead active & is not headshot return null for original