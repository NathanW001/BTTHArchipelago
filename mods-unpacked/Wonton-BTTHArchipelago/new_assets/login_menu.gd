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

	var item = get_focused_item()
	for i in get_children():
		if i == item:
			total = i.get_index()
	if is_instance_valid(item) and event.is_action_pressed("ui_accept"):
		actioned.emit(item, total)


func _process(_delta) -> void :
	if not visible: return
	var item = get_focused_item()
	for i in get_children():
		if i == item:
			total = i.get_index()
	if is_instance_valid(item):
		if total != dog:
			hover.emit(item)
			dog = total





func get_items() -> Array[Control]:
	var items: Array[Control] = []
	for child in get_children():
		if not child is Control: continue
		if "Heading" in child.name: continue
		if "Divider" in child.name: continue
		items.append(child)

	return items


func get_focused_item() -> Control:
	var item = get_viewport().gui_get_focus_owner()
	return item if item in get_children() else null

func update_selection() -> void :
	var item = get_focused_item()
	if is_instance_valid(item) and is_instance_valid(pointer) and visible:
		if item.is_class("RichTextLabel"):
			pointer.global_position = Vector2(368, item.global_position.y + item.size.y * 0.7)
		elif item.is_class("Label"):
			pointer.global_position = Vector2(item.global_position.x - 35, item.global_position.y + 4 + item.size.y * 0.5)
		else:
			if pointerxpos == 0:
				pointer.global_position = Vector2(item.global_position.x - 25, item.global_position.y + item.size.y * 0.5)
			else:
				pointer.position = Vector2(pointerxpos + 600, item.global_position.y + item.size.y * 0.5)



func _on_focus_changed(item: Control) -> void :
	if not item: return
	if not item in get_children(): return
	update_selection()
	
func give_focus() -> void:
	get_child(1).get_child(1).grab_focus()
