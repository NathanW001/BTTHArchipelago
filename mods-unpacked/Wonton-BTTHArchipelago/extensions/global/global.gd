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
	
}
var missing_locations = []
var checked_locations = []
var recieved_items = []
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
	archipelago_url = "ws://localhost"
	archipelago_port = 38281
	connect_to_archipelago()


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
	pass
	
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
	
func client_location_checks(locations):
	var json_location_checks = JSON.stringify([{"cmd": "LocationChecks", "locations": locations}])
	archipelago_web_socket.send_text(json_location_checks)
	
