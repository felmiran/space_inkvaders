extends Node

var score

func _ready():
	new_game()
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	score = 0
	$Player.start()
	

