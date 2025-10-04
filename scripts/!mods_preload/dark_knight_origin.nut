::DarkKnightOrigin <- {
	ID = "dark_knight_origin",
	Name = "DarkKnightOrigin",
	Version = "1.0.0"
}
::mods_registerMod(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);

::mods_queue(::DarkKnightOrigin.ID, null, function()
{
	::DarkKnightOrigin.Mod <- ::MSU.Class.Mod(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);
	::mods_registerJS("./mods/DarkKnightOrigin/index.js");
	::mods_registerCSS("./mods/DarkKnightOrigin/index.css");
})