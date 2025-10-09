if (!("Actives" in ::DarkKnightOrigin))
	::DarkKnightOrigin.Actives <- {};

if (!("Active" in ::DarkKnightOrigin))
	::DarkKnightOrigin.Active <- {};

::DarkKnightOrigin.Actives.ActiveDefObjects <- [];

::DarkKnightOrigin.Actives.addActiveDefObjects <- function( _activeDefObjects )
{
	local size = ::DarkKnightOrigin.Actives.ActiveDefObjects.len();
	::DarkKnightOrigin.Actives.ActiveDefObjects.extend(_activeDefObjects);
	foreach (i, activeDefObject in _activeDefObjects)
	{
		if (activeDefObject.Const in ::DarkKnightOrigin.Active)
			::DarkKnightOrigin.Active[activeDefObject.Const] = size + i;
		else
			::DarkKnightOrigin.Active[activeDefObject.Const] <- size + i;
	}
}

local activesDefs = [];

::DarkKnightOrigin.Active.DarkKnightAbyssalDrain <- null
activesDefs.push({
	ID = "actives.dark_knight_abyssal_drain",
	Script = "scripts/skills/actives/dark_knight_abyssal_drain_skill",
	Const = "DarkKnightAbyssalDrain",
	Name = "Abyssal Drain",
});

::DarkKnightOrigin.Active.DarkKnightBloodWeapon <- null
activesDefs.push({
	ID = "actives.dark_knight_blood_weapon",
	Script = "scripts/skills/actives/dark_knight_blood_weapon_skill",
	Const = "DarkKnightBloodWeapon",
	Name = "Blood Weapon",
});

::DarkKnightOrigin.Active.DarkKnightVengeance <- null
activesDefs.push({
	ID = "actives.dark_knight_vengeance",
	Script = "scripts/skills/actives/dark_knight_vengeance_skill",
	Const = "DarkKnightVengeance",
	Name = "Vengeance",
});