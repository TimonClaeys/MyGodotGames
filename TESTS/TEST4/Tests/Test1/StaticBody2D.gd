extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():



func _process(delta):
	var point = $Node2D/RayCast2D.get_collision_point()
	$Node2D/RayCast2D.set_cast_to($StaticBody2D.global_position - $Node2D/RayCast2D.global_position)
	$Node2D.rotation_degrees += 1
	$Node2D/RayCast2D.rotation_degrees -= 1
	if point:
		$Line2D.add_point(point)


func _on_Timer_timeout():
	pass
	
