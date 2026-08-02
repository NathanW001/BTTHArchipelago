extends CanvasLayer

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:archipelago_login.gd"
var archipelago_options_label: Label

func _ready() -> void :
	hide()
	
func activate_menu(focus_from: Label) -> void:
	archipelago_options_label = focus_from
	show()
	get_child(-1).give_focus()
