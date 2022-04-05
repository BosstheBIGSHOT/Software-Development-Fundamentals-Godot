extends Control

export(int) var leaderBoard


func _ready():
	leaderBoard = GlobalVariables.previousScores
	$Layout/LeaderBoard/LeaderboardScores.text = str(GlobalVariables.previousScores)



func _on_Start_pressed():
	GlobalVariables.scoringInformation["currentScore"] = 0
	get_tree().change_scene("res://MainGame/MainGame.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	get_tree().change_scene("res://MainGame/Options.tscn")
