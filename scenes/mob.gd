class_name Mob

extends Node2D

var velocity
@export var speed = 60 # How fast the player will move (pixels/sec).
@export var start_position_x: int
@export var start_position_y: int
var screen_size
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	# animation
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	# declaring start position
	screen_size = get_viewport_rect().size
	velocity = Vector2(rng.randf_range(-1,1), rng.randf_range(-1,1))
	
	if start_position_x:
		position.x = start_position_x
	else:
		position.x = rng.randi_range(0, screen_size[0])
	if start_position_y:
		position.y = start_position_y
	else:
		position.y = rng.randi_range(0, screen_size[1])
	$AnimatedSprite2D.set_rotation(velocity.angle() - PI/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity.normalized() * speed * delta
	
func _on_hitbox_component_area_entered(body):
	print("entered_hitbox")
	print(body)
	$HitboxComponent.handle_collision(body)
