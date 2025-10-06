// if (!("Actives" in ::Mod_DarkKnightOrigin))
// 	::Mod_DarkKnightOrigin.Actives <- {};

// if (!("Active" in ::Mod_DarkKnightOrigin))
// 	::Mod_DarkKnightOrigin.Active <- {};

// ::Mod_DarkKnightOrigin.Actives.ActiveDefObjects <- [];

// ::Mod_DarkKnightOrigin.Actives.addActiveDefObjects <- function( _activeDefObjects )
// {
// 	local size = ::Mod_DarkKnightOrigin.Actives.ActiveDefObjects.len();
// 	::Mod_DarkKnightOrigin.Actives.ActiveDefObjects.extend(_activeDefObjects);
// 	foreach (i, activeDefObject in _activeDefObjects)
// 	{
// 		if (activeDefObject.Const in ::Mod_DarkKnightOrigin.Active)
// 			::Mod_DarkKnightOrigin.Active[activeDefObject.Const] = size + i;
// 		else
// 			::Mod_DarkKnightOrigin.Active[activeDefObject.Const] <- size + i;
// 	}
// }

// local activesDefs = [];

// ::Mod_DarkKnightOrigin.Active.DarkKnightAbyssalDrain <- null
// activesDefs.push({
// 	ID = "actives.dark_knight_abyssal_drain",
// 	Script = "scripts/skills/actives/dark_knight_abyssal_drain_skill",
// 	Const = "DarkKnightAbyssalDrain",
// 	Name = "Abyssal Drain",
// });

// ::Mod_DarkKnightOrigin.Active.DarkKnightBloodWeapon <- null
// activesDefs.push({
// 	ID = "actives.dark_knight_blood_weapon",
// 	Script = "scripts/skills/actives/dark_knight_blood_weapon_skill",
// 	Const = "DarkKnightBloodWeapon",
// 	Name = "Blood Weapon",
// });

// ::Mod_DarkKnightOrigin.Active.DarkKnightVengeance <- null
// activesDefs.push({
// 	ID = "actives.dark_knight_vengeance",
// 	Script = "scripts/skills/actives/dark_knight_vengeance_skill",
// 	Const = "DarkKnightVengeance",
// 	Name = "Vengeance",
// });