extends "res://global/pause.gd"

func _ready() -> void:
	super()
	Global.instantiate_archipelago_notifications(self)

func _on_menu_actioned(item, _total):
	super(item, _total)
	if item.text == "quit":
		Global.archipelago_client_disconnect_gracefully()
