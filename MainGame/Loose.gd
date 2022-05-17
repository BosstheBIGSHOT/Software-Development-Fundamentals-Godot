extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Sorts the array
	GlobalVariables.scoringInformation["highScores"].sort()
	
	# Searches the array for the value, or the position in the array where it will "fit".
	var highScorePosition = GlobalVariables.scoringInformation["highScores"].bsearch(GlobalVariables.scoringInformation["currentScore"], true)
	print("position #", highScorePosition)
	
	# Inserts the value into the array at the correct position.
	GlobalVariables.scoringInformation["highScores"].insert(highScorePosition, GlobalVariables.scoringInformation["currentScore"])
	
	# Removes the first (and lowest) score.
	GlobalVariables.scoringInformation["highScores"].remove(0)
	
	# Debugging.
	print(GlobalVariables.scoringInformation["highScores"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Go back to the main menu
func _on_Button_pressed():
	get_tree().change_scene("res://MainGame/menu.tscn")
