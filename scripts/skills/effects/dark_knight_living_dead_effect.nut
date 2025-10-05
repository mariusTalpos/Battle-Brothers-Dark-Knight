this.dark_knight_living_dead_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.dark_knight_living_dead";
		this.m.Name = "Living Dead";
		this.m.Icon = "ui/perks/perk_dark_knight_living_dead.png";
		this.m.IconMini = "dark_knight_living_dead";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character can cheat death, surviving a lethal blow with 1 hitpoint instead.";
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

	function onRefresh() {
		// ...existing code...
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor) {
		// ...existing code...
	}

	function onTargetMissed(_skill, _targetEntity) {
		// ...existing code...
	}

});
