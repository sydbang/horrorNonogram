extends CharacterBody2D

var countDown = 250
var player
var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play ("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !player:
		return
	if countDown < 0:
		return
		
	if can_move: 
		countDown -= delta
		
		position.x = lerp(0.0, player.position.x, 1 - countDown/250)
		position.x = clamp(position.x, 0.0, player.position.x)

		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
