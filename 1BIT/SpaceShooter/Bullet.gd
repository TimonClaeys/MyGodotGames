extends RigidBody2D

const HitEffect = preload("res://HitEffect.tscn")

onready var bulletSound = $BulletSound

func _ready():
	bulletSound.play()


func create_hit_effect():
	var main = get_tree().current_scene
	var hitEffect = HitEffect.instance()
	main.add_child(hitEffect)
	hitEffect.global_position = global_position
