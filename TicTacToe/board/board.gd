extends Node2D

onready var buttons = $Buttons.get_children()

var player
var player_x
var player_o
var possible_players = ["x", "o"]
var board = []
var is_winner = false
var game_over = false

func _ready():
	get_textures()
	innitiate_board()
	initiate_player()

func _on_button_pressed():
	if empty():
		make_move()
		change_board()
		check_gameover()
		change_player()

func get_textures():
	player_x = $Buttons/Button1.texture_normal
	player_o = $Buttons/Button2.texture_normal

func innitiate_board():
	board = [
		"0", "0", "0",
		"0", "0", "0",
		"0", "0", "0",
	]
	for button in buttons:
		button.texture_normal = null

func initiate_player():
	randomize()
	possible_players.shuffle()
	player = possible_players[0]


func what_button_pressed():
	for button in buttons:
		if button.pressed == true:
			return button

func empty():
	if what_button_pressed().texture_normal == null:
		return true
	else:
		return false

func make_move():
	if player == "x":
		what_button_pressed().texture_normal = player_x 
	else:
		what_button_pressed().texture_normal = player_o

func change_player():
	if player == "x":
		player = "o"
	else:
		player = "x"

func change_board():
	board[buttons.find(what_button_pressed())] = player
	print(board)

func check_gameover():
	if is_row_matched() or is_col_matched() or is_diag_matched():
		print(player + " won")
		game_over = true
	elif is_board_full():
		print("Draw")
		game_over = true

func is_row_matched():
	var offset = 0
	for row in range(3):
		for index in range(0 + offset, 3 + offset):
			if board[index] == player:
				is_winner = true
			else: 
				is_winner = false
				break
		if is_winner:
			return true
		offset += 3
	return false

func is_col_matched():
	var offset = 0
	for col in range(3):
		for index in range(0 + offset, 7 + offset, 3):
			if board[index] == player:
				is_winner = true
			else:
				is_winner = false
				break
		if is_winner:
			return true
		offset += 1
	return false
	
func is_diag_matched():
	for i in range(0, 9, 4):
		if board[i] == player:
			is_winner = true
		else:
			is_winner = false
			break
	if is_winner:
		return true
	for i in range(2, 7, 2):
		print(i)
		if board[i] == player:
			is_winner = true
		else:
			is_winner = false
			break
	if is_winner:
		return true
	return false

func is_board_full():
	if board.has("0"): return false
	return true
