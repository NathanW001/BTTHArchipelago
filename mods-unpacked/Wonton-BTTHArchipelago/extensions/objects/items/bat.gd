extends "res://objects/items/bat.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:bat.gd"

func _ready() -> void:
	if Global.archipelago_internal_item_to_location_map[weapon] in Global.archipelago_checked_locations:
		queue_free()
		
	hide_disable()
	var default_texture = load("res://mods-unpacked/Wonton-BTTHArchipelago/overwrites/sprite/objects/postcarditem.png")
	var current_node_sprite = find_child("Sprite2D")
	current_node_sprite.texture = default_texture
	current_node_sprite.hframes = 9
	current_node_sprite.vframes = 1
	current_node_sprite.frame = 0

func collect() -> void :
	colli.set_deferred("disabled", true)
	sfx.stream = item_touch
	sfx.play()
	anim.play("gollect")
	var archipelago_item_id = Global.archipelago_internal_item_to_location_map[weapon]
	Global.client_location_checks([archipelago_item_id])
	await get_tree().create_timer(0.5).timeout
	sfx.stream = item_collect
	await get_tree().create_timer(0.5).timeout
	sfx2.stop()
	await anim.animation_finished
	queue_free()
	#super()
