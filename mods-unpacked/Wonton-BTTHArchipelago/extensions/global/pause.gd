extends "res://global/pause.gd"

func _ready() -> void:
	super()
	Global.instantiate_archipelago_notifications(self)
