extends Node

var mob = preload("res://scenes/mob.tscn")

@export var mean_freq: float = 1  # mean mobs/s
@export var std_freq:float = 1   # std mobs/s
@export var mob_speed = 60

var rng = RandomNumberGenerator.new()
var curr_time = 0.0
var spawn_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_time = rng.randfn(mean_freq, std_freq)
	var mob = $Mob
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# create random number to compare to elapsed time 
	curr_time += delta
	if curr_time > spawn_time:
		spawn_mob()
		spawn_time = rng.randfn(mean_freq, std_freq)
		curr_time = 0.0
	
func spawn_mob():
	var new_mob = mob.instantiate()
	new_mob.speed = mob_speed
	add_child(new_mob)
		 
