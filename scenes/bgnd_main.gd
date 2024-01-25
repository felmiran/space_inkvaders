extends Node2D

var direction  = Vector2(0,1)
@export var bgnd_speed = 100
@export var bgnd_rot_speed = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$ParallaxBackground.scroll_offset += direction * bgnd_speed * delta
	pass
