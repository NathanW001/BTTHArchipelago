extends Button
const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:connect_button.gd"
@export var text_display_box: RichTextLabel

func _ready():
	self.pressed.connect(_on_press)

func _on_press():
	ModLoaderLog.info("button press", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	
	var url_verify_regex = RegEx.new()
	url_verify_regex.compile("^(?:www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,63}$")
	var server_url = get_node("../../Server/LineEdit").text
	if url_verify_regex.search(server_url) != null:
		Global.archipelago_url = server_url
	else:
		ModLoaderLog.info("bad url", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		text_display_box.text = "[center][shake rate=4 level=2][color=yellow]Malformed Server URL"
		return
	
	var port_verify_regex = RegEx.new()
	port_verify_regex.compile("^[0-9]{1,5}$")
	var server_port = get_node("../../Server2/LineEdit").text
	if port_verify_regex.search(server_port) != null:
		Global.archipelago_port = server_port
	else:
		ModLoaderLog.info("bad port", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		text_display_box.text = "[center][shake rate=4 level=2][color=yellow]Malformed Server Port"
		return
	
	var slot_name = get_node("../../SlotName/LineEdit").text
	if slot_name != "":
		Global.archipelago_connect_packet["name"] = slot_name
	else:
		ModLoaderLog.info("bad slot", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		text_display_box.text = "[center][shake rate=4 level=2][color=yellow]No Slot Name Given"
		return
	
	var slot_password = get_node("../../Password/LineEdit").text
	Global.archipelago_connect_packet["slot_password"] = slot_password
	
		
	text_display_box.text = "[center][color=blue]Awaiting connection to Server..."
	Global.connect_to_archipelago()
	
	while Global.archipelago_authenticated == false and Global.archipelago_connected == true:
		await get_tree().create_timer(0.5).timeout 
		
	if Global.archipelago_authenticated:
		text_display_box.text = "[center][color=green]Server Connected!"
	else:
		text_display_box.text = "[center][color=red]Server could not connect."
