extends "res://objects/items/collectable.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:object.gd"

func _ready() -> void:
	#super()
	#ModLoaderLog.info(str(find_child("Sprite2D").frame_coords), WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var default_texture = load("res://mods-unpacked/Wonton-BTTHArchipelago/overwrites/sprite/objects/postcarditem.png")
	var current_node_sprite = find_child("Sprite2D")
	current_node_sprite.texture = default_texture
	current_node_sprite.hframes = 9
	current_node_sprite.vframes = 1
	current_node_sprite.frame = 0

func collect() -> void :
	ModLoaderLog.info("wow! item collected! item = " + item_no, WONTON_BTTHARCHIPELAGO_LOG_NAME)
	#ModLoaderLog.info(str(Global.info["collectables"]), WONTON_BTTHARCHIPELAGO_LOG_NAME)
	#ModLoaderLog.info(str(Global.info["collection"]), WONTON_BTTHARCHIPELAGO_LOG_NAME)
	colli.set_deferred("disabled", true)
	sfx.stream = item_touch
	sfx.play()
	anim.play("gollect")
	var archipelago_item_id = Global.archipelago_internal_item_to_location_map[item_no]
	Global.client_location_checks([archipelago_item_id])
	await get_tree().create_timer(0.5).timeout
	sfx.stream = item_collect
	await get_tree().create_timer(0.5).timeout
	sfx2.stop()
	await anim.animation_finished
	queue_free()
	#super()
