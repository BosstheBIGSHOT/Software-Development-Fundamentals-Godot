extends Control

export(int) var countdownMax
var currentTimer


func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0.1, 70.0)
	if GlobalVariables.hardMode:
		while currentTimer > 0:
			yield(get_tree().create_timer(1.0), "timeout")
			$HUD/Countdown.text = str(currentTimer)
			currentTimer = currentTimer - my_random_number
			print(currentTimer)
	else:
		while currentTimer > 0:
			yield(get_tree().create_timer(1.0), "timeout")
			$HUD/Countdown.text = str(currentTimer)
			currentTimer = currentTimer - 1
			print(currentTimer)
	$HUD/Countdown.text = str("Game Over")
	GlobalVariables.previousScores.push_front( GlobalVariables.scoringInformation["currentScore"])
	print(GlobalVariables.previousScores)
	get_tree().change_scene("res://MainGame/Loose.tscn")
	if GlobalVariables.scoringInformation["currentScore"] > GlobalVariables.scoringInformation["highScore"]:
		GlobalVariables.scoringInformation["currentScore"] = GlobalVariables.scoringInformation["highScore"]
	
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene("res://MainGame/Winner.tscn")
