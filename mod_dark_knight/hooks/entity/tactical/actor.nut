::mods_hookExactClass("entity/tactical/actor", function(o)
{
	o.onDamageReceived = @(__original) function() {
		local livingDeadSkill = this.m.Skills.getSkillByID("perk.dark_knight_living_dead");
		local livingDeadEffect = this.m.Skills.getSkillByID("effects.dark_knight_living_dead");
		if (livingDeadSkill != null && !livingDeadSkill.isSpent()) {
			livingDeadSkill.setSpent(true);
			This.Tactical.Eventlog.logEx(this.Const.UI.getColorizedEntityName(this) + " is too stubborn to die!");
		}
		if (livingDeadSkill != null && livingDeadSkill.isSpent() && livingDeadEffect != null && livingDeadEffect.isActive) {
			local mockingMessages = [
				this.Const.UI.getColorizedEntityName(this) + " slaps away the Reaper's hand!",
				this.Const.UI.getColorizedEntityName(this) + " falls — and rises sharper than before.",
				this.Const.UI.getColorizedEntityName(this) + " bears his wounds like a crown.",
				this.Const.UI.getColorizedEntityName(this) + " is a wound that refuses to close."
				this.Const.UI.getColorizedEntityName(this) + " tells Death to wait."
				this.Const.UI.getColorizedEntityName(this) + " claws out of the abyss, screaming for vengeance!"
			];
			local msg = mockingMessages[this.Math.rand(0, mockingMessages.len() - 1)];
			This.Tactical.Eventlog.logEx(msg);
		}
		__original();
	}
}