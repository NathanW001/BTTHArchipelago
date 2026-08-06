extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# Initially I opted to call Global.fade_out_notif(self) here, but 
	# I've decided to move it into Global where the notification is created
	# so that if the archipelago disconnects it can display a permanent
	# notification
