extends Node2D

export var rows = 5
export var col = 5
onready var Cell = preload("res://Cell/Cell.tscn")
#var x = 0
#var y = 0

func _ready():
	for x in range(0, 800 , 16):
		for y in range(0, 800, 16):
			var cell = Cell.instance()
			add_child(cell)
			cell.global_position = Vector2(x,y)
	pass


#func _on_Timer_timeout():
#	x = x + 16
#	if x == 800:
#		x = 0
#		y = y + 16
#	if y == 800: $Timer.stop()
#	var cell = Cell	.instance()
#	add_child(cell)
#	cell.global_position = Vector2(x,y)
#	pass
