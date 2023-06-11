extends CanvasLayer



var selected = 0

func _ready():
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	$UI/Menu/VBoxContainer/Fight.grab_focus()
	await get_tree().create_timer(2).timeout
	for i in Game.SelectedDokiMons:
		var monTemp = Game.SelectedDokiMons[i]["Scene"].instantiate()
		monTemp.name = Game.SelectedDokiMons[i]["Name"]
		monTemp.hide()
		$Player.add_child(monTemp)
	$Player.get_child(0).show()
	$UI/Menu.show()

func MonsterTurn():
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	var damage = randi_range(10,15)
	await get_tree().create_timer(2).timeout
	if $Enemy.get_child(0).Health <= 0:
		Game.addEXP(10)
		get_tree().paused = false
		queue_free()
	$Player.get_child(selected).hit("Blast", damage)
	$Action.text = "Enemy " + $Enemy.get_child(0).name + " Has attacked using BLAST for " + str(damage) +" hp"
	Game.SelectedDokiMons[0]["Health"] -= damage
	await get_tree().create_timer(2).timeout
	$UI/Menu/VBoxContainer/Fight.grab_focus()
	$UI/Menu.show()
	
func _on_flee_pressed():
	$"../UI/Anim".play("Transition")
	await get_tree().create_timer(1.5).timeout
	queue_free()
	get_tree().paused = false

func _on_attack_pressed(extra_arg_0):
	if Game.SelectedDokiMons[selected]["Attacks"][extra_arg_0]["Target"] == "Monster":
		var tempDic = Game.SelectedDokiMons[selected]["Attacks"]
		$Enemy.get_child(0).hit(tempDic[extra_arg_0]["Name"], tempDic[extra_arg_0]["Damage"])
		$Action.text = "Your " + str(Game.SelectedDokiMons[selected]["Name"]) + " Has attacked for " + str(tempDic[0]["Damage"]) + " hp"
		MonsterTurn()


func _on_capture_pressed():
	if $Enemy.get_child(0).Health <= 10:
		$Enemy.get_child(0).capture()
		Game.addEXP(10)
	else:
		$Action.text = "The Enemy Dokimon's Health is not low enough!"
