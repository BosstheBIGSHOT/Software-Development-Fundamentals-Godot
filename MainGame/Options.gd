extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene("res://MainGame/menu.tscn")


func _on_SecretCheatScreen_pressed():
	get_tree().change_scene("res://MainGame/SecretCheatScreen.tscn")


func _on_HardMode_toggled(button_pressed):
	#set the flag for on or off
	GlobalVariables.hardMode = button_pressed


func _on_Sounds_toggled(button_pressed):
	pass # Replace with function body.


func _on_Music_toggled(button_pressed):
	pass # Replace with function body.
