extends Node

# make hard mode togglable
var hardMode = false

# add savedata
var saveFile = "user://save.dat"

# keep track of bullets
var bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
var enemyBulletInstanceCount = 0

# keep track of previous scores. No longer works
var previousScores = []

# scoring information
var scoringInformation = {
	"currentScore": 0,
	"currentPlayer": "User",
	"highScores": [0,0,0],
	"highScorePlayersName" : "Winner"
}
