extends Node2D

@onready var tileTexture = $Background
<<<<<<< HEAD
#@onready var tokenTexture = $Background/Token
#@onready var tokenValue = $Background/Token/RichTextLabel
=======
@onready var tokenTexture = $Background/Token
@onready var tokenValue = $Background/Value
<<<<<<< HEAD
>>>>>>> 02ac3e01a58ec81bed056d9375ec7d1fd5c0fc84
=======
>>>>>>> 02ac3e01a58ec81bed056d9375ec7d1fd5c0fc84



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _draw():
	draw_line(Vector2(0, 0), Vector2(20, 20), Color.GREEN, 1.0)
