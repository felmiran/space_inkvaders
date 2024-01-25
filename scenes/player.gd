extends Area2D

# @export hace q la variable aparezca como editable en el Inspector --->
@export var speed = 60 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
signal hit

func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	### CASE 1: Controlling direction with arrows 
	# ↓ in case you press e.g. up+right, movement would be faster than 
	# pressing only 1 direction. So we normalize this shit
	if velocity.length() > 0:  
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play("chopper_move")
		$AnimatedSprite2D.set_rotation(velocity.angle() - PI/2)
	else:
		$AnimatedSprite2D.animation = "chopper_still"
	
	### CASE 2: Controlling direction with mouse pointer
	# TODO ...
	
	position += velocity * delta
	# ↓ es como un clip pa q no se salga de la pantalla. 
	# Aca podemos jugar pa q aparezca al otro lado
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a 
	# physics callback.
	$CollisionShape2D.set_deferred("disabled", true)


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false