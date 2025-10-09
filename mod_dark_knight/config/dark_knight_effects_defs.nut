if (!("Effects" in ::DarkKnightOrigin))
	::DarkKnightOrigin.Effects <- {};

if (!("Effect" in ::DarkKnightOrigin))
	::DarkKnightOrigin.Effect <- {};

::DarkKnightOrigin.Effects.EffectDefObjects <- [];

::DarkKnightOrigin.Effects.addEffectDefObjects <- function( _effectDefObjects )
{
	local size = ::DarkKnightOrigin.Effects.EffectDefObjects.len();
	::DarkKnightOrigin.Effects.EffectDefObjects.extend(_effectDefObjects);
	foreach (i, effectDefObjects in _effectDefObjects)
	{
		if (effectDefObjects.Const in ::DarkKnightOrigin.Effect)
			::DarkKnightOrigin.Effect[effectDefObjects.Const] = size + i;
		else
			::DarkKnightOrigin.Effect[effectDefObjects.Const] <- size + i;
	}
}

local effectsDefs = [];

::DarkKnightOrigin.Effect.DarkKnightBloodWeaponEffect <- null;
effectsDefs.push({
	ID = "effects.dark_knight_blood_weapon_prepared",
	Script = "scripts/effects/dark_knight_blood_weapon_effect",
	Const = "DarkKnightBloodWeaponEffect",
	Name = "Blood Weapon Effect",
});

::DarkKnightOrigin.Effects.addEffectDefObjects(effectsDefs);