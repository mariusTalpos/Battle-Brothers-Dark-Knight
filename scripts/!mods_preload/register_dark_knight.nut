::DarkKnightOrigin <- {
	ID = "dark_knight_origin",
	Name = "Dark Knight Origin",
	Version = "0.1.0-alpha"
}
// ::DarkKnightOrigin.HooksMod <- ::Hooks.register(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);

// ::DarkKnightOrigin.HooksMod.require("mod_msu >= 1.2.6", "mod_modern_hooks >= 0.5.4", "mod_legends>= 19.0.0");

// ::DarkKnightOrigin.queue(">mod_msu", ">mod_legends", function()
// {
// 	::DarkKnightOrigin.Mod <- ::MSU.Class.Mod(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);

// 	::DarkKnightOrigin.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/mariusTalpos/Battle-Brothers-Dark-Knight");

// 	::include("mod_dark_knight/load.nut");
// 	// ::mods_registerJS("./mods/DarkKnightOrigin/index.js");
// 	// ::mods_registerCSS("./mods/DarkKnightOrigin/index.css");
// })

local mod = ::Hooks.register(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);
mod.require("mod_msu >= 1.2.6", "mod_modern_hooks >= 0.5.4", "mod_legends>= 19.0.0");
mod.queue(">mod_msu", ">mod_legends", function() {
    ::DarkKnightOrigin.Mod <- ::MSU.Class.Mod(::DarkKnightOrigin.ID, ::DarkKnightOrigin.Version, ::DarkKnightOrigin.Name);
    ::DarkKnightOrigin.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/mariusTalpos/Battle-Brothers-Dark-Knight");
    ::include("mod_dark_knight/load.nut");
    // ::Hooks.registerJS("ui/mods/DarkKnightOrigin/index.js");
    // ::Hooks.registerCSS("ui/mods/DarkKnightOrigin/index.css");
})

// Todo: change the campaign start event image to a dark knight related one