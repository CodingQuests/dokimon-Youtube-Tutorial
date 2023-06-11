extends Node

var dataBaseDokiMons = {
	0: {
		"Name": "PinkMon",
		"Frame": 0,
		"Health" : 100,
		"Level" : 1,
		"Exp" : 0,
		"MaxExp" : 10,
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
		"Frame": 2,
		"Health" : 100,
		"Level" : 1,
		"Exp" : 0,
		"MaxExp" : 10,
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
	2: {
		"Name": "PurpleMon",
		"Frame": 4,
		"Health" : 100,
		"Level" : 1,
		"Exp" : 0,
		"MaxExp" : 10,
		"Strength" : 10,
		"Defense" : 5,
		"Scene" : preload("res://Monsters/PurpleMon.tscn"),
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
var SelectedDokiMons = {
	0: {
		"Name": "PinkMon",
		"Frame": 0,
		"Health" : 100,
		"Level" : 1,
		"Exp" : 0,
		"MaxExp" : 10,
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
		"Frame": 2,
		"Health" : 100,
		"Level" : 1,
		"Exp" : 0,
		"MaxExp" : 10,
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
	for i in dataBaseDokiMons:
		if dataBaseDokiMons[i]["Name"] == Name:
			SelectedDokiMons[SelectedDokiMons.size()] = dataBaseDokiMons[i]


func addEXP(amount):
	for i in SelectedDokiMons:
		SelectedDokiMons[i]["Exp"] += amount
		if SelectedDokiMons[i]["Exp"] >= SelectedDokiMons[i]["MaxExp"]:
			SelectedDokiMons[i]["Level"] += 1
			SelectedDokiMons[i]["Exp"] = 0
			SelectedDokiMons[i]["MaxExp"] = SelectedDokiMons[i]["MaxExp"]*1.5
