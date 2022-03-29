extends KinematicBody2D

var movement_speed = 420
var vertical_speed = 10
var bulletSource = preload ("res://Bullet/Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x <= -37:
			position.x = 1298.94
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x >= 1298.94:
			position.x = -37
		move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(vertical_speed * delta, -10))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(vertical_speed * delta, 10))
	if Input.is_action_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-20)
		get_tree().get_root().add_child(bulletInstance)
	# original broken code was:
	# if position.x <= (10):
	#     move_and_collide(Vector2(movement_speed * delta, 0))
	# if position.x <= (-10):
	#     move_and_collide(Vector2(movement_speed * delta, 0))
	# I had also tried in other ways but none worked



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
