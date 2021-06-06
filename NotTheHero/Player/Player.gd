extends KinematicBody2D

export (int) var ACCELERATION = 500
export (int) var MAX_SPEED = 80
export (int) var FRICTION = 500

var motion = Vector2.ZERO

func _physics_process(delta):
	move(delta)

func move(delta):
	var input_vector = get_input().normalized()
	if input_vector != Vector2.ZERO:
		motion = motion.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
	motion = move_and_slide(motion)
func get_input():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input_vector
