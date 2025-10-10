this.dark_knight_blood_weapon_effect <- this.inherit("scripts/skills/skill", {
	m = {
		AttacksLeft = 1
	},
	function create() {
		this.m.ID = "effects.dark_knight_blood_weapon";
		this.m.Name = "Blood Weapon";
		this.m.Icon = "ui/perks/perk_dark_knight_blood_weapon.png";
		this.m.IconMini = "dark_knight_blood_weapon";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription() {
		return "The blood price has been payed. This character's next melee attack will deal bonus damage scaling with their missing hitpoints"; //TODO: better tooltips
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

	function onAdded() {
		if (this.getContainer().getActor().isPlacedOnMap())
			this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());
		this.onRefresh();
	}

	function onRefresh() {
		this.m.AttacksLeft = 1;
	}

	function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor) {
		// add bonus damage based on missing hitpoints
		--this.m.AttacksLeft;
		if (this.m.AttacksLeft <= 0)
			this.removeSelf();
	}

	function onTargetMissed(_skill, _targetEntity) {

		--this.m.AttacksLeft;
		if (this.m.AttacksLeft <= 0)
			this.removeSelf();
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties) {
		if (_skill.isAttack()) {
			local actor = this.getContainer().getActor();
			local currentHitpoints = actor.getHitpoints(); // this returns current hitpoints, not max
			local hitpointMax = actor.getHitpointsMax(); // this returns actors max HP but without mods like colossus

			// Damage bonus based on missing hitpoints
			local missingHP = hitpointMax - currentHitpoints;
			local bonusMult = 1.0 + (missingHP * 0.002); // Example: +0.2% damage per missing HP
			_properties.DamageTotalMult *= bonusMult; //this works
		}
	}

});