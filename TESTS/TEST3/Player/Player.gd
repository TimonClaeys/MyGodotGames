extends KinematicBody2D

var input_vector = Vector2.ZERO
var direction = Vector2.ZERO
var move_speed = 200
var turn_speed = 0.1


func _ready():
	pass


func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	direction = direction.move_toward(input_vector, turn_speed)
	
	if direction:
		move_speed = 200
		direction = direction.normalized()
		animator()
		input_vector = move_and_slide(direction * move_speed)
		print(direction)
	else:
		move_speed = 0


func _process(delta):
	$TankGun.look_at(get_global_mouse_position())
	$TankGun.rotation_degrees += 90


func animator():
	$TankBase.rotation = direction.angle()
	$TankBase.rotation_degrees +=90
