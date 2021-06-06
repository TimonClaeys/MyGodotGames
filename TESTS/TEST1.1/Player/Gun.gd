extends Node2D

var scene
var instance

func _ready():
	scene = load("res://Bullet/Bullet.tscn")



func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		_on_ShootSpeed_timeout()
		$ShootSpeed.start()
	if Input.is_action_just_released("shoot"):
		$ShootSpeed.stop()


func _on_ShootSpeed_timeout():
	print("----------------------")
	for i in get_child_count():
		instance = scene.instance()
		if get_child(i) is Position2D:
			instance.position = get_child(i).get_global_position()
			print("added")
			get_tree().get_root().call_deferred("add_child",instance)
