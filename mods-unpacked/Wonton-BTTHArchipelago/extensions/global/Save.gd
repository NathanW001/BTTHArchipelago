extends "res://global/Save.gd"

func load_data(slot) -> void:
	super(slot)
	Global.archipelago_url = "ws://localhost"
	Global.archipelago_port = 38281
	Global.connect_to_archipelago()
