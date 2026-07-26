extends "res://objects/items/collectable.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:object.gd"

func collect() -> void :
	ModLoaderLog.info("wow! item collected!", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	colli.set_deferred("disabled", true)
	sfx.stream = item_touch
	sfx.play()
	anim.play("gollect")
	await get_tree().create_timer(0.5).timeout
	sfx.stream = item_collect
	await get_tree().create_timer(0.5).timeout
	sfx2.stop()
	await anim.animation_finished
	queue_free()
