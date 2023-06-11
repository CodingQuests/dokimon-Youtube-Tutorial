extends Area2D

var battle = preload("res://Battle Scene/battle.tscn")


func _on_body_entered(body):
	if "Player" in body.name:
		$"../UI/Anim".play("Transition")
		get_tree().paused = true

func _process(delta):
	if $"../UI/Anim".current_animation == "Transition":
		if $"../UI/Anim".get_current_animation_position() >= 1.5:
			var battleTemp = battle.instantiate()
			
			get_parent().add_child(battleTemp)
			queue_free()
