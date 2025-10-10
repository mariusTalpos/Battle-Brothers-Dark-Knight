this.dark_knight_living_dead_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create() {
		this.m.ID = "effects.dark_knight_living_dead";
		this.m.Name = "Living Dead";
		this.m.Icon = "ui/perks/perk_dark_knight_living_dead.png";
		this.m.IconMini = "dark_knight_living_dead";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character cannot be killed unless hit in the head.";
	}

	function getTooltip() {
		return [{
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

	function onUpdate(_properties) {
		local actor = this.getContainer().getActor();
		// actor.setIsAbleToDie(false); // this breaks vengeance compatibility
		local currentHitpoints = actor.getHitpoints(); // this returns current hitpoints, not max
		local hitpointMax = actor.getHitpointsMax(); // this returns actors max HP but without mods like colossus

		// Damage bonus based on missing hitpoints
		local missingHP = hitpointMax - currentHitpoints;
		local bonusMult = 1.0 + (missingHP * 0.002); // Example: +0.2% damage per missing HP
		_properties.DamageTotalMult *= bonusMult; //this works
	}

	function onTurnStart() {
		local actor = this.getContainer().getActor();
		actor.setFatigue(15)
		// actor.setIsAbleToDie(true);
		// this.removeSelf();
	}

});