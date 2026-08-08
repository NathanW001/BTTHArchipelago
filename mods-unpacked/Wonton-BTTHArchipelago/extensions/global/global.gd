extends "res://global/global.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:global.gd"

const archipelago_overlay = preload("res://mods-unpacked/Wonton-BTTHArchipelago/new_assets/archipelago_overlay/archipelago_overlay.tscn")
const archipelago_notification= preload("res://mods-unpacked/Wonton-BTTHArchipelago/new_assets/archipelago_overlay/archipelago_notification.tscn")

var archipelago_internal_item_to_location_map = {
	## Fizzies
	"challenge_1": 1, # "Fizzy - left of Mola Town"
	"challenge_18": 2, # "Fizzy - on the climb to Jalta Dregs"
	"challenge_2": 3, # "Fizzy - hidden pit in Belwheat Valley"
	"challenge_3": 4, # "Fizzy - at the top of the GC Warehouse"
	"challenge_4": 5, # "Fizzy - above a checkpoint in the Entrance Ruins"
	"challenge_5": 6, # "Fizzy - platforming puzzle in the top left of the Entrance Ruins"
	"challenge_6": 7, # "Fizzy - lava tunnel in the GC Factory"
	"challenge_7": 8, # "Fizzy - island on the Cliff Face"
	"challenge_8": 9, # "Fizzy - platforming puzzle in the top right of the Forest Cavern"
	"challenge_9": 10, # "Fizzy - platforming puzzle at the end of the Eroded Beach"
	"challenge_11": 11, # "Fizzy - platform above Observer in Port Naga"
	"challenge_10": 12, # "Fizzy - isolated platform to the left of Port Naga"
	"challenge_19": 13,  # "Fizzy - baseball minigame in Port Naga"
	"challenge_20": 14, # "Fizzy - jellon minigame in Port Naga"
	"challenge_12": 15, # "Fizzy - at the entrance to the puzzle in the top of Basin 21"
	"challenge_13": 16, # "Fizzy - at the end of the long platforming puzzle in Basin 21"
	"challenge_14": 17, # "Fizzy - underneath the Phant room in Pastel Strata"
	"challenge_15": 18, # "Fizzy - puzzle in the middle of the Precipice Bridge"
	"challenge_16": 19, # "Fizzy - behind the glass at the end of the Precipice Bridge"
	"challenge_17": 20, # "Fizzy - hidden room behind a checkpoint in Villith's Drain"
	## Postcards
	"map_mola_town": 10000,
	"map_belwheat_valley": 10001,
	"map_gc_warehouse": 10002,
	"map_entrance_ruins": 10003,
	"map_gc_factory": 10004,
	"map_forest_cavern": 10005,
	"map_eroded_beach": 10006,
	"map_port_naga": 10007,
	"map_basin_21": 10008,
	"map_pastel_strata": 10009,
	"map_precipice_bridge": 10010,
	"map_villiths_drain": 10011,
	"card_butter": 10012,
	## Phants
	"phant_1": 20000,
	"phant_2": 20001,
	"phant_4": 20002,
	"phant_3": 20003,
	"phant_5": 20004,
	"phant_0": 20005,
	"phant_6": 20006,
	## Equipment
	"map_log": 30000,
	"master_key": 30001,
	"train_ticket": 30002,
	"blades": 30003,
	"basecap": 30004,
	## Bats
	"bat": 40000,
	"angelbat": 40001,
	"fizzybat": 40002,
	"largebat": 40003,
	"godbat": 40004,
	"pinkbat": 40005,
}
var archipelago_item_to_internal_item_map = {
	## Bats
	1: "bat",
	2: "angelbat",
	3: "fizzybat",
	4: "largebat",
	5: "godbat",
	6: "pinkbat",
	## Collectable
	10000: "challenge_", # Fizzy, will append number later
	10001: "phant_",
	10002: "map_mola_town",
	10003: "map_belwheat_valley",
	10004: "map_gc_warehouse",
	10005: "map_entrance_ruins",
	10006: "map_gc_factory",
	10007: "map_forest_cavern",
	10008: "map_eroded_beach",
	10009: "map_port_naga",
	10010: "map_basin_21",
	10011: "map_pastel_strata",
	10012: "map_precipice_bridge",
	10013: "map_villiths_drain",
	10014: "card_butter",
	## Equipment
	20000: "map_log",
	20001: "master_key",
	20002: "train_ticket",
	20003: "blades",
	20004: "basecap",
	20005: "ball_power", # Archipelago item
	20006: "wave_dash_power", # Archipelago item
	## World Blocks
	30000: "yellow_fence", # Archipelago item
	30001: "jump_block", # Archipelago item
	30002: "momentum_launcher", # Archipelago item
	30003: "vector_block", # Archipelago item
	30004: "charge_block", # Archipelago item
	30005: "super_jump_block", # Archipelago item
	30006: "float_block", # Archipelago item
}
var fizzy_increment_counter = 0
var phant_increment_counter = 0

var archipelago_location_mapping = {
	"Mola Town": 50000,
	"Belwheat Valley": 50001,
	"GC Warehouse": 50002,
	"Entrance Ruins": 50003,
	"Goldcherry Factory": 50004,
	"Cliff Face": 50005,
	"Forest Cavern": 50006,
	"Eroded Beach": 50007,
	"Port Naga": 50008,
	"Basin 21": 50009,
	"Pastel Strata": 50010,
	"Astral Tower": 50011,
	"Precipice Bridge": 50012,
	"Terminus": 50013,
	"Heaven's Channel": 50014,
	"Jalta Dregs": 50015,
	"Creacher Cave": 50016,
	"Terminal Station": 50017,
	"Abandoned District": 50018,
	"Power Room": 50019,
	"Villith's Drain": 50020,
	"False Field": 50021,
	"Plateau Underside": 50022,
	"Satellite Ranch": 50023,
	"Sand Hell": 50024,
	"???": 50025,
	"Drain Room": 50026,
	"Edifice Roots": 50027,
	"Third Cistern": 50028,
}

var archipelago_checkpoint_mapping = {
	##Mola Town
	"checkpoint0_1": 60000,
	"checkpoint0_2": 60001,
	## Belwheat Valley
	"checkpoint1_1": 60002,
	"checkpoint1_2": 60003,
	"checkpoint1_3": 60004,
	"checkpoint1_4": 60005,
	## GC Warehouse
	"checkpoint2_1": 60006,
	"checkpoint2_2": 60007,
	"checkpoint2_3": 60008,
	"checkpoint2_4": 60009,
	"checkpoint2_5": 60010,
	"checkpoint2_6": 60011,
	## Entrance Ruins
	"checkpoint3_1": 60012,
	"checkpoint3_2": 60013,
	"checkpoint3_3": 60014,
	## GC Factory
	"checkpoint4_1": 60015,
	"checkpoint4_2": 60016,
	"checkpoint4_3": 60017,
	"checkpoint4_4": 60018,
	"checkpoint4_5": 60019,
	"checkpoint4_6": 60020,
	## Forest Cavern
	"checkpoint5_1": 60021,
	"checkpoint5_2": 60022,
	"checkpoint5_3": 60023,
	"checkpoint5_4": 60024,
	"checkpoint5_5": 60025,
	## Eroded Beach
	"checkpoint6_1": 60026,
	"checkpoint6_2": 60027,
	"checkpoint6_3": 60028,
	"checkpoint6_4": 60029,
	"checkpoint6_5": 60030,
	"checkpoint6_6": 60031,
	## Port Naga
	"checkpointN_1": 60032,
	"checkpointN_2": 60033,
	## Basin 21
	"checkpoint7_1": 60034,
	"checkpoint7_2": 60035,
	"checkpoint7_3": 60036,
	"checkpoint7_4": 60037,
	"checkpoint7_5": 60038,
	"checkpoint7_6": 60039,
	"checkpoint7_7": 60040,
	## Pastel Strata
	"checkpoint8_1": 60041,
	"checkpoint8_2": 60042,
	"checkpoint8_3": 60043,
	"checkpoint8_4": 60044,
	"checkpoint8_5": 60045,
	"checkpoint8_6": 60046,
	"checkpoint8_7": 60047,
	"checkpoint8_8": 60048,
	"checkpoint8_9": 60049,
	## Precipice Bridge
	"checkpoint9_1": 60050,
	"checkpoint9_2": 60051,
	"checkpoint9_3": 60052,
	"checkpoint9_4": 60053,
	"checkpoint9_5": 60054,
	"checkpoint9_6": 60055,
	"checkpoint9_7": 60056,
	"checkpoint9_8": 60057,
	"checkpoint9_9": 60058,
	## Terminus
	"checkpoint10_1": 60059,
	"checkpoint10_2": 60060,
	## Villith's Drain
	"checkpointU_1": 60061,
	"checkpointU_2": 60062,
	"checkpointU_3": 60063,
	"checkpointU_4": 60064,
	"checkpointU_5": 60065,
	"checkpointU_6": 60066,
	"checkpointU_7": 60067,
	"checkpointU_8": 60068,
	"checkpointU_9": 60069,
	"checkpointU_10": 60070,
	"checkpointU_11": 60071,
	## Ediface Roots
	"checkpoint_X_1": 60072,
	"checkpoint_X_2": 60073,
	"checkpoint_X_3": 60074,
	"checkpoint_X_4": 60075,
	"checkpoint_X_5": 60076,
	"checkpoint_X_6": 60077,
	"checkpoint_X_7": 60078,
	"checkpoint_X_8": 60079,
	"checkpoint_X_9": 60080,
	"checkpoint_X_10": 60081,
}
var archipelago_inverse_checkpoint_mapping = {60000: 'checkpoint0_1', 60001: 'checkpoint0_2', 60002: 'checkpoint1_1', 60003: 'checkpoint1_2', 60004: 'checkpoint1_3', 60005: 'checkpoint1_4', 60006: 'checkpoint2_1', 60007: 'checkpoint2_2', 60008: 'checkpoint2_3', 60009: 'checkpoint2_4', 60010: 'checkpoint2_5', 60011: 'checkpoint2_6', 60012: 'checkpoint3_1', 60013: 'checkpoint3_2', 60014: 'checkpoint3_3', 60015: 'checkpoint4_1', 60016: 'checkpoint4_2', 60017: 'checkpoint4_3', 60018: 'checkpoint4_4', 60019: 'checkpoint4_5', 60020: 'checkpoint4_6', 60021: 'checkpoint5_1', 60022: 'checkpoint5_2', 60023: 'checkpoint5_3', 60024: 'checkpoint5_4', 60025: 'checkpoint5_5', 60026: 'checkpoint6_1', 60027: 'checkpoint6_2', 60028: 'checkpoint6_3', 60029: 'checkpoint6_4', 60030: 'checkpoint6_5', 60031: 'checkpoint6_6', 60032: 'checkpointN_1', 60033: 'checkpointN_2', 60034: 'checkpoint7_1', 60035: 'checkpoint7_2', 60036: 'checkpoint7_3', 60037: 'checkpoint7_4', 60038: 'checkpoint7_5', 60039: 'checkpoint7_6', 60040: 'checkpoint7_7', 60041: 'checkpoint8_1', 60042: 'checkpoint8_2', 60043: 'checkpoint8_3', 60044: 'checkpoint8_4', 60045: 'checkpoint8_5', 60046: 'checkpoint8_6', 60047: 'checkpoint8_7', 60048: 'checkpoint8_8', 60049: 'checkpoint8_9', 60050: 'checkpoint9_1', 60051: 'checkpoint9_2', 60052: 'checkpoint9_3', 60053: 'checkpoint9_4', 60054: 'checkpoint9_5', 60055: 'checkpoint9_6', 60056: 'checkpoint9_7', 60057: 'checkpoint9_8', 60058: 'checkpoint9_9', 60059: 'checkpoint10_1', 60060: 'checkpoint10_2', 60061: 'checkpointU_1', 60062: 'checkpointU_2', 60063: 'checkpointU_3', 60064: 'checkpointU_4', 60065: 'checkpointU_5', 60066: 'checkpointU_6', 60067: 'checkpointU_7', 60068: 'checkpointU_8', 60069: 'checkpointU_9', 60070: 'checkpointU_10', 60071: 'checkpointU_11', 60072: 'checkpoint_X_1', 60073: 'checkpoint_X_2', 60074: 'checkpoint_X_3', 60075: 'checkpoint_X_4', 60076: 'checkpoint_X_5', 60077: 'checkpoint_X_6', 60078: 'checkpoint_X_7', 60079: 'checkpoint_X_8', 60080: 'checkpoint_X_9', 60081: 'checkpoint_X_10'}

var internal_block_id_to_archipelago_item = {
	7: "yellow_fence",
	# 15 is sand
	1: "jump_block",
	21: "jump_block",
	# 5 is red x
	# 6 and 25 are purple block
	12: "charge_block",
	32: "charge_block",
	14: "charge_block",
	13: "super_jump_block",
	33: "super_jump_block",
	3: "vector_block",
	23: "vector_block",
}

var all_archipelago_items = ["ball_power", "wave_dash_power", "yellow_fence", "jump_block",
							 "momentum_launcher", "vector_block", "charge_block",
							 "super_jump_block", "float_block"]
var owned_archipelago_items = []

var archipelago_missing_locations = []
var archipelago_checked_locations = []
var deathlink = false
var deathlink_player_object: Object
var deathlink_last_death = Time.get_unix_time_from_system()

var archipelago_url = ""
var archipelago_port = -1
var archipelago_web_socket = WebSocketPeer.new()
var archipelago_connection_established = false # Connection parameters are valid
var archipelago_connected = false # Connection to socket worked and not immediately terminated
var archipelago_data_package_requested = false # sent request for GetDataPackage
var archipelago_data_package_received = false # set true after we've gotten the data package
var archipelago_auth_attempted = false # set true after Conncet packet is sent to server
var archipelago_authenticated = false # set true after server accepts Conncet packet and send Connected back
var archipelago_gamestate_loaded = false # set true inside of Global.newgame() (i think?), ok to set player item values if true
var archipelago_hint_points = 0
var archipelago_goal = 0
var archipelago_fizzies_for_goal = -1
var archipelago_slot = -1
var archipelago_checkpointsanity = false


var archipelago_notification_parent: Node = null

var archipelago_server_command_buffer = []

var archipelago_notification_queue = []

var archipelago_data_package = {}

var archipelago_ws_connection_attempted = false

var last_keepalive_bounce_timestamp = Time.get_unix_time_from_system()

signal archipelago_data_package_received_signal

var archipelago_json_color_open_mapping = {
	"bold": ["[b]", "[/b]"],
	"underline": ["[u]", "[/u]"],
	"black": ["", ""], # left unmapped bc it looks bad
	"red": ["[color=red]", "[/color]"],
	"green": ["[color=green]", "[/color]"],
	"yellow": ["[color=yellow]", "[/color]"],
	"blue": ["[color=blue]", "[/color]"],
	"magenta": ["[color=magenta]", "[/color]"],
	"cyan": ["[color=cyan]", "[/color]"],
	"white": ["[color=white]", "[/color]"],
}

var archipelago_player_slot_info = {}

var archipelago_network_version = {
	"class": "Version",
	"major": 0,
	"minor": 6,
	"build": 7,
}

var archipelago_connect_packet = {
	"cmd": "Connect",
	"password": "",
	"game": "Bat to the Heavens",
	"name": "",
	"uuid": "",
	"version": archipelago_network_version,
	"items_handling": 0b111,
	"tags": [],
	"slot_data": true,
}

func _ready() -> void:
	archipelago_web_socket.set_inbound_buffer_size(655350)
	process_mode = Node.PROCESS_MODE_ALWAYS # Needed for network features. Will only run super in _process if not paused
	super()
	
func newgame() -> void:
	super()
	Global.archipelago_gamestate_loaded = true
	for location in archipelago_checked_locations:
		location = int(location)
		if location >= 60000:
			var location_checkpoint_name = archipelago_inverse_checkpoint_mapping[location]
			set_collect("checkpoints", location_checkpoint_name, 1.0)
			set_collect("checkpoints_deaths", location_checkpoint_name, 0.0)
			Global.info["currentcheckpoint"] = location_checkpoint_name

func instantiate_archipelago_notifications(base_scene: Node) -> void: 
	var archipelago_notifs = archipelago_overlay.instantiate()
	base_scene.add_child(archipelago_notifs)
	archipelago_notification_parent = archipelago_notifs.get_child(0)
	
func register_player_for_deathlink(player: Object) -> void:
	deathlink_player_object = player

func fade_out_notif(notif: Node) -> void:
	await get_tree().create_timer(5).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(notif, "modulate", Color.TRANSPARENT, 1.0)
	#tween.tween_callback(notif.queue_free)
	await get_tree().create_timer(1).timeout
	if is_instance_valid(notif):
		notif.queue_free()

func connect_to_archipelago() -> void:
	if !archipelago_connected and !archipelago_ws_connection_attempted:
		ModLoaderLog.info("attempting ws connection", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		var err = archipelago_web_socket.connect_to_url("ws://" + archipelago_url + ":" + str(archipelago_port))
		if err == OK:
			archipelago_connection_established = true
		else:
			archipelago_server_disconnect_unexpected()
	elif !archipelago_connected and archipelago_ws_connection_attempted:
		ModLoaderLog.info("attempting wss connection", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		var err = archipelago_web_socket.connect_to_url("wss://" + archipelago_url + ":" + str(archipelago_port))
		if err == OK:
			archipelago_connection_established = true
		else:
			archipelago_server_disconnect_unexpected()
			
func _process(_delta):
	if !(get_tree().paused):
		super(_delta) # Global was originally only run if not paused, so to maintain this we only run super() if the game isn't paused
		
	if archipelago_notification_parent != null:
		while len(archipelago_notification_queue) > 0:
			var notif = archipelago_notification_queue.pop_front()
			archipelago_notification_parent.add_child(notif)
			
	if archipelago_connection_established and !archipelago_connected:
		archipelago_web_socket.poll()
		var state = archipelago_web_socket.get_ready_state()
		if state == WebSocketPeer.STATE_OPEN:
			archipelago_connected = true
		elif state == WebSocketPeer.STATE_CLOSED:
			if archipelago_ws_connection_attempted:
				archipelago_server_disconnect_unexpected()
			else:
				archipelago_ws_connection_attempted = true
				connect_to_archipelago()
			
	if archipelago_connected:
		if archipelago_authenticated and archipelago_gamestate_loaded:
			for command in archipelago_server_command_buffer:
				ModLoaderLog.info("running buffer command", WONTON_BTTHARCHIPELAGO_LOG_NAME)
				process_server_command(command)
			archipelago_server_command_buffer = []
		if archipelago_authenticated:
			var current_timestamp = Time.get_unix_time_from_system()
			if (current_timestamp - last_keepalive_bounce_timestamp) > 10:
				last_keepalive_bounce_timestamp = current_timestamp
				send_keep_alive_bounce()
		archipelago_web_socket.poll()
		var state = archipelago_web_socket.get_ready_state()
		# `WebSocketPeer.STATE_OPEN` means the socket is connected and ready
		# to send and receive data.
		if state == WebSocketPeer.STATE_OPEN:
			while archipelago_web_socket.get_available_packet_count():
				var packet = archipelago_web_socket.get_packet()
				if archipelago_web_socket.was_string_packet():
					var packet_text = packet.get_string_from_utf8()
					#ModLoaderLog.info("< Got text data from server: %s" % packet_text, WONTON_BTTHARCHIPELAGO_LOG_NAME)
					server_process_raw_json(packet_text)
				else:
					#ModLoaderLog.info("< Got binary data from server: %d bytes" % packet.size(), WONTON_BTTHARCHIPELAGO_LOG_NAME)
					pass
			if !archipelago_data_package_requested:
				client_get_data_package(["Bat to the Heavens"])
			elif !archipelago_auth_attempted and archipelago_data_package_requested:
				client_connect()
			

		# `WebSocketPeer.STATE_CLOSING` means the socket is closing.
		# It is important to keep polling for a clean close.
		elif state == WebSocketPeer.STATE_CLOSING:
			pass

		# `WebSocketPeer.STATE_CLOSED` means the connection has fully closed.
		# It is now safe to stop polling.
		elif state == WebSocketPeer.STATE_CLOSED:
			# The code will be `-1` if the disconnection was not properly notified by the remote peer.
			var code = archipelago_web_socket.get_close_code()
			ModLoaderLog.info("WebSocket closed with code: %d. Clean: %s" % [code, code != -1], WONTON_BTTHARCHIPELAGO_LOG_NAME)
			archipelago_server_disconnect_unexpected()

func server_process_raw_json(json_string):
	var json = JSON.new()
	var err = json.parse(json_string)
	if err == OK:
		var data_received = json.data
		for command in data_received:
			if !archipelago_authenticated or !archipelago_gamestate_loaded:
				if command["cmd"] == "Connected" or command["cmd"] == "ConnectionRefused" or command["cmd"] == "DataPackage":
					process_server_command(command)
				else:
					archipelago_server_command_buffer.append(command)
			else:
				process_server_command(command)
	else:
		ModLoaderLog.error("JSON Parse error from WebSocket message", WONTON_BTTHARCHIPELAGO_LOG_NAME)

func process_server_command(command):
	match command["cmd"]:
		"RoomInfo":
			server_room_info(command)
		"ConnectionRefused":
			server_connection_refused(command)
		"Connected":
			server_connected(command)
		"ReceivedItems":
			server_received_items(command)
		"LocationInfo":
			server_location_info(command)
		"RoomUpdate":
			server_room_update(command)
		"PrintJSON":
			server_print_json(command)
		"DataPackage":
			server_data_package(command)
		"Bounced":
			server_bounced(command)
		"InvalidPacket":
			server_invalid_packet(command)
		"Retrieved":
			server_retrieved(command)
		"SetReply":
			server_set_reply(command)
			
func send_keep_alive_bounce() -> void:
	client_bounce(null, [archipelago_slot], null, null)

func archipelago_client_disconnect_gracefully() -> void:
	archipelago_web_socket.close(1000, "Client requested disconnect.")
	archipelago_url = ""
	archipelago_port = -1
	archipelago_web_socket = WebSocketPeer.new()
	archipelago_connection_established = false
	archipelago_connected = false # Connection to socket established
	archipelago_ws_connection_attempted = false
	archipelago_data_package_requested = false # sent request for GetDataPackage
	archipelago_data_package_received = false # set true after we've gotten the data package
	archipelago_auth_attempted = false # set true after Conncet packet is sent to server
	archipelago_authenticated = false # set true after server accepts Conncet packet and send Connected back
	archipelago_gamestate_loaded = false # set true inside of Global.newgame() (i think?), ok to set player item values if true
	archipelago_hint_points = 0
	archipelago_goal = 0
	archipelago_fizzies_for_goal = -1
	archipelago_checkpointsanity = false
	owned_archipelago_items = []
	archipelago_missing_locations = []
	archipelago_checked_locations = []
	deathlink = false
	deathlink_player_object = null
	deathlink_last_death = Time.get_unix_time_from_system()
	archipelago_notification_parent = null
	archipelago_server_command_buffer = []
	archipelago_notification_queue = []
	archipelago_data_package = {}
	archipelago_player_slot_info = {}
	archipelago_connect_packet = {
		"cmd": "Connect",
		"password": "",
		"game": "Bat to the Heavens",
		"name": "",
		"uuid": "",
		"version": archipelago_network_version,
		"items_handling": 0b111,
		"tags": [],
		"slot_data": true,
	}
	
func archipelago_server_disconnect_unexpected() -> void:
	if archipelago_notification_parent != null:
		var archipelago_notification_node = archipelago_notification.instantiate()
		archipelago_notification_node.text = "[color=red]Unexpected Archipelago disconnect. Please exit the game and reconnect from the main menu.[/color]" 
		archipelago_notification_parent.add_child(archipelago_notification_node)
	archipelago_web_socket.close(-1)
	archipelago_url = ""
	archipelago_port = -1
	archipelago_web_socket = WebSocketPeer.new()
	archipelago_connection_established = false
	archipelago_connected = false # Connection to socket established
	archipelago_ws_connection_attempted = false
	archipelago_data_package_requested = false # sent request for GetDataPackage
	archipelago_data_package_received = false # set true after we've gotten the data package
	archipelago_auth_attempted = false # set true after Conncet packet is sent to server
	archipelago_authenticated = false # set true after server accepts Conncet packet and send Connected back
	archipelago_gamestate_loaded = false # set true inside of Global.newgame() (i think?), ok to set player item values if true
	archipelago_hint_points = 0
	archipelago_goal = 0
	archipelago_fizzies_for_goal = -1
	archipelago_checkpointsanity = false
	owned_archipelago_items = []
	archipelago_missing_locations = []
	archipelago_checked_locations = []
	deathlink = false
	deathlink_player_object = null
	deathlink_last_death = Time.get_unix_time_from_system()
	archipelago_notification_parent = null
	archipelago_server_command_buffer = []
	archipelago_notification_queue = []
	archipelago_data_package = {}
	archipelago_player_slot_info = {}
	archipelago_connect_packet = {
		"cmd": "Connect",
		"password": "",
		"game": "Bat to the Heavens",
		"name": "",
		"uuid": "",
		"version": archipelago_network_version,
		"items_handling": 0b111,
		"tags": [],
		"slot_data": true,
	}
	
func send_client_notification(text: String) -> void:
	var archipelago_notification_node = archipelago_notification.instantiate()
	archipelago_notification_node.text = text
	archipelago_notification_queue.append(archipelago_notification_node)
	Global.fade_out_notif(archipelago_notification_node)
	
	
func send_deathlink():
	var tags = ["DeathLink"]
	var data = {"time": int(Time.get_unix_time_from_system()), "source": archipelago_connect_packet["name"]}
	client_bounce(null, null, tags, data)

## Functions for Receiveing from Server
func server_room_info(json_data):
	ModLoaderLog.info("Received command \"RoomInfo\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass

func server_connection_refused(json_data):
	ModLoaderLog.info("Received command \"ConnectionRefused\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	archipelago_server_disconnect_unexpected()
	ModLoaderLog.info("Connection refused by server.", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	
func server_connected(json_data):
	ModLoaderLog.info("Received command \"Connected\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	archipelago_authenticated = true
	archipelago_slot = json_data["slot"]
	for location in json_data["missing_locations"]:
		archipelago_missing_locations.append(int(location))
	for location in json_data["checked_locations"]:
		archipelago_checked_locations.append(int(location))
	archipelago_player_slot_info = json_data["slot_info"]
	archipelago_hint_points = json_data["hint_points"]
	if "goal" in json_data["slot_data"]:
		archipelago_goal = int(json_data["slot_data"]["goal"])
	if "fizziesforgoal" in json_data["slot_data"]:
		archipelago_fizzies_for_goal = int(json_data["slot_data"]["fizziesforgoal"])
	if "checkpointsanity" in json_data["slot_data"]:
		archipelago_checkpointsanity = bool(json_data["slot_data"]["checkpointsanity"])
	if "deathlink" in json_data["slot_data"]:
		deathlink = bool(json_data["slot_data"]["deathlink"])
		client_connect_update(null, ["DeathLink"])
	ModLoaderLog.info("Successfully connected to slot.", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	
func server_received_items(json_data):
	ModLoaderLog.info("Received command \"RecievedItems\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	for item in json_data["items"]:
		var item_number = int(item["item"]) # may be from float with the way json parses 
		if item_number < 10000: # Bat giving logic
			var item_id = archipelago_item_to_internal_item_map[item_number]
			Global.info["weapon"].append(item_id)
		elif 10000 <= item_number and item_number < 30000: # Collectable giving logic
			var item_id = archipelago_item_to_internal_item_map[item_number]
			var is_fizzy = false
			var is_phant = false
			if item_id == "challenge_": # This is just so we can give distinct fizzies, it checks
				item_id += str(fizzy_increment_counter)
				fizzy_increment_counter += 1
				is_fizzy = true
			elif item_id == "phant_":
				item_id += str(phant_increment_counter)
				phant_increment_counter += 1
				is_phant = true

			if is_phant:
				Global.info["collection"][item_id] = 1
				Global.emit_signal("phantcollect")	
			elif item_id in all_archipelago_items:
				owned_archipelago_items.append(item_id)
			elif !Global.info["collection"].has(item_id):
				Global.set_collect("collection", item_id, Global.info["playtime"])
				if is_fizzy:
					Global.info["collectables"]["fizzyicecream"] += 1
					Global.emit_signal("fizzcollect")
		elif 30000 <= item_number and item_number < 40000:
			var item_id = archipelago_item_to_internal_item_map[item_number]
			if item_id in all_archipelago_items:
				owned_archipelago_items.append(item_id)
	
func server_location_info(json_data):
	ModLoaderLog.info("Received command \"LocationInfo\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func server_print_json(json_data):
	ModLoaderLog.info("Received command \"PrintJson\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var output_string_parts = []
	for json_message_part in json_data["data"]:
		if "type" in json_message_part and json_message_part["type"] == "player_id":
			output_string_parts.append(archipelago_player_slot_info[json_message_part["text"]]["name"])
		elif "type" in json_message_part and json_message_part["type"] == "item_id":
			var item_game_name = archipelago_player_slot_info[str(json_message_part["player"])]["game"]
			if item_game_name in archipelago_data_package:
				output_string_parts.append(archipelago_data_package[item_game_name]["id_to_item_name"][json_message_part["text"]])
			else:
				client_get_data_package([item_game_name])
				await archipelago_data_package_received_signal
				if item_game_name in archipelago_data_package:
					output_string_parts.append(archipelago_data_package[item_game_name]["id_to_item_name"][json_message_part["text"]])
				else:
					output_string_parts.append(json_message_part["text"])
		elif "type" in json_message_part and json_message_part["type"] == "location_id":
			var location_game_name = archipelago_player_slot_info[str(json_message_part["player"])]["game"]
			if location_game_name in archipelago_data_package:
				output_string_parts.append(archipelago_data_package[location_game_name]["id_to_location_name"][json_message_part["text"]])
			else:
				client_get_data_package([location_game_name])
				await archipelago_data_package_received_signal
				if location_game_name in archipelago_data_package:
					output_string_parts.append(archipelago_data_package[location_game_name]["id_to_location_name"][json_message_part["text"]])
				else:
					output_string_parts.append(json_message_part["text"])
		else:
			output_string_parts.append(json_message_part["text"])
	var archipelago_notification_node = archipelago_notification.instantiate()
	archipelago_notification_node.text = ''.join(output_string_parts)
	archipelago_notification_queue.append(archipelago_notification_node)
	Global.fade_out_notif(archipelago_notification_node)
	
func server_room_update(json_data):
	ModLoaderLog.info("Received command \"RoomUpdate\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func server_data_package(json_data):
	ModLoaderLog.info("Received command \"DataPackage\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	for game in json_data["data"]["games"].keys():
		var id_to_item_name = {}
		for dict_item in json_data["data"]["games"][game]["item_name_to_id"]:
			id_to_item_name[str(json_data["data"]["games"][game]["item_name_to_id"][dict_item])] = dict_item
		var id_to_location_name = {}
		for dict_item in json_data["data"]["games"][game]["location_name_to_id"]:
			id_to_location_name[str(json_data["data"]["games"][game]["location_name_to_id"][dict_item])] = dict_item
			
		archipelago_data_package[game] = {"id_to_item_name": id_to_item_name, "id_to_location_name": id_to_location_name}
	archipelago_data_package_received = true
	archipelago_data_package_received_signal.emit()
	
func server_bounced(json_data):
	ModLoaderLog.info("Received command \"Bounced\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	ModLoaderLog.info(str(json_data), "death link info")
	if "tags" in json_data and "DeathLink" in json_data["tags"]:
		if str(json_data["data"]["source"]) == archipelago_connect_packet["name"] or str(json_data["data"]["source"]) == str(archipelago_slot):
			return
		var current_timestamp = Time.get_unix_time_from_system()
		if Global.deathlink == true and (current_timestamp - Global.deathlink_last_death) >= 10:
			var notif_message = {"cmd": "PrintJson", "data":[{"text": str(json_data["data"]["source"]) + " has sent you a DeathLink"}]}
			if "cause" in json_data["data"]:
				notif_message["data"].append({"text": ": " + json_data["data"]["cause"]})
			server_print_json(notif_message)
			Global.deathlink_last_death = current_timestamp
			if deathlink_player_object != null:
				deathlink_player_object._death()
	
func server_invalid_packet(json_data):
	ModLoaderLog.info("Received command \"InvalidPacket\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func server_retrieved(json_data):
	ModLoaderLog.info("Received command \"Retrieved\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func server_set_reply(json_data):
	ModLoaderLog.info("Received command \"SetReply\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass

## Functions for Sending to Server
func client_connect():
	ModLoaderLog.info("Sent command \"Connect\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var json_connect_info = JSON.stringify([archipelago_connect_packet])
	archipelago_web_socket.send_text(json_connect_info)
	archipelago_auth_attempted = true

func client_connect_update(items_handling, tags):
	ModLoaderLog.info("Sent command \"ConnectUpdate\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var connect_update_command = [{"cmd": "ConnectUpdate"}]
	if items_handling != null:
		connect_update_command[0]["items_handling"] = items_handling
	if tags != null:
		connect_update_command[0]["tags"] = tags

	var json_connect_update = JSON.stringify(connect_update_command)
	archipelago_web_socket.send_text(json_connect_update)
	
func client_sync():
	ModLoaderLog.info("Sent command \"Sync\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_location_checks(locations):
	ModLoaderLog.info("Sent command \"LocationChecks\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	if archipelago_connected:
		var unchecked_locations = []
		for location in locations:
			if location not in archipelago_checked_locations:
				unchecked_locations.append(location)
		if len(unchecked_locations) == 0:
			ModLoaderLog.info("Locations are already checked", WONTON_BTTHARCHIPELAGO_LOG_NAME)
			return
		ModLoaderLog.info("Sent location check(s) " + str(locations), WONTON_BTTHARCHIPELAGO_LOG_NAME)
		var json_location_checks = JSON.stringify([{"cmd": "LocationChecks", "locations": unchecked_locations}])
		archipelago_web_socket.send_text(json_location_checks)
		archipelago_checked_locations.append_array(unchecked_locations)
	
func client_location_scouts():
	ModLoaderLog.info("Sent command \"LocationScouts\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_create_hints():
	ModLoaderLog.info("Sent command \"CreateHints\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_update_hint():
	ModLoaderLog.info("Sent command \"UpdateHint\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_status_update(status: String):
	ModLoaderLog.info("Sent command \"StatusUpdate\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	if status == "goal":
		var json_status_update_package = JSON.stringify([{"cmd": "StatusUpdate", "status": 30}])
		archipelago_web_socket.send_text(json_status_update_package)
	
func client_say():
	ModLoaderLog.info("Sent command \"Say\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_get_data_package(game_names):
	ModLoaderLog.info("Sent command \"GetDataPackage\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var json_get_data_package = JSON.stringify([{"cmd": "GetDataPackage", "games": game_names}])
	archipelago_web_socket.send_text(json_get_data_package)
	archipelago_data_package_requested = true
	
func client_bounce(games = null, slots = null, tags = null, data = null):
	ModLoaderLog.info("Sent command \"Bounce\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	var bounce_command = [{"cmd": "Bounce"}]
	if games != null:
		bounce_command[0]["games"] = games
	if slots != null:
		bounce_command[0]["slots"] = slots
	if tags != null:
		bounce_command[0]["tags"] = tags
	if data != null:
		bounce_command[0]["data"] = data
	
	var json_bounce = JSON.stringify(bounce_command)
	archipelago_web_socket.send_text(json_bounce)
	
	
func client_get():
	ModLoaderLog.info("Sent command \"Get\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_set():
	ModLoaderLog.info("Sent command \"Set\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
func client_set_notify():
	ModLoaderLog.info("Sent command \"SetNotify\".", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	pass
	
