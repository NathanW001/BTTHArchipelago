extends "res://objects/respawn2.gd"

func _on_area_entered(_area) -> void :
	super(_area)
	
	if Global.archipelago_checkpointsanity:
		Global.client_location_checks([Global.archipelago_checkpoint_mapping[checkpoint_no]])
