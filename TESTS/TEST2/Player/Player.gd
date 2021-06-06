extends KinematicBody2D

var move_speed = 500
var bullet_speed = 2000
var bullet = preload("res://Bullet/Bullet.tscn")


func _physics_process(delta):
	var motion = Vector2()
	
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	motion = motion.normalized()
	motion = move_and_slide(motion * move_speed)
	look_at(get_global_mouse_position())
	
	if(Input.is_action_just_pressed("Shoot")):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated((rotation)))
	get_tree().get_root().call_deferred("add_child",bullet_instance)
