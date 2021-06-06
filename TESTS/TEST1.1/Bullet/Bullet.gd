extends KinematicBody2D
var speed = 1000
var move_vector = Vector2(0,-1)

func _physics_process(delta):
	var collision_data = move_and_slide(move_vector * speed)


func _ready():
	$BulletRemove.start()


func _on_BulletRemove_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Enemy":
		body.queue_free()
		queue_free()
