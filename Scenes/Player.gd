extends CharacterBody2D

const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play ("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta
	velocity.x = SPEED 
	#move_and_slide()
