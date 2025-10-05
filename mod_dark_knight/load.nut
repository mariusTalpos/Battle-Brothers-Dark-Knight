// this file is used to load all other files in this mod
// all folders below must be loaded in that order

// load the config folder which contains new Const added by this mod
foreach (file in ::IO.enumerateFiles("mod_dark_knight/config"))
	::include(file);