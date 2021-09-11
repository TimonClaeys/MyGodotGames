extends KinematicBody2D

export (int) var speed = 600
export (int) var jump_speed = -1800
export (int) var gravity = 4000

var velocity = Vector2.ZERO

func get_input():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

func _physics_process(delta):
#	print($RayCast2D.get_collider())
	get_input()
	move_and_slide(velocity * speed)

func _process(delta):
	var enemy = get_parent().get_node("Enemy")
	$RayCast2D.set_cast_to(enemy.global_position - global_position)
	var intersect = $RayCast2D.get_collision_point()
	var collider = $RayCast2D.get_collider()
	print(collider)
	$Line2D.set_point_position(1, intersect - global_position)
	if collider == enemy:
		print("true")
		get_tree().call_group("Enemy", "move")
