#extends Area2D
extends Node2D

# @export hace q la variable aparezca como editable en el Inspector --->
@export var speed = 60 # How fast the player will move (pixels/sec).
@export var start_distance = 600
var theta
var rng = RandomNumberGenerator.new()
var screen_size # Size of the game window.

signal is_dead

func _ready():
	screen_size = get_viewport_rect().size
	theta = rng.randf_range(0, 2 * PI)
	position.x = start_distance * cos(theta)
	position.y = start_distance * sin(theta)
	#position = $StartPosition.position
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
	# position = position.clamp(Vector2.ZERO, screen_size)

func _on_hitbox_component_area_entered(body):
	$HitboxComponent.handle_collision(body)
	
	if not $HealthComponent.has_health_remaining:
		is_dead.emit()
	
	#hide() # Player disappears after being hit.
	# Must be deferred as we can't change physics properties on a 
	# physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	

func start():
	show()
	#$HitboxComponent/CollisionShape2D.disabled = false
