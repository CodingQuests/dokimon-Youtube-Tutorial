extends Node

var SelectedDokiMons = {
	0: {
		"Name": "PinkMon",
		"Health" : 100,
		"Level" : 1,
		"Strength" : 10,
		"Defense" : 5,
		"Scene" : preload("res://Monsters/PinkMon.tscn"),
		"Attacks":{
			0 : {
				"Name": "Blast",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			1 : {
				"Name": "Clash",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			2 : {
				"Name": "Impact",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			}
		}
	},
	1: {
		"Name": "GreenMon",
		"Health" : 100,
		"Level" : 1,
		"Strength" : 10,
		"Defense" : 5,
		"Scene" : preload("res://Monsters/GreenMon.tscn"),
		"Attacks":{
			0 : {
				"Name": "Blast",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			1 : {
				"Name": "Clash",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			2 : {
				"Name": "Impact",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			}
		}
	},
}

func addDokiMon(Name):
	SelectedDokiMons[SelectedDokiMons.size()] ={
		"Name": Name,
		"Health" : 100,
		"Level" : 1,
		"Strength" : 10,
		"Defense" : 5,
		"Scene" : preload("res://Monsters/GreenMon.tscn"),
		"Attacks":{
			0 : {
				"Name": "Blast",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			1 : {
				"Name": "Clash",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			2 : {
				"Name": "Impact",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			}
		}
	}
