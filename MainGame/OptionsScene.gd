extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Layout/Main/VBoxContainer/HardMode.pressed = GlobalVariables.hardMode
	print("here")
#	$Layout/Main/VBoxContainer/HardMode.pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Going back to the main menu
func _on_Back_pressed():
	get_tree().change_scene("res://MainGame/menu.tscn")

# Punish players who think they can cheat
func _on_SecretCheatScreen_pressed():
	get_tree().change_scene("res://MainGame/SecretCheatScreen.tscn")

# Activate hard mode
func _on_HardMode_toggled(button_pressed):
	#set the flag for on or off
	GlobalVariables.hardMode = button_pressed
