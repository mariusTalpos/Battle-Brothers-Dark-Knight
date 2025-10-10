// this file is used to load all other files in this mod
// all folders below must be loaded in that order

// load the config folder which contains new Const added by this mod
foreach (file in ::IO.enumerateFiles("mod_dark_knight/config"))
	::include(file);

// load hooks folder
foreach (file in ::IO.enumerateFiles("mod_dark_knight/hooks"))
	::include(file);


::logInfo("[Dark Knight Mod] Registered successfully.");


// Ideas for future perks/skills:
// - A passive skill that increases damage dealt to enemies below 50% health
// - A passive that causes corpses to explode when consumed by Abyssal Drain, dealing AoE damage like the flesh golem explosion
	// - This passive can be gained by equipping the Flesh Golem 2H Flail
// - Maybe more passives from killing evil bosses