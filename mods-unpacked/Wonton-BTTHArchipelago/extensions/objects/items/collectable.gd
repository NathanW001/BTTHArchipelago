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
	#if fizzy == true:
		#Global.emit_signal("fizzcollect")
	await get_tree().create_timer(0.5).timeout
	#if fizzy:
		#if Global.info["playtime"] < 60:
			#Global.steam.obtain_achievement(4)
		#Global.info["collectables"]["fizzyicecream"] += 1
	#if item_no == "basecap":
		#Global.steam.obtain_achievement(31)
	#Global.set_collect("collection", item_no, Global.info["playtime"])

	sfx2.stop()
	await anim.animation_finished
	#if Global.info["collection"].has("train_ticket") && Global.info["collection"].has("master_key") && Global.info["collection"].has("blades"):
		#Global.steam.obtain_achievement(10)
	#if Global.info["collectables"]["fizzyicecream"] >= 20:
		#var countc = 0
		#for a in Global.info["collection"]:
			#if a.left(9) == "challenge":
				#countc += 1
		#if countc >= 20:
			#Global.steam.obtain_achievement(13)
	queue_free()
