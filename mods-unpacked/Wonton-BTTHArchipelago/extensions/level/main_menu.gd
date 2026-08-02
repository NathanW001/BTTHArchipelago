extends "res://level/main_menu.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:main_menu.gd"
var archipelago_menu = load("res://mods-unpacked/Wonton-BTTHArchipelago/new_assets/archipelago_login/archipelago_login.tscn")
var menu_item_font = load("res://font/Fredoka-SemiBold.ttf")

var archipelago_options: CanvasLayer
var archipelago_options_label: Label

func _on_menu_actioned(item, _total) -> void:
	ModLoaderLog.info("item text = " + item.text, WONTON_BTTHARCHIPELAGO_LOG_NAME)
	if item.text == "archipelago":
		#activated = true
		archipelago_options.activate_menu(archipelago_options_label)
	super(item, _total)

func _ready() -> void :
	var menu_node = find_child("menu")
	archipelago_options_label = Label.new()
	archipelago_options_label.justification_flags = TextServer.JUSTIFICATION_KASHIDA | TextServer.JUSTIFICATION_WORD_BOUND | TextServer.JUSTIFICATION_SKIP_LAST_LINE | TextServer.JUSTIFICATION_DO_NOT_SKIP_SINGLE_LINE
	archipelago_options_label.text = "archipelago"
	archipelago_options_label.add_theme_color_override("font_color", Color("fffdf6"))
	archipelago_options_label.add_theme_color_override("font_shadow_color", Color("888fb2ce"))
	archipelago_options_label.add_theme_constant_override("shadow_offset_x", 3)
	archipelago_options_label.add_theme_constant_override("shadow_offset_y", 3)
	archipelago_options_label.add_theme_font_override("font", menu_item_font)
	archipelago_options_label.add_theme_font_size_override("font_size", 30)
	menu_node.add_child(archipelago_options_label)
	menu_node.move_child(archipelago_options_label, -2)
	
	archipelago_options = archipelago_menu.instantiate()
	archipelago_options.hide()
	archipelago_options_label.add_child(archipelago_options)
	
	super()
