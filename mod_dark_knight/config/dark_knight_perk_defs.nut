// Dark Knight Perk Definitions
::Const.Strings.PerkName.DarkKnightBloodWeapon <- "Blood Weapon";
::Const.Strings.PerkDescription.DarkKnightBloodWeapon <- "Infuse your weapon with the spite of your own injuries!\n\n[color=#4f1800][u]Passive:[/u][/color]\n• Grants [color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] hitpoints.\n\n[color=#4f1800][u]Active:[/u][/color]\n• Unlocks the 'Blood Weapon' active skill. Your next melee attack deals bonus damage equal to 0.2% of your missing total hitpoints, costs 10 of your current hitpoints. Does not work with unarmed.";

::Const.Strings.PerkName.DarkKnightAbyssalDrain <- "Abyssal Drain";
::Const.Strings.PerkDescription.DarkKnightAbyssalDrain <- "Devour the embers of life from the fallen.\n\n[color=#4f1800][u]Passive:[/u][/color]\n• Grants [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] hitpoints.\n\n[color=#4f1800][u]Active:[/u][/color]\n• Unlocks the 'Abyssal Drain' active skill. Destroy a corpse on the battlefield to heal yourself for 5 + 0.2 per point of resolve, remove all injuries, and trigger a morale check for nearby enemies.";

::Const.Strings.PerkName.DarkKnightVengeance <- "Vengeance";
::Const.Strings.PerkDescription.DarkKnightVengeance <- "Your pain fuels your wrath.\n\n[color=#4f1800][u]Passive:[/u][/color]\n• Grants [color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] hitpoints.\n\n[color=#4f1800][u]Active:[/u][/color]\n• Unlocks the \'Vengeance\' active skill which allows you to retaliate against enemies who hit you at the cost of defence for a single round. Retaliation attacks from this skill deal bonus damage equal to your lost hitpoints.";

::Const.Strings.PerkName.DarkKnightLivingDead <- "Living Dead";
::Const.Strings.PerkDescription.DarkKnightLivingDead <- "You are no longer afraid of death.\n\n[color=#4f1800][u]Passive:[/u][/color]\n• Grants [color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] hitpoints.\n\n[color=#4f1800][u]Active:[/u][/color]\n• Unlocks the \'Living Dead\' active skill which allows you to cheat death, surviving a lethal blow with 1 hitpoint instead.";

::Const.Perks.addPerkDefObjects([
	// Dark Knight
	{
		ID = "perk.DarkKnightBloodWeapon",
		Script = "scripts/skills/perks/perk_dark_knight_blood_weapon",
		Name = this.Const.Strings.PerkName.DarkKnightBloodWeapon,
		Tooltip = this.Const.Strings.PerkDescription.DarkKnightBloodWeapon,
		Icon = "ui/perks/perk_dark_knight_blood_weapon.png",
		IconDisabled = "ui/perks/perk_dark_knight_blood_weapon_bw.png",
		Const = "DarkKnightBloodWeapon"
	},
	{
		ID = "perk.DarkKnightAbyssalDrain",
		Script = "scripts/skills/perks/perk_dark_knight_abyssal_drain",
		Name = this.Const.Strings.PerkName.DarkKnightAbyssalDrain,
		Tooltip = this.Const.Strings.PerkDescription.DarkKnightAbyssalDrain,
		Icon = "ui/perks/perk_dark_knight_abyssal_drain.png",
		IconDisabled = "ui/perks/perk_dark_knight_abyssal_drain_bw.png",
		Const = "DarkKnightAbyssalDrain"
	},
	{
		ID = "perk.DarkKnightVengeance",
		Script = "scripts/skills/perks/perk_dark_knight_vengeance",
		Name = this.Const.Strings.PerkName.DarkKnightVengeance,
		Tooltip = this.Const.Strings.PerkDescription.DarkKnightVengeance,
		Icon = "ui/perks/perk_dark_knight_vengeance.png",
		IconDisabled = "ui/perks/perk_dark_knight_vengeance_bw.png",
		Const = "DarkKnightVengeance"
	},
	{
		ID = "perk.DarkKnightLivingDead",
		Script = "scripts/skills/perks/perk_dark_knight_living_dead",
		Name = this.Const.Strings.PerkName.DarkKnightLivingDead,
		Tooltip = this.Const.Strings.PerkDescription.DarkKnightLivingDead,
		Icon = "ui/perks/perk_dark_knight_living_dead.png",
		IconDisabled = "ui/perks/perk_dark_knight_living_dead_bw.png",
		Const = "DarkKnightLivingDead"
	}
]);