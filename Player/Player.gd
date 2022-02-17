extends KinematicBody2D

var movement_speed = 420
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x <= -37:
			print("https://www.youtube.com/watch?v=eBGIQ7ZuuiU")
			position.x = 1298.94
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x >= 1298.94:
			print("https://www.youtube.com/watch?v=iik25wqIuFo")
			position.x = -37
		move_and_collide(Vector2(movement_speed * delta, 0))
	# original broken code was:
	# if position.x <= (10):
	#     move_and_collide(Vector2(movement_speed * delta, 0))
	# if position.x <= (-10):
	#     move_and_collide(Vector2(movement_speed * delta, 0))
	# I had also tried in other ways but none worked



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
