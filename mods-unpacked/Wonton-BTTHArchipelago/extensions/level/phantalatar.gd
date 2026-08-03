extends "res://level/phantalatar.gd"

func phantcheck():
	if !(Global.archipelago_internal_item_to_location_map["largebat"] in Global.archipelago_checked_locations):
		super()
