extends Node

const WONTON_BTTHARCHIPELAGO_DIR := "Wonton-BTTHArchipelago"
const WONTON_BTTHARCHIPELAGO_LOG_NAME := "Wonton-BTTHArchipelago:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(WONTON_BTTHARCHIPELAGO_DIR)
	# Add extensions
	install_script_extensions()
	# Add translations
	add_translations()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("objects/items/collectable.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.path_join("global/global.gd"))
	# ModLoaderMod.install_script_extension(extensions_dir_path.path_join(...))


func add_translations() -> void:
	translations_dir_path = mod_dir_path.path_join("translations")
	# ModLoaderMod.add_translation(translations_dir_path.path_join(...))


func _ready() -> void:
	ModLoaderLog.info("Ready!", WONTON_BTTHARCHIPELAGO_LOG_NAME)
