extends Node2D

var mouse_location = Vector2.ZERO
export var grid_color = Color.lightgray
export var color_dead = Color.white
export var color_alive = Color.black

var generation = 0
var grid  = []

func _ready():
	initialize_grid()
	grid[7][4] = true
	grid[5][5] = true
	grid[7][5] = true
	grid[6][6] = true
	grid[6][7] = true
	
	grid[10][10] = true
	grid[10][11] = true
	grid[10][12] = true

func _process(delta):
	print(get_global_mouse_position().floor())
	if Input.is_action_pressed("add"):
		grid[get_global_mouse_position().floor().x][get_global_mouse_position().floor().y] = true
		update()
	
	if Input.is_action_pressed("delete"):
		grid[get_global_mouse_position().floor().x][get_global_mouse_position().floor().y] = false
		update()

	if Input.is_action_just_pressed("start"):
		start_stop_timer()
	
	if Input.is_action_just_pressed("clear"):
		for x in 100:
			for y in 100:
				grid[x][y] = false
		update()

func start_stop_timer():
	if $Timer.is_stopped() == true:
		$Timer.start()
		color_alive = Color.black
		update()
	else:
		$Timer.stop()
		color_alive = Color.red
		update()

func initialize_grid():
	for x in 100:
		grid.append([])
		for y in 100:
			grid[x].append(false)

func _draw():
	for x in range(100):
		for y in range(100):
			if grid[x][y]:
				draw_colored_polygon([Vector2( x, y), Vector2(x + 1, y), Vector2(x + 1, y + 1), Vector2(x, y + 1)], color_alive)
			else:	
				draw_colored_polygon([Vector2( x, y), Vector2(x + 1, y), Vector2(x + 1, y + 1), Vector2(x, y + 1)], color_dead)
	for x in 100:
		draw_line(Vector2(x,0), Vector2(x,100),grid_color, 1, false)
	for x in 100:
		draw_line(Vector2(0, x), Vector2(100, x),grid_color, 1, false)

func calculate_dead_or_alive():
	var neigbours = 0
	var grid_clone = grid.duplicate(true)
	for x in range(99):
		for y in range(99):
			for a in range(-1, 2):
				for b in (range(-1, 2)):
					if grid_clone[x + a][y + b]:
						if  x + a != x or y + b != y:
							neigbours += 1
			if grid_clone[x][y]:
				if neigbours == 3 or neigbours == 2:
					grid[x][y] = true
				else: 
					grid[x][y] = false
			else:
				if neigbours == 3:
					grid[x][y] = true
				else:
					grid[x][y] = false
			neigbours = 0


func _on_Timer_timeout():
	calculate_dead_or_alive()
	update()
