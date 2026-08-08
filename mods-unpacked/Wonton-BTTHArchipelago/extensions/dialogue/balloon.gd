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
	var did_win_game = false
	if Global.archipelago_goal == 0:
		Global.client_status_update("goal")
		did_win_game = true
	elif Global.archipelago_goal == 1 and Global.fizzy_increment_counter >= Global.archipelago_fizzies_for_goal:
		Global.client_status_update("goal")
		did_win_game = true
	elif Global.archipelago_goal == 2 and Global.info.checkpoints.size() >= 82:
		Global.client_status_update("goal")
		did_win_game = true
	else:
		var incomplete_goal_notification = ["You do not currently meet the requirements for your goal!"]
		if Global.archipelago_goal == 1:
			incomplete_goal_notification.append(" You have " + str(Global.fizzy_increment_counter - 1) + " out of the " + str(Global.archipelago_fizzies_for_goal) + " required fizzies to meet your goal.")
		elif Global.arhcipelago_goal == 2:
			incomplete_goal_notification.append(" You have " + str(Global.info.checkpoints.size()) + " out of the 82 required checkpoints to meet your goal.")
		var complete_string = "".join(incomplete_goal_notification)
		Global.send_client_notification(complete_string)
	
	if did_win_game: # I HAVE NO IDEA WHY CALLING super() DOESNT WORK BUT IT DOESNT JUST TRUST ME I HAD TO COPY THIS HERE
		var pause = get_tree().get_first_node_in_group("pause")
		await get_tree().create_timer(0.5).timeout
		Global.music_player.swap("Silence")
		pause.process_mode = Node.PROCESS_MODE_DISABLED
		for a in pause.get_children():
			if a.is_class("CanvasLayer"):
				a.hide()
		Global.running = false
		if !Global.info["worldevents"].has("finishedgame"):
			Global.info["worldevents"]["finishedgame"] = Global.info["playtime"]
			Global.info.finaltime = Global._time
			Fade.ending()
			get_tree().paused = not get_tree().paused
		else:
			Global.info.finaltime = Global._time
			Fade.ending()
			get_tree().paused = not get_tree().paused
