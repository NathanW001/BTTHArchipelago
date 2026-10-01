extends CanvasLayer

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:archipelago_login.gd"
var archipelago_options_label: Label

func _ready() -> void :
	hide()
	if not FileAccess.file_exists("user://BTTHArchipelago/network_info.sav"):
		return
	else:
		var network_info = FileAccess.open("user://BTTHArchipelago/network_info.sav", FileAccess.READ)
		var network_info_json = JSON.parse_string(network_info.get_as_text())
		network_info.close()
		get_child(-1).get_child(1).get_child(-1).text = network_info_json["server_url"]
		get_child(-1).get_child(2).get_child(-1).text = network_info_json["server_port"]
		get_child(-1).get_child(3).get_child(-1).text = network_info_json["slot_name"]
	
func activate_menu(focus_from: Label) -> void:
	archipelago_options_label = focus_from
	show()
	get_child(-1).give_focus()
