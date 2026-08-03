extends "res://global/Save.gd"

func load_data(slot) -> void :
	super(slot)
	## Remove duplicate bats
	ModLoaderLog.info(str(Global.info["weapon"]), "test")
	var weapons_owned = []
	for index in range(0, len(Global.info["weapon"])):
		if !(Global.info["weapon"][index] in weapons_owned):
			weapons_owned.append(Global.info["weapon"][index])
	
	Global.info["weapon"] = weapons_owned
	Global.info["equipped"] = 0
	ModLoaderLog.info(str(Global.info["weapon"]), "test2")
