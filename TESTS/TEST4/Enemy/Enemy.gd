extends KinematicBody2D

var is_moving = false
onready var start_pos = get_parent().get_node("StartPos").global_position

func _process(delta):
	
	if is_moving == false:
		global_position = global_position.move_toward(start_pos, 1)
	is_moving = false

func move(delta):
	is_moving = true
	var player = get_parent().get_node("Player")
	global_position = global_position.move_toward(player.global_position, 100 * delta)
