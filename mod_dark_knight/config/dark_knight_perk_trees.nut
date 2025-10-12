// Dark Knight perk groups
::Const.Perks.DarkKnightClassTree <- {
	ID = "DarkKnightClassTree",
	Name = "Dark Knight",
	Descriptions = ["Dark Arts"],
	Tree = [
		[
			::Const.Perks.PerkDefs.DarkKnightBloodWeapon
		],
		[
			::Const.Perks.PerkDefs.DarkKnightAbyssalDrain
		],
		[
			::Const.Perks.PerkDefs.DarkKnightVengeance
		],
		[
			::Const.Perks.PerkDefs.DarkKnightLivingDead
		]
	]
};