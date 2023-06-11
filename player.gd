extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = $AnimationTree

func _physics_process(delta):
	var inputDir = Input.get_vector("ui_left","ui_right", "ui_up","ui_down", 0)
	
	if inputDir:
		velocity = inputDir * SPEED
		anim.get("parameters/playback").travel("Walk")
		anim.set("parameters/Idle/blend_position", inputDir)
		anim.set("parameters/Walk/blend_position", inputDir)
	else:
		anim.get("parameters/playback").travel("Idle")
		
		velocity.x = move_toward(velocity.x, 0, 20)
		velocity.y = move_toward(velocity.y, 0, 20)
	move_and_slide()
