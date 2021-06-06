extends RigidBody2D

var jump_power = 2000

func _physics_process(delta):
	if Input.action_press("jump"):
		apply_central_impulse(Vector2(0,-100) * jump_power)
