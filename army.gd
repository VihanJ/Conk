extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func addTexture(texture):
	#Will add cavalry and artillery textures
	#TextureRect.texture = texture

func stretchTexture(mult):
	#will tile the infantry texture up to 3 times
	var x = $TextureRect.get_size().get_width()
	var y = $TextureRect.get_size().get_height()
	$TextureRect.set_size(Vector2(mult* x,y))
	
func drawArmies(num):
	if 5 <= num <= 10:
		$army.gd.stretchTexture(2)
	elif num > 10:
		$army.gd.strecthTexture(3)
	else:
		pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
