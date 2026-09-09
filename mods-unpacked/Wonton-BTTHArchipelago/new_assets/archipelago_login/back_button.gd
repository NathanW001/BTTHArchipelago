extends Button
@export var text_display_box: RichTextLabel
@onready var base_node = $"../../.."

func _ready():
	self.pressed.connect(_on_press)

func _on_press():
	#TODO: this crashes the game when opening menu and pressing escape
	base_node.archipelago_options_label.grab_fous()
	base_node.hide()
