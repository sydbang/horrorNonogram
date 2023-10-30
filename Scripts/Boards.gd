extends Node2D

var CaseSize = 34 * 1.2
var boardScale = 1.0

var timer = 0.0

var boardTileMap : TileMap
var labelRows: Control
var labelCols: Control
var labelInstance: PackedScene = load("res://Scenes/LineLabel.tscn")
@onready var jump_scare_image = $jumpScareImage

var imageTexture = [load("res://Res/images/puppy.jpeg")]

var boardSize : Vector2 = Level.boardSize
var HValues: Array = []
var VValues: Array = []
var map: Array = Level.map
	
func _ready():
	boardTileMap = $BoardTileMap
	labelCols = $LabelCols
	labelRows = $LabelRows
	generate_board()

func generate_board():
	#create a layer of answer tile map
	for x in range(int(boardSize.x)):
		for y in range(int(boardSize.y)):
			boardTileMap.set_cell(0, Vector2i(x, y), map[y][x], Vector2i(0, 0), 0)
	
	setBoardPosition()
	
	getRowData()
	getColData()
	
	printRowData()
	printColData()
	
	#create a layer of blank tile map
	for x in range(int(boardSize.x)):
		for y in range(int(boardSize.y)):
			boardTileMap.set_cell(1, Vector2i(x, y), 0, Vector2i(0, 0), 0)
			
	
func _process(delta):
	if timer > 0:
		timer -= delta
	if timer <= 0:
		jump_scare_image.visible = false
		
	var bp = $BoardTileMap.global_position * boardScale 
	var mP = get_global_mouse_position() * boardScale- bp
	var tile_x = int(mP.x / CaseSize)
	var tile_y = int(mP.y / CaseSize)
	var tile = Vector2(tile_x, tile_y)
	if boardTileMap.get_used_rect().has_point(tile):
		for x in boardSize.x:
			for y in boardSize.y:
				boardTileMap.erase_cell(2,Vector2(x,y))
		boardTileMap.set_cell(2, tile, 3,Vector2i(0,0), 0)
	
	
func setBoardPosition():
	var rect = boardTileMap.get_used_rect() 
	var position = boardTileMap.position
	var center = get_viewport().get_visible_rect().size * boardScale / 2
	var endpoint = Vector2(rect.end) * boardScale
	position = center - ((endpoint / 2) * (CaseSize))
	boardTileMap.position = position 
	
func printRowData():
	for y in range(int(boardSize.y)):
		var printText = ""
		var l = labelInstance.instantiate()
		for chain in HValues[y]:
			printText += str(chain) + " "
		if printText.length() == 0 :
			printText = "0 "
		l.text = printText
		var lRectMinPosition = l.position
		lRectMinPosition.y = (y - 1) * CaseSize
		l.position.y = lRectMinPosition.y
		labelRows.add_child(l)
	labelRows.position.x = boardTileMap.position.x - 30
	labelRows.position.y = boardTileMap.position.y

func printColData():
	for x in range(int(boardSize.x)):
		var printText = ""
		var l = labelInstance.instantiate()
		for chain in VValues[x]:
			printText += str(chain) + "\n"
		if printText.length() == 0 :
			printText = "0\n"
		l.text = printText
		var lRectPosition = l.position
		lRectPosition.x = (x - 1) * CaseSize
		l.position = lRectPosition
		labelCols.add_child(l)
	labelCols.position.x = boardTileMap.position.x + 10
	labelCols.position.y = boardTileMap.position.y - 40

	
func getRowData():
	var chain = 0
	for y in range(int(boardSize.y)):
		HValues.append([])
		for x in range(int(boardSize.x)):
			
			if boardTileMap.get_cell_source_id(0, Vector2i(x,y)) == 0:
				if chain > 0:
					HValues[y].append(chain)
						
					#print("y: ", y, " = ", chain)
					chain = 0
			else :
				chain += 1
		if chain > 0:
			HValues[y].append(chain)
			#print("y: ", y, " = ", chain)
			chain = 0
		
	#print("Hvalues, ", HValues)
	
func getColData():
	var chain = 0
	for x in range(int(boardSize.x)):
		VValues.append([])
		for y in range(int(boardSize.y)):
			if boardTileMap.get_cell_source_id(0, Vector2i(x,y)) == 0:
				if chain > 0:
					VValues[x].append(chain)
					#print("x: ", x, " = ", chain)
					chain = 0
			else :
				chain += 1
		if chain > 0:
			VValues[x].append(chain)
			#print("x: ", x, " = ", chain)
			chain = 0
	#print("Vvalues, ", VValues)

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var bp = $BoardTileMap.global_position * boardScale 
		var mP = get_global_mouse_position() * boardScale- bp
		var tile_x = int(mP.x / CaseSize)
		var tile_y = int(mP.y / CaseSize)
		var tile = Vector2(tile_x, tile_y)
		if boardTileMap.get_used_rect().has_point(tile):
			print(tile)
			
			var currentCellValue = boardTileMap.get_cell_source_id(1, tile)
			var newCellValue = 0
			if event.button_index == MOUSE_BUTTON_LEFT:
				if currentCellValue == 0:
					if boardTileMap.get_cell_source_id(0, tile) == 0:
						jumpScare()
					else:
						newCellValue = 1
						boardTileMap.set_cell(1, tile, 1, Vector2i(0, 0), 0)
				else:
					newCellValue = 0
					boardTileMap.set_cell(1, tile, 0, Vector2i(0, 0), 0)	
			else:
				boardTileMap.set_cell(1, tile, 2, Vector2i(0, 0), 0)


func jumpScare():
	var rng = RandomNumberGenerator.new()
	timer = 1.0
	jump_scare_image.texture = imageTexture[rng.randi_range(0, imageTexture.size()-1)]
	jump_scare_image.visible = true
	

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")
	

func _on_reset_button_pressed():
	for x in range(int(boardSize.x)):
		for y in range(int(boardSize.y)):
			boardTileMap.set_cell(1, Vector2i(x, y), 0, Vector2i(0, 0), 0)
