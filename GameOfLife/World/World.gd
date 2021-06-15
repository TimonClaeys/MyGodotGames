extends Node2D

var grid = []
var with = 100
var height = 100
onready var Cell = preload("res://Cell/Cell.tscn")

func _ready():
	initialize_grid()
	fill_grid()

func initialize_grid():
	for x in with:
		grid.append([])
		for y in height:
			grid[x].append(false)

func fill_grid():
	for x in range(grid.size()):
		for y in range(grid.size()):
			var cell = Cell.instance()
			add_child(cell)
			cell.global_position = Vector2(x,y)

func change_state()
