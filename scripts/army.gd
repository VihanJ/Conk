extends Node2D
@onready var localStrength = 0 
#@onready var garrison = 0 #board level definition
@onready var actionpoints = 2
#@onready var battleStrength = localStrength + garrison #board level definition

func drawArmies(localStrength):
	#displays army textures
	$Infantry/ArmyCount.text = "[center]" + str(localStrength)
	if localStrength >= 5 and localStrength < 10: #must be less retarded way to do this
		$Infantry/Cavalry.visible = true
		$Infantry/Artillery.visible = false
	elif localStrength >= 10:
		$Infantry/Cavalry.visible = true
		$Infantry/Artillery.visible = true
	else:
		$Infantry/Cavalry.visible = false
		$Infantry/Artillery.visible = false
		
func mergeArmies(input1, input2):
	localStrength = input1 + input2
	drawArmies(localStrength)

# Called when the node enters the scene tree for the first time.
func _ready():
	#debug
	mergeArmies(2, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_texture_button_toggled(toggled_on):
	if toggled_on == true:
		mergeArmies(9, 3)
	else:
		mergeArmies(2,3)
	print(str(toggled_on))
