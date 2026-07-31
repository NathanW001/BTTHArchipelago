extends "res://objects/respawn2.gd"

func _on_area_entered(_area) -> void :
	super(_area)
	#if checked != 1:
	Global.client_location_checks([Global.archipelago_checkpoint_mapping[checkpoint_no]])
		#if !Global.info["checkpoints"].has(checkpoint_no):
			#Global.set_collect("checkpoints", checkpoint_no, snapped(Global.info["playtime"], 0.001))
			#Global.set_collect("checkpoints_deaths", checkpoint_no, Global.info["deaths"])
