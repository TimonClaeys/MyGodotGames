extends Node2D


func _ready():
	for x in 500:
		var y = sin(x)
		x = x * 10
		y = y * 10
		$Line2D.add_point(Vector2(x, y))
		
