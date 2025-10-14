this.test_stick <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 10
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.test_stick";
		this.m.Name = "Tester's Stick";
		this.m.Description = "A simple wooden stick, usually an improvised weapon.";
		this.m.Categories = "Mace, One-Handed";
		this.m.IconLarge = "weapons/melee/club_01.png";
		this.m.Icon = "weapons/melee/club_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_club_01";
		this.m.Value = 0;
		this.m.Condition = 320.0;
		this.m.ConditionMax = 320.0;
		this.m.StaminaModifier = -6;
		this.m.RegularDamage = 10;
		this.m.RegularDamageMax = 10;
		this.m.ArmorDamageMult = 1;
		this.m.DirectDamageMult = 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/bash"));
		this.addSkill(this.new("scripts/skills/actives/knock_out"));
	}

});

