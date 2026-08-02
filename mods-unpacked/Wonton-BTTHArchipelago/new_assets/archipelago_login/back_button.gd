extends Button
@export var text_display_box: RichTextLabel
@onready var base_node = $"../../.."

func _ready():
	self.pressed.connect(_on_press)

func _on_press():
	base_node.archipelago_options_label.grab_focus()
	base_node.hide()
