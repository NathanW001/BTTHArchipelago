extends "res://objects/location.gd"

func _on_area_2d_body_entered(body: Node2D) -> void :
	super(body)
	Global.client_location_checks([Global.archipelago_location_mapping[location_name]])
