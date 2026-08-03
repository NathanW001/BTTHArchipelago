extends "res://dialogue/balloon.gd"

func collect_bat(bat: String = "pinkbat") -> void :
	var archipelago_item_id = Global.archipelago_internal_item_to_location_map[bat]
	Global.client_location_checks([archipelago_item_id])

func collect_item(item: String = "card_butter") -> void :
	var archipelago_item_id = Global.archipelago_internal_item_to_location_map[item]
	Global.client_location_checks([archipelago_item_id])

func collect_fic(iname: String) -> void :
	var archipelago_item_id = Global.archipelago_internal_item_to_location_map[iname]
	Global.client_location_checks([archipelago_item_id])

func end_game() -> void:
	Global.client_status_update("goal")
	super()
