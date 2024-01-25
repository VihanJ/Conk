extends Node2D
#@onready var garry = 0
# Called when the node enters the scene tree for the first time.
	
func garrisoncount(garrison):
	var string = ""
	for i in range(garrison):
		string += "."
	$Settlement/GarrisonCount.text = "[center][font_size={250}]" + string
	
#Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	garrisoncount(2)
