::Mod_DarkKnightOrigin <- {
	ID = "dark_knight_origin",
	Name = "DarkKnightOrigin",
	Version = "0.1.0-alpha"
}
::Mod_DarkKnightOrigin.HooksMod <- ::Hooks.register(::Mod_DarkKnightOrigin.ID, ::Mod_DarkKnightOrigin.Version, ::Mod_DarkKnightOrigin.Name);

::Mod_DarkKnightOrigin.HooksMod.require("mod_msu >= 1.2.6", "mod_modern_hooks >= 0.5.4", "mod_legends>= 19.0.0");

::Mod_DarkKnightOrigin.queue(">mod_msu", ">mod_legends", function()
{
	::Mod_DarkKnightOrigin.Mod <- ::MSU.Class.Mod(::Mod_DarkKnightOrigin.ID, ::Mod_DarkKnightOrigin.Version, ::Mod_DarkKnightOrigin.Name);

	::Mod_DarkKnightOrigin.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/mariusTalpos/Battle-Brothers-Dark-Knight");

	::include("mod_dark_knight/load.nut");
	// ::mods_registerJS("./mods/DarkKnightOrigin/index.js");
	// ::mods_registerCSS("./mods/DarkKnightOrigin/index.css");
})