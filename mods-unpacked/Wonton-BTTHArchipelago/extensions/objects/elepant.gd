extends "res://objects/elepant.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:elepant.gd"

func _ready() -> void:
	#super()
	if Global.archipelago_internal_item_to_location_map[elephant_id] in Global.archipelago_checked_locations:
		queue_free()
	#ModLoaderLog.info(str(find_child("Sprite2D").frame_coords), WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var default_texture = load("res://mods-unpacked/Wonton-BTTHArchipelago/overwrites/sprite/objects/postcarditem.png")
	sprite.texture = default_texture
	sprite.hframes = 9
	sprite.vframes = 1
	sprite.frame = 0

	
func _on_area_entered(_area: Area2D) -> void :
	if active == true:
		sfx.play()
		var archipelago_item_id = Global.archipelago_internal_item_to_location_map[elephant_id]
		Global.client_location_checks([archipelago_item_id])
		collected()
		var p = Particles.elephantcollect.instantiate()
		p.position = position
		add_sibling(p)
