extends KinematicBody2D

var speed = 840

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	# Randomise
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0.1, 1000000.0)
	# make move
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	# if colliding
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			# kill enemy
			collidedObject.get_collider().queue_free()
			# make score randomised in hard mode
			if GlobalVariables.hardMode:
				GlobalVariables.scoringInformation["currentScore"] +=my_random_number
			else:
				GlobalVariables.scoringInformation["currentScore"] +=10
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
