extends Control


func _ready():
	switchUpdate()
	
func _on_fight_pressed():
	$Menu.hide()
	$"Fight/VBoxContainer/Attack 1".grab_focus()
	$Fight.show()


func _on_back_pressed():
	$Menu.show()
	$Menu/VBoxContainer/Fight.grab_focus()
	$Switch.hide()
	$Fight.hide()
	
func _process(_delta):
	$Hp.value = Game.SelectedDokiMons[get_parent().selected]["Health"]
	$Info.text = str(Game.SelectedDokiMons[get_parent().selected]["Name"]) +" L" + str(Game.SelectedDokiMons[get_parent().selected]["Level"])
	$HPtxt.text = str(Game.SelectedDokiMons[get_parent().selected]["Health"]) 
	#SET ATTACK NAMES
	for i in Game.SelectedDokiMons[get_parent().selected]["Attacks"]:
		var path = "Fight/VBoxContainer/Attack " + str(((i)+1))
		get_node(path).text = Game.SelectedDokiMons[get_parent().selected]["Attacks"][i]["Name"]
	#SET DOKIMON NAMES
	
	
func _on_switch_pressed():
	
	$Menu.hide()
	$Switch.show()
	$Fight.hide()
	$"Switch/VBoxContainer/Dokimon 1".grab_focus()

func _on_dokimon_pressed(extra_arg_0):
	get_parent().selected = extra_arg_0
	for i in $"../Player".get_child_count():
		$"../Player".get_child(i).get_node("AnimationPlayer").play_backwards("Spawn")
	var path = "../Player/" + str(Game.SelectedDokiMons[extra_arg_0]["Name"])
	get_node(path).get_node("AnimationPlayer").play("Spawn")
	get_node(path).show()
	await get_node(path).get_node("AnimationPlayer").animation_finished
	for i in $"../Player".get_child_count():
		$"../Player".get_child(i).hide()
	get_node(path).show()
	switchUpdate()
	get_parent().MonsterTurn()
func switchUpdate():
	for i in 3:
		var path = "Switch/VBoxContainer/Dokimon " + str((i+1))
		get_node(path).hide()
	for i in Game.SelectedDokiMons:
		if i != get_parent().selected:
			var path = "Switch/VBoxContainer/Dokimon " + str((i+1))
			get_node(path).text = Game.SelectedDokiMons[i]["Name"]
			get_node(path).show()
