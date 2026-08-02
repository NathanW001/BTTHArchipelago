extends "res://player/player.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:player.gd"

func _ready() -> void:
	super()
	Global.instantiate_archipelago_notifications(self)

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
	
#func launch():
	#super()
	#ModLoaderLog.info("bat hit", WONTON_BTTHARCHIPELAGO_LOG_NAME)
