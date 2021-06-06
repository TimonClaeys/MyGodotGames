extends KinematicBody2D


enum {MOVE, DASH}
const MAX_SPEED = 200
const ACCELERATION = 20
const FRICTION = 10

var state = MOVE
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO
var direction = Vector2.ZERO


func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		DASH:
			dash_state(delta)
	move_and_slide(velocity)


func move_state(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)


func dash_state(delta):
	velocity = velocity.move_toward(input_vector * MAX_SPEED * 2, ACCELERATION *10)

