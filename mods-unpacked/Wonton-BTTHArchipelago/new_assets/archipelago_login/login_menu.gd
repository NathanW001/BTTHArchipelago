extends VBoxContainer

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:login_menu.gd"

signal actioned(item: Control, total: int)
signal hover(item: Control)

@export var pointer: Node
@export var pointerxpos: int = 0

var total: int
var dog: int = -1


func _ready() -> void :
	pass

func _unhandled_input(event) -> void :
	if not visible: return
	if event.is_action_pressed("ui_cancel"):
		get_child(-1).get_child(0)._on_press() # back button, passes off focus properly
	
func give_focus() -> void:
	get_child(1).get_child(1).grab_focus()
