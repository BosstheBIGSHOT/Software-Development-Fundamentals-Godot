extends Control

export(int) var countdownMax
var currentTimer


func _ready():
	# Count down
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	# Randomise
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0.1, 70.0)
	# only activate when user wants to experience pain
	if GlobalVariables.hardMode:
		while currentTimer > 0:
			yield(get_tree().create_timer(1.0), "timeout")
			$HUD/Countdown.text = str(currentTimer)
			# make the count down go down by a random number
			currentTimer = currentTimer - my_random_number
			print(currentTimer)
	# otherwise play as normal
	else:
		while currentTimer > 0:
			yield(get_tree().create_timer(1.0), "timeout")
			$HUD/Countdown.text = str(currentTimer)
			currentTimer = currentTimer - 1
			print(currentTimer)
	# game over
	$HUD/Countdown.text = str("Game Over")
	GlobalVariables.previousScores.push_front( GlobalVariables.scoringInformation["currentScore"])
	print(GlobalVariables.previousScores)
	# Go to loose screen
	get_tree().change_scene("res://MainGame/Loose.tscn")

# show scores
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	$HUD/HighScore.text = str(GlobalVariables.scoringInformation["highScores"])
	# allow win
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene("res://MainGame/Winner.tscn")
