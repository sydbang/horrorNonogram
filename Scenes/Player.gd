extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var victory_free = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play ("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if victory_free:
		velocity.x = SPEED
		move_and_slide()


