extends Button
@export var text_display_box: RichTextLabel

func _ready():
	self.pressed.connect(_on_press)

func _on_press():
	text_display_box.text = "[center][wave] hey, you hit the button!!"
