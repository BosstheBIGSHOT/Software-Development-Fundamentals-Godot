extends KinematicBody2D

var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")


	
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")
	
func _colliding(area):
	# randomise
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(1.0, 50000.0)
	# only if hard mode do this
	if GlobalVariables.hardMode:
		# if in right go left at x speed
		if area.is_in_group("right"):
			get_parent().global_position.y += 10
			get_parent().speed = -my_random_number
		# if in left go right at x speed
		if area.is_in_group("left"):
			get_parent().global_position.y += 10
			get_parent().speed = my_random_number
	# if not hard mode do
	else:
		# if in right go left at x speed
		if area.is_in_group("right"):
			get_parent().global_position.y += 10
			get_parent().speed = -200
		# if in left go right at x speed
		if area.is_in_group("left"):
			get_parent().global_position.y += 10
			get_parent().speed = 200


func _process(delta):
#	while (true):
	# randomise number
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(2.0, 30.0)
	#print("time: ",my_random_number)
	yield(get_tree().create_timer(my_random_number), "timeout")
	# only do when certain number of bullets on screen
	if GlobalVariables.enemyBulletInstanceCount < 5:
		var bulletInstance = bullet.instance()
		
		bulletInstance.position = Vector2(global_position.x, global_position.y+20)
		get_tree().get_root().add_child(bulletInstance)
