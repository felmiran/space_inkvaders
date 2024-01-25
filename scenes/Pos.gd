extends Marker2D

@export var bgnd_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	#print(velocity)
	
	### CASE 1: Controlling direction with arrows 
	# ↓ in case you press e.g. up+right, movement would be faster than 
	# pressing only 1 direction. So we normalize this shit
	if velocity.length() > 0:  
		velocity = velocity.normalized() * bgnd_speed
		
	position += velocity * delta
	#print(position)
	
	if velocity.length() > 0:  
		$markerSprite.play("move")
		$markerSprite.set_rotation(velocity.angle() - PI/2)
	else:
		$markerSprite.animation = "still"
