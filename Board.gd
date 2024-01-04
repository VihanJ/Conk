extends Node2D

@onready var HexGrid = preload("res://HexGrid.gd").new()
@onready var HexTiles = $Hexes


"""
onready var highlight = get_node("Highlight")
onready var area_coords = get_node("Highlight/AreaCoords")
onready var hex_coords = get_node("Highlight/HexCoords")
"""

var textures = {"desert":load("res://Assets/tiles/testdesert.png"), 
				"forest":load("res://Assets/tiles/testforest.png"),
				"plains":load("res://Assets/tiles/testfield.png"),
				"pasture":load("res://Assets/tiles/testpasture.png"),
				"quarry":load("res://Assets/tiles/testquarry.png"),
				"mountain":load("res://Assets/tiles/testmountain.png"),
				"sea":load("res://Assets/tiles/default.png")}


func _ready():
	HexGrid.hex_scale = Vector2(50, 50)
	
	

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
