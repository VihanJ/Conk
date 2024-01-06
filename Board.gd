extends Node2D

@onready var HexGrid = preload("res://HexGrid.gd").new()
@onready var HexTiles = $Hexes
@onready var testTile = $TestHexTile


"""
onready var highlight = get_node("Highlight")
onready var area_coords = get_node("Highlight/AreaCoords")
onready var hex_coords = get_node("Highlight/HexCoords")
"""
var textures = {0:preload("res://Assets/tiles/testdesert1.png"), 
				1:preload("res://Assets/tiles/testforest1.png"),
				2:preload("res://Assets/tiles/testfield1.png"),
				3:preload("res://Assets/tiles/testpasture1.png"),
				4:preload("res://Assets/tiles/testquarry1.png"),
				5:preload("res://Assets/tiles/testmountain1.png"),
				6:preload("res://Assets/tiles/default.png")}
var textureNames = {0:"desert",1:"forest",2:"plains",3:"pasture",4:"quarry",5:"mountain",6:"empty",}


func generateBoard(): 
	var boardData = []
	var i = 0
	var j = 0
	var offset = 2 #conceptually indexed so that the center hex is 0,0
	while i < 5:
		boardData.append([])
		j = 0
		while j < 5:
			if i+j<=1 or i+j>=7:
				boardData[i].append([-1,-1])
			else:
				boardData[i].append([(i+j)%5,5]) #tile index, probability value
				
			
			j+=1
		i+=1
	
	print(boardData)
	print(boardData.size()*boardData[0].size())
	
	return boardData

func createBoard(boardData):
	var hexScene = load("res://hex_tile.tscn")
	for i in 19:
		var tile = hexScene.instantiate()
		HexTiles.add_child(tile)
		
	var imgs = textures.values()

	var scale = 50	
	var tileNum =0
	var tiles = HexTiles.get_children()
	for i in boardData.size():
		for j in boardData[i].size():
			var textureNum = boardData[i][j][0]
			
			if textureNum == -1: #empty tile
				continue
			
			var probabilityNum = boardData[i][j][1]
			
			tiles[tileNum].get_node("Background").texture = textures[(2*i+j)%6]
			var tileTexture = tiles[tileNum].get_node("Background").texture
			var relativePos = Vector2( 2*(i-2)+(j-2),2*sin(deg_to_rad(60))*(j-2) ) * scale
			tiles[tileNum].get_node("Background").set_position(Vector2(-tileTexture.get_width()/2,-tileTexture.get_height()/2))
			tiles[tileNum].set_position(relativePos)
			var relativeScale = 2.0*scale/tileTexture.get_width()
			tiles[tileNum].set_scale(Vector2(relativeScale,relativeScale))
			#tiles[tileNum].get_node("Background").get_node("Value").text = str(relativePos/scale)
			tileNum+=1

func _ready():
	
	var boardData = generateBoard() #- #returns a 5x5 array of 25 tuples, each with the tile and resource such that it forms a valid board
	createBoard(boardData) #- given 19 hexes, draws the board with appropriate shifts for each tile and texture such 
	#a catan board is drawn - will probably make use of hex-grid. 
	
	var tileTexture  = testTile.get_node("Background").texture
	testTile.get_node("Background").set_position(Vector2(-tileTexture.get_width()/2,-tileTexture.get_height()/2))
	testTile.set_position(Vector2(500,500))
	testTile.set_scale(Vector2(0.3,0.3))
			
func _unhandled_input(event):
	"""if 'position' in event:
		var relative_pos = self.transform.affine_inverse() * event.position
		# Display the coords used
		if area_coords != null:
			area_coords.text = str(relative_pos)
		if hex_coords != null:
			hex_coords.text = str(HexGrid.get_hex_at(relative_pos).axial_coords)
		
		# Snap the highlight to the nearest grid cell
		if highlight != null:
			highlight.position = HexGrid.get_hex_center(HexGrid.get_hex_at(relative_pos))

	"""
	pass 
