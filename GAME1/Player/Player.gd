extends KinematicBody2D
class_name Player

const MAX_SPEED:= 200.0
const ACCELERATION:= 500.0
const FRICTION := 100.0

var input_direction := Vector2.ZERO
var move_vector := Vector2.ZERO
var speed := 0.0

func _physics_process(delta: float) -> void:
	get_input()
	move(delta)

func get_input() -> void:
	input_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")

func move(delta: float) -> void:
	if input_direction != Vector2.ZERO:
		speed = move_toward(speed, MAX_SPEED, ACCELERATION * delta)
		move_vector = input_direction
	else:
		speed = move_toward(speed, 0, FRICTION * delta)
	move_and_slide(move_vector * speed)
