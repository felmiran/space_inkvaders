extends Node

var score

func _ready():
	#new_game()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_player_is_dead():
	game_over()
	
func new_game():
	score = 0
	$Player.start()
	
func game_over():
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
	pass


