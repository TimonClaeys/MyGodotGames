extends Sprite

func change_state(var is_alive):
	if is_alive:
		frame = 0
	else:
		frame = 1
