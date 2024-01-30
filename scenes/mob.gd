extends Area2D

var velocity
@export var speed = 60 # How fast the player will move (pixels/sec).
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
	position.x = rng.randi_range(0, screen_size[0])
	position.y = rng.randi_range(0, screen_size[1])
	$AnimatedSprite2D.set_rotation(velocity.angle() - PI/2)

#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity.normalized() * speed * delta

func _on_body_entered(body):
	# hide() # Player disappears after being hit.
	# hit.emit()
	# Must be deferred as we can't change physics properties on a 
	# physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	pass

