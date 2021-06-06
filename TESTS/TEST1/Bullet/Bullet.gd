extends KinematicBody2D
var speed = 1000
var move_vector = Vector2(0,-1)

func _physics_process(delta):
	move_and_slide(move_vector * speed).rotated(220)


func _ready():
	$BulletRemove.start()


func _on_BulletRemove_timeout():
	queue_free()
