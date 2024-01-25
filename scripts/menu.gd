extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background/RichTextLabel.text = "[center][font_size={100}]CENTURY[/font_size][/center]"
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/board.tscn")

func _on_quit_pressed():
	get_tree().quit()
