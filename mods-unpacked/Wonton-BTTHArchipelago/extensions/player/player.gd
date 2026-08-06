extends "res://player/player.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:player.gd"

func _ready() -> void:
	super()
	Global.instantiate_archipelago_notifications(self)
	if Global.deathlink:
		Global.register_player_for_deathlink(self)

func tilehit(a, id_no: int = 0):
	var ret = super(a, id_no)
	var can_use_block = true
	if Global.internal_block_id_to_archipelago_item.has(ret):
		var archipelago_block_name = Global.internal_block_id_to_archipelago_item[ret]
		can_use_block = Global.owned_archipelago_items.has(archipelago_block_name)
	if can_use_block:
		return ret
	else:
		return 25
		
func launch():
	var temp_vector = velocity
	super()
	var hits = hitbox.get_collider(0)
	if hits.is_in_group("direction") and "momentum_launcher" not in Global.owned_archipelago_items:
		velocity = temp_vector
		
func _death():
	super()
	var current_timestamp = Time.get_unix_time_from_system()
	if Global.deathlink == true and (current_timestamp - Global.deathlink_last_death) >= 10:
		Global.deathlink_last_death = current_timestamp
		Global.send_deathlink()
	
