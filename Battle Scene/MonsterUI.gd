extends Control





func _ready():
	await get_tree().create_timer(1).timeout
	$Hp.max_value = $"../Enemy".get_child(0).Health
	$Hp.value = $"../Enemy".get_child(0).Health
	

func _process(delta):
	$Hp.value = $"../Enemy".get_child(0).Health
	$HPtxt.text = str($"../Enemy".get_child(0).Health)
	$Info.text = "Monster "+str($"../Enemy".get_child(0).name) + " L" + str($"../Enemy".get_child(0).Level)
	
