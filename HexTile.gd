extends Node

@onready var tileTexture = $Background
@onready var tokenTexture = $Background/Token
@onready var tokenValue = $Background/Token/RichTextLabel



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func change_texture(texture):
		tileTexture.texture = texture

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
