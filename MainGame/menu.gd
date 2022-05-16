extends Control

export(int) var leaderBoard


func _ready():
	leaderBoard = GlobalVariables.previousScores
	$Layout/LeaderBoard/LeaderboardScores.text = str(GlobalVariables.previousScores)
	var file = File.new()
	if file.file_exists(GlobalVariables.saveFile):
		var error = file.open(GlobalVariables.saveFile, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			GlobalVariables.scoringInformation = player_data


func _on_Start_pressed():
	GlobalVariables.scoringInformation["currentScore"] = 0
	get_tree().change_scene("res://MainGame/MainGame.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	get_tree().change_scene("res://MainGame/Options.tscn")
