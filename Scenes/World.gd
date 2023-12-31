extends Node2D

	
#func _ready():
#	get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND

func _on_level_1_pressed():
	Level.boardSize = Vector2(5, 5)
	Level.map = [
		[0, 1, 1, 1, 0],
		[0, 0, 1, 0, 0],
		[0, 1, 1, 1, 0],
		[0, 1, 1, 1, 0],
		[0, 1, 1, 1, 0]
	]
	Level.picName = "Poison"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")


func _on_level_2_pressed():
	Level.boardSize = Vector2(5, 5)
	Level.map = [
		[0, 1, 1, 1, 0],
		[1, 0, 1, 0, 1],
		[1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1],
		[1, 0, 1, 0, 1]
	]
	Level.picName = "Ghost"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")


func _on_level_3_pressed():
	Level.boardSize = Vector2(10, 10)
	Level.map = [
		[0, 0, 0, 0, 0, 0, 1, 1, 0, 0],
		[0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
		[0, 0, 0, 0, 1, 1, 1, 1, 0, 0],
		[0, 0, 0, 1, 1, 1, 1, 1, 0, 0],
		[0, 0, 1, 1, 1, 1, 1, 1, 0, 0],
		[0, 1, 1, 1, 1, 1, 1, 1, 0, 0],
		[1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
		[1, 1, 1, 0, 1, 1, 1, 0, 0, 0],
		[1, 1, 0, 0, 1, 1, 0, 0, 0, 0],
		[0, 0, 0, 0, 1, 1, 1, 0, 0, 0]
	]
	Level.picName = "Crow"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")

func _on_level_4_pressed():
	Level.boardSize = Vector2(10, 10)
	Level.map = [
		[1, 1, 1, 1, 0, 0, 0, 1, 1, 1],
		[1, 1, 1, 1, 0, 0, 1, 1, 1, 1],
		[1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
		[1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
		[0, 0, 0, 1, 0, 0, 1, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 1, 0, 1, 1, 0, 1, 0, 0],
		[0, 0, 1, 1, 1, 1, 1, 1, 0, 0],
		[1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
		[1, 1, 1, 0, 0, 0, 0, 1, 1, 1]
	]
	Level.picName = "Jack-o'-lantern"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")
	


func _on_level_5_pressed():
	Level.boardSize = Vector2(10, 10)
	Level.map = [
		[0, 0, 0, 1, 1, 1, 1, 1, 1, 1],
		[1, 0, 0, 0, 1, 1, 1, 1, 1, 1],
		[1, 1, 0, 0, 0, 1, 0, 1, 1, 1],
		[1, 1, 1, 0, 0, 0, 0, 0, 1, 1],
		[1, 1, 1, 1, 0, 0, 0, 1, 1, 1],
		[1, 1, 1, 0, 1, 0, 0, 0, 1, 1],
		[1, 1, 0, 1, 0, 1, 0, 0, 0, 1],
		[1, 1, 1, 0, 1, 1, 1, 0, 0, 0],
		[1, 1, 1, 1, 1, 1, 1, 1, 0, 0],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 0]
	]
	Level.picName = "Bat"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")


func _on_level_6_pressed():
	Level.boardSize = Vector2(10, 10)
	Level.map = [
		[0, 0, 1, 1, 1, 1, 1, 1, 0, 0],
		[0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
		[1, 1, 0, 0, 1, 1, 0, 0, 1, 1],
		[1, 1, 0, 0, 1, 1, 0, 0, 1, 1],
		[1, 1, 0, 0, 1, 1, 0, 0, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 0, 0, 1, 1, 1, 1],
		[0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
		[0, 0, 1, 0, 1, 1, 0, 1, 0, 0],
		[0, 0, 1, 0, 1, 1, 0, 1, 0, 0]
	]
	Level.picName = "Skull"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")


func _on_level_7_pressed():
	Level.boardSize = Vector2(15, 15)
	Level.map = [
		[1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1],
		[1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0],
		[1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1],
		[1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1],
		[1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1],
		[1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1],
		[1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1],
		[1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1],
		[1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1],
		[1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1],
		[0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1],
		[0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1],
		[0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0],
		[1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1],
		[1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1]
	]
	Level.picName = "Ghost"
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")
