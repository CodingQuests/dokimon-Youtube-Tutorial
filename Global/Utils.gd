extends Node

const SAVE_PATH: String = "res://savegame.bin"
const SAVE_PASS: String = "password"


func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"PlayerClass": Game.PlayerClass,
		"gold": Game.gold,
		"intro": Game.intro,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)


func load_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		return
	if file == null:
		return
	
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.PlayerClass = current_line["PlayerClass"]
				Game.gold = current_line["gold"]
				Game.intro = current_line["intro"]

func PlayerIdle():
	if has_node("/root/Forest/BG/Player/Anim"):
		get_tree().root.get_child(5).get_node("BG/Player/Anim").play("Idle")
