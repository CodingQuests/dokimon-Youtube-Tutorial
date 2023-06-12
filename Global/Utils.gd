extends Node

const SAVE_PATH: String = "res://savegame.bin"
const SAVE_PASS: String = "password"

func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var jstr = JSON.stringify(Game.SelectedDokiMons)
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
			for i in current_line:
				Game.addDokiMon(current_line[i]["Name"])
				Game.SelectedDokiMons[int(i)]["Level"] = current_line[i]["Level"]
				Game.SelectedDokiMons[int(i)]["Exp"] = current_line[i]["Exp"]
				Game.SelectedDokiMons[int(i)]["MaxExp"] = current_line[i]["MaxExp"]

