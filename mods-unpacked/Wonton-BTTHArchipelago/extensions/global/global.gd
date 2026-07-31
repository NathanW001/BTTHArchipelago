extends "res://global/global.gd"

const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:global.gd"

var archipelago_internal_item_to_location_map = {
	## Fizzies
	"challenge_1": 0, # "Fizzy - left of Mola Town"
	"challenge_18": 1, # "Fizzy - on the climb to Jalta Dregs"
	"challenge_2": 2, # "Fizzy - hidden pit in Belwheat Valley"
	"challenge_3": 3, # "Fizzy - at the top of the GC Warehouse"
	"challenge_4": 4, # "Fizzy - above a checkpoint in the Entrance Ruins"
	"challenge_5": 5, # "Fizzy - platforming puzzle in the top left of the Entrance Ruins"
	"challenge_6": 6, # "Fizzy - lava tunnel in the GC Factory"
	"challenge_7": 7, # "Fizzy - island on the Cliff Face"
	"challenge_8": 8, # "Fizzy - platforming puzzle in the top right of the Forest Cavern"
	"challenge_9": 9, # "Fizzy - platforming puzzle at the end of the Eroded Beach"
	"challenge_11": 10, # "Fizzy - platform above Observer in Port Naga"
	"challenge_10": 11, # "Fizzy - isolated platform to the left of Port Naga"
	# Port Naga Arcade fizzies (12 and 13) aren't checks in the world
	"challenge_12": 14, # "Fizzy - at the entrance to the puzzle in the top of Basin 21"
	"challenge_13": 15, # "Fizzy - at the end of the long platforming puzzle in Basin 21"
	"challenge_14": 16, # "Fizzy - underneath the Phant room in Pastel Strata"
	"challenge_15": 17, # "Fizzy - puzzle in the middle of the Precipice Bridge"
	"challenge_16": 18, # "Fizzy - behind the glass at the end of the Precipice Bridge"
	"challenge_17": 19, # "Fizzy - hidden room behind a checkpoint in Villith's Drain"
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
	# Butter's contact card is not found in the world
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
	# Phant bat and Fizzy bat aren't located in the world
	"godbat": 40004,
	"pinkbat": 40005,
}
var archipelago_item_to_internal_item_map = {
	## Bats
	0: "bat",
	1: "angelbat",
	2: "fizzybat",
	3: "largebat",
	4: "godbat",
	5: "pinkbat",
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

#var missing_locations = []
#var checked_locations = []
#var recieved_items = []
var deathlink = false

var archipelago_url = ""
var archipelago_port = -1
var archipelago_web_socket = WebSocketPeer.new()
var archipelago_connected = false
var archipelago_auth_attempted = false
var archipelago_authenticated = false # true after Connect packet is accepted


var archipelago_network_version = {
	"class": "Version",
	"major": 0,
	"minor": 6,
	"build": 8,
}

var archipelago_connect_packet = {
	"cmd": "Connect",
	"password": "",
	"game": "Bat to the Heavens",
	"name": "test1",
	"uuid": "",
	"version": archipelago_network_version,
	"items_handling": 0b111,
	"tags": [],
	"slot_data": true,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func connect_to_archipelago() -> void:
	var err = archipelago_web_socket.connect_to_url(archipelago_url + ":" + str(archipelago_port))
	if err == OK:
		ModLoaderLog.info("Connecting to " + str(archipelago_web_socket), WONTON_BTTHARCHIPELAGO_LOG_NAME)
		archipelago_connected = true
	else:
		ModLoaderLog.error("> Unable to connect.", WONTON_BTTHARCHIPELAGO_LOG_NAME)
		
func _process(_delta):
	super(_delta)
	if archipelago_connected:
		archipelago_web_socket.poll()
		var state = archipelago_web_socket.get_ready_state()
		# `WebSocketPeer.STATE_OPEN` means the socket is connected and ready
		# to send and receive data.
		if state == WebSocketPeer.STATE_OPEN:
			while archipelago_web_socket.get_available_packet_count():
				var packet = archipelago_web_socket.get_packet()
				if archipelago_web_socket.was_string_packet():
					var packet_text = packet.get_string_from_utf8()
					ModLoaderLog.info("< Got text data from server: %s" % packet_text, WONTON_BTTHARCHIPELAGO_LOG_NAME)
					server_process_raw_json(packet_text)
				else:
					#ModLoaderLog.info("< Got binary data from server: %d bytes" % packet.size(), WONTON_BTTHARCHIPELAGO_LOG_NAME)
					pass
			if !archipelago_auth_attempted:
				var json_connect_info = JSON.stringify([archipelago_connect_packet])
				archipelago_web_socket.send_text(json_connect_info)
				archipelago_auth_attempted = true
			

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
			archipelago_connected = false

func server_process_raw_json(json_string):
	var json = JSON.new()
	var err = json.parse(json_string)
	if err == OK:
		var data_received = json.data
		for command in data_received:
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
	else:
		ModLoaderLog.error("JSON Parse error from WebSocket message", WONTON_BTTHARCHIPELAGO_LOG_NAME)

## Functions for Receiveing from Server
func server_room_info(json_data):
	pass

func server_connection_refused(json_data):
	pass
	
func server_connected(json_data):
	archipelago_authenticated = true
	ModLoaderLog.info("Successfully connected to slot.", WONTON_BTTHARCHIPELAGO_LOG_NAME)
	
func server_received_items(json_data):
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
	pass
	
func server_print_json(json_data):
	ModLoaderLog.info(json_data["data"][0]["text"], "Server JSON")
	pass
	
func server_room_update(json_data):
	pass
	
func server_data_package(json_data):
	pass
	
func server_bounced(json_data):
	pass
	
func server_invalid_packet(json_data):
	pass
	
func server_retrieved(json_data):
	pass
	
func server_set_reply(json_data):
	pass

## Functions for Sending to Server
func client_connect():
	pass

func client_connect_update():
	pass
	
func client_sync():
	pass
	
func client_location_checks(locations):
	if archipelago_connected:
		ModLoaderLog.info("Sent location check(s) " + str(locations), WONTON_BTTHARCHIPELAGO_LOG_NAME)
		var json_location_checks = JSON.stringify([{"cmd": "LocationChecks", "locations": locations}])
		archipelago_web_socket.send_text(json_location_checks)
	
func client_location_scouts():
	pass
	
func client_create_hints():
	pass
	
func client_update_hint():
	pass
	
func client_status_update():
	pass
	
func client_say():
	pass
	
func client_get_data_package():
	pass
	
func client_bounce():
	pass
	
func client_get():
	pass
	
func client_set():
	pass
	
func client_set_notify():
	pass
