extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)


func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(1.0, 50000.0)
	# make hard mode speed random
	if GlobalVariables.hardMode:
		speed = my_random_number
	else:
		speed = 500
	if (collidedObject):
		#print("Enemy collide: ",collidedObject.collider.name)
		# Pass enemy
		if "Enemy" in collidedObject.collider.name:
			pass
			#collidedObject.get_collider().queue_free() #Don't kill the enemies.
		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)
		# kill player
		if "Player" in collidedObject.collider.name:
			get_tree().change_scene("res://MainGame/Loose.tscn")
			queue_free()

