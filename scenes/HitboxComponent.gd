class_name HitboxComponent

extends Area2D

@export var health_component: HealthComponent
@export var attack_component: AttackComponent

func handle_collision(body: HitboxComponent):
	"""
	Function that receives another body as an input and deals and/or
	receives damage to/from that body. Generally applied when the body
	entered this hitbox.
	"""
	# receiving damage only if I have a health_component and the
	# body has an attack component
	if body.attack_component and health_component:
		var damage = body.attack_component.attack_damage
		health_component.receive_damage(damage)
		print(health_component.health)
	
		# knockback
		var knockback = body.attack_component.knockback_force
	
	# dealing damage is not necessary because it is handled 
	# by the other body as these two enter contact
	
		

func _physics_process(delta):
	pass
